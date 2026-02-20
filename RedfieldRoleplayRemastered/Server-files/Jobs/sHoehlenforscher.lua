local GoldbarrenPreis = math.random(3000,5000)

-- [[ MARKER LADEN ]] --

for _,v in pairs(Hoehlenforscher["MarkerPositions"])do
	local marker = createMarker(v[1],v[2],v[3],"corona",1,255,255,255,100)
	
	addEventHandler("onMarkerHit",marker,function(player)
		if(not(isPedInVehicle(player)) and isPedOnGround(player))then
			if(getElementDimension(player) == getElementDimension(source))then
				if(getElementData(player,"Job") == "Hoehlenforscher")then
					if(getElementData(source,"SpielerImMarker") ~= true)then
						setElementData(source,"SpielerImMarker",true)
						setElementData(player,"HoehlenforscherMarker",source)
						setElementPosition(player,v[1],v[2],v[3])
						setPedRotation(player,v[4])
						giveWeapon(player,5,1,true)
						setElementFrozen(player,true)
						toggleAllControls(player,false)
						bindKey(player,"j","down",Hoehlenforscher.start)
						bindKey(player,"backspace","down",Hoehlenforscher.stop)
						infobox(player,loc(player,"Jobs_47"),"info")
					else infobox(player,loc(player,"Jobs_48"),"error")end
				else infobox(player,loc(player,"Jobs_49"),"error")end
			end
		end
	end)
end

-- [[ STARTEN (SPITZHACKE) ]] --

function Hoehlenforscher.start(player)
	if(not(isTimer(Hoehlenforscher.timer[player])))then
		toggleControl(player,"next_weapon ",false)
		toggleControl(player,"previous_weapon",false)
		setPedAnimation(player,"baseball","Bat_1")
		triggerClientEvent(player,"Moon.sound",player,"create")
		Hoehlenforscher.timer[player] = setTimer(function(player)
			local golderz = math.random(1,2)
			setPedAnimation(player)
			infobox(player,loc(player,"Jobs_50"):format(golderz),"info")
			setElementData(player,"Golderz",getElementData(player,"Golderz")+golderz)
			setElementData(player,"HoehlenforscherPunkte",getElementData(player,"HoehlenforscherPunkte")+1)
			Levelsystem.givePoints(player,2)
			toggleControl(player,"next_weapon ",true)
			toggleControl(player,"previous_weapon",true)
		end,15000,1,player)
	end
end

-- [[ SCHMIED ]] --

addEvent("Hoehlenforscher.openSchmied",true)
addEventHandler("Hoehlenforscher.openSchmied",root,function()
	local result = dbPoll(dbQuery(handler,"SELECT * FROM schmied WHERE Username = '"..getPlayerName(client).."'"),-1)
	if(#result >= 1)then
		for _,v in pairs(result)do
			if(v["STime"] ~= 0 and v["STime"] - getSecTime(0) <= 0)then
				dbExec(handler,"UPDATE schmied SET Abholen = '1' WHERE Username = '"..getPlayerName(client).."'")
			end
		end
	end

	local tbl = {}
	local result = dbPoll(dbQuery(handler,"SELECT * FROM schmied WHERE Username = '"..getPlayerName(client).."'"),-1)
	if(#result >= 1)then
		for _,v in pairs(result)do
			table.insert(tbl,{v["STime"],v["Abholen"]})
		end
	end
	triggerClientEvent(client,"Hoehlenforscher.openSchmied",client,tbl)
end)

addEvent("Hoehlenforscher.schmied",true)
addEventHandler("Hoehlenforscher.schmied",root,function(text)
	if(getElementData(client,"HoehlenforscherPunkte") >= 150)then
		if(text == "Dem Schmied 50 Golderz geben")then
			if(getElementData(client,"Golderz") >= 50)then
				setElementData(client,"Golderz",getElementData(client,"Golderz")-50)
				dbExec(handler,"INSERT INTO schmied (Username,STime) VALUES ('"..getPlayerName(client).."','"..getSecTime(1).."')")
				infobox(client,loc(client,"Jobs_51"),"info")
				triggerClientEvent(client,"setWindowDatas",client)
			else infobox(client,loc(client,"Jobs_52"),"error")end
		elseif(text == "Goldbarren an dich nehmen")then
			if(getPlayerData("schmied","Username",getPlayerName(client),"Abholen") == 1)then
				dbExec(handler,"DELETE FROM schmied WHERE Username = '"..getPlayerName(client).."'")
				setElementData(client,"Goldbarren",getElementData(client,"Goldbarren")+5)
				triggerClientEvent(client,"setWindowDatas",client)
				infobox(client,loc(client,"Jobs_53"),"info")
			end
		end
	else infobox(client,loc(client,"Jobs_54"),"error")end
end)

-- [[ JOB BEENDEN ]] --

function Hoehlenforscher.stop(player)
	if(isTimer(Hoehlenforscher.timer[player]))then killTimer(Hoehlenforscher.timer[player])end
	setPedAnimation(player)
	setElementFrozen(player,false)
	toggleAllControls(player,true)
	takeWeapon(player,5)
	unbindKey(player,"j","down",Hoehlenforscher.start)
	unbindKey(player,"backspace","down",Hoehlenforscher.stop)
	triggerClientEvent(player,"Moon.sound",player)
	if(getElementData(player,"HoehlenforscherMarker") and getElementData(player,"Hoehlenforscher") ~= nil)then
		local marker = getElementData(player,"HoehlenforscherMarker")
		setElementData(marker,"SpielerImMarker",false)
		setElementData(player,"HoehlenforscherMarker",nil)
	end
end

-- [[ GOLDBARREN VERKAUFEN ]] --

addEvent("Hoehlenforscher.sellGoldbarren",true)
addEventHandler("Hoehlenforscher.sellGoldbarren",root,function(menge)
	local menge = tonumber(menge)
	if(getElementData(client,"Goldbarren") >= menge)then
		local preis = menge * GoldbarrenPreis
		setElementData(client,"Goldbarren",getElementData(client,"Goldbarren")-menge)
		setElementData(client,"Geld",getElementData(client,"Geld")+preis)
		infobox(client,loc(client,"Jobs_55"):format(menge,preis),"info")
	else infobox(client,loc(client,"Jobs_56"),"error")end
end)

addEvent("getGoldbarrenPreis",true)
addEventHandler("getGoldbarrenPreis",root,function()
	triggerClientEvent(client,"setGoldbarrenPreis",client,GoldbarrenPreis)
end)

-- [[ WAS PASSIERT, WENN SPIELER STIRBT / QUITTET ]] --

addEventHandler("onPlayerQuit",root,function() Hoehlenforscher.stop(source) end)
addEventHandler("onPlayerWasted",root,function() Hoehlenforscher.stop(source) end)