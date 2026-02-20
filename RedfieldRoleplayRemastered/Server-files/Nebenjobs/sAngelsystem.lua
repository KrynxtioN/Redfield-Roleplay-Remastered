-- [[ MARKER ZUM ANGELN ERSTELLEN ]] --

for _,v in pairs(Angelsystem["Marker"])do
	local marker = createMarker(v[1],v[2],v[3]+0.1,"cylinder",1,0,255,0,150)
	
	addEventHandler("onMarkerHit",marker,function(player)
		if(not(isPedInVehicle(player)))then
			setElementPosition(player,v[1],v[2],v[3]+1)
			setPedRotation(player,v[4])
			toggleAllControls(player,false)
			bindKey(player,"j","down",Angelsystem.auswerfen)
			bindKey(player,"backspace","down",Angelsystem.beenden)
			infobox(player,loc(player,"Nebenjobs_15"),"info")
		end
	end)
end

-- [[ ANGEL AUSWERFEN ]] --

function Angelsystem.auswerfen(player)
	if(getElementData(player,"AngeltGerade") ~= true)then
		if(getElementData(player,"Angel") >= 1)then
			if(getElementData(player,"Angelhaken") >= 1)then
				if(getElementData(player,"Koeder") >= 1)then
					setElementData(player,"Angelhaken",getElementData(player,"Angelhaken")-1)
					setElementData(player,"Koeder",getElementData(player,"Koeder")-1)
					
					if(isElement(Angelsystem[player]))then destroyElement(Angelsystem[player])end
					Angelsystem[player] = createObject(338,0,0,0,0,0,0)
					attachElements(Angelsystem[player],player,0.2,0.5,0.4,50,0,160)
					local x,y,z = getElementPosition(player)
					setElementPosition(player,x,y,z+0.1)
					setTimer(function(player)
						setPedAnimation(player,"ped","gun_stand")
					end,250,1,player)
					setElementData(player,"AngeltGerade",true)
					Angelsystem.fang(player)
				else infobox(player,loc(player,"Nebenjobs_16"),"error")end
			else infobox(player,loc(player,"Nebenjobs_17"),"error")end
		else infobox(player,loc(player,"Nebenjobs_18"),"error")end
	end
end

-- [[ FISCH BEISST AN ]] --

function Angelsystem.fang(player)
	Angelsystem.timer[player] = setTimer(function(player)
		if(math.random(1,3) == 2)then
			infobox(player,loc(player,"Nebenjobs_19"),"info")
			triggerClientEvent(player,"Angelsystem.dxDraw",player,"create")
		else Angelsystem.fang(player)end
	end,3500,1,player)
end

-- [[ BEENDEN ]] --

function Angelsystem.beenden(player)
	unbindKey(player,"j","down",Angelsystem.auswerfen)
	unbindKey(player,"backspace","down",Angelsystem.beenden)
	if(isElement(Angelsystem[player]))then destroyElement(Angelsystem[player])end
	toggleAllControls(player,true)
	if(isTimer(Angelsystem.timer[player]))then killTimer(Angelsystem.timer[player])end
	triggerClientEvent(player,"Angelsystem.dxDraw",player)
	setElementData(player,"AngeltGerade",false)
	setPedAnimation(player)
end

-- [[ FISCH / KISTE GEBEN ]] --

addEvent("Angelsystem.fischen",true)
addEventHandler("Angelsystem.fischen",root,function()
	if(math.random(1,15) == 8)then
		infobox(client,loc(client,"Nebenjobs_20"),"info")
		setElementData(client,"Schatztruhe",getElementData(client,"Schatztruhe")+1)
	else
		local kg = math.random(1,7)
		infobox(client,loc(client,"Nebenjobs_21"):format(kg),"info")
		setElementData(client,"Fisch",getElementData(client,"Fisch")+1)
	end
	if(math.random(1,5) == 3)then
		setElementData(client,"Angel",getElementData(client,"Angel")-1)
		infobox(client,loc(client,"Nebenjobs_22"),"error")
	end
	destroyElement(Angelsystem[client])
	setElementData(client,"AngeltGerade",false)
	setPedAnimation(client)
end)

-- [[ ANGELLADEN ]] --

function Angelsystem.getDatas(player)
	local tbl = {}
	for _,v in pairs(Angelsystem["Laden"])do
		table.insert(tbl,{v,getPlayerData("angelladen","ID",getElementDimension(player),v),getPlayerData("angelladen","ID",getElementDimension(player),v.."Preis")})
	end
	triggerClientEvent(player,"Angelsystem.setDatas",player,tbl,getPlayerData("angelladen","ID",getElementDimension(player),"FischPreis"))
end
addEvent("Angelsystem.getDatas",true)
addEventHandler("Angelsystem.getDatas",root,Angelsystem.getDatas)

addEvent("Angelsystem.buy",true)
addEventHandler("Angelsystem.buy",root,function(artikel)
	local preis = getPlayerData("angelladen","ID",getElementDimension(client),artikel.."Preis")
	if(hasMoney(client,preis))then
		local old = getPlayerData("angelladen","ID",getElementDimension(client),artikel)
		if(getPlayerData("business","Databasename","Angelladen"..getElementDimension(client),"Besitzer") ~= "Niemand")then
			if(old < 1)then
				infobox(client,loc(client,"Nebenjobs_23"),"error")
				return false
			end
		end
		if(artikel == "OxygenFlasche")then
			if(getElementData(client,"OxygenFlasche") > 5000)then
				infobox(client,loc(client,"Nebenjobs_24"),"error")
				return false
			end
		end
		if(getPlayerData("business","Databasename","Angelladen"..getElementDimension(client),"Besitzer") ~= "Niemand")then
			dbExec(handler,"UPDATE angelladen SET "..artikel.." = '"..old-1 .."' WHERE ID = '"..getElementDimension(client).."'")
			addBizKasse("Angelladen"..getElementDimension(client),preis)
		end
		infobox(client,loc(client,"Nebenjobs_25"):format(artikel),"info")
		takeMoney(client,preis)
		addBizKasse("Angelladen"..getElementDimension(client),preis)
		if(artikel ~= "Oxygenflasche")then
			setElementData(client,artikel,getElementData(client,artikel)+1)
		else
			setElementData(client,"OxygenFlasche",getElementData(client,"OxygenFlasche")+1000)
			if(getElementData(client,"OxygenFlasche") > 5000)then
			setElementData(client,"OxygenFlasche",5000)
				end
		end
		Angelsystem.getDatas(client)
	end
end)

-- [[ FISCH VERKAUFEN ]] --

addEvent("Angelsystem.sellFisch",true)
addEventHandler("Angelsystem.sellFisch",root,function(menge)
	local menge = tonumber(menge)
	local preis = getPlayerData("angelladen","ID",getElementDimension(client),"FischPreis")
	local kasse = getPlayerData("business","Databasename","Angelladen"..getElementDimension(client),"Kasse")
	local fisch = getPlayerData("angelladen","ID",getElementDimension(client),"Fisch")
	if(kasse >= menge*preis)then
		if(getElementData(client,"Fisch") >= menge)then
			setElementData(client,"Fisch",getElementData(client,"Fisch")-menge)
			if(getPlayerData("business","Databasename","Angelladen"..getElementDimension(client),"Besitzer") ~= "Niemand")then
				dbExec(handler,"UPDATE business SET Kasse = '"..kasse - menge*preis.."' WHERE Databasename = 'Angelladen"..getElementDimension(client).."'")
				dbExec(handler,"UPDATE angelladen SET Fisch = '"..fisch + menge.."' WHERE ID = '"..getElementDimension(client).."'")
			end
			setElementData(client,"Geld",getElementData(client,"Geld")+menge*preis)
			infobox(client,loc(client,"Nebenjobs_26"):format(menge,menge*preis),"info")
		else infobox(client,loc(client,"Nebenjobs_27"),"error")end
	else infobox(client,loc(client,"Nebenjobs_28"):format(kasse),"error")end
end)

-- [[ WAS PASSIERT, WENN SPIELER STIRBT / QUITTET ]] --

addEventHandler("onPlayerQuit",root,function() Angelsystem.beenden(source)end)
addEventHandler("onPlayerWasted",root,function() Angelsystem.beenden(source)end)