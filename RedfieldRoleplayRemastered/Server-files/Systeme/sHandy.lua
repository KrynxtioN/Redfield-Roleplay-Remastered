-- [[ ANRUFEN ]] --

addEvent("Handy.anrufen",true)
addEventHandler("Handy.anrufen",root,function(nr)
	local nr = tonumber(nr)
	local target = nil
	
	if(nr ~= getElementData(client,"Handynummer"))then
		for _,v in pairs(getElementsByType("player"))do
			if(getElementData(v,"loggedin") == 1)then
				if(getElementData(v,"Handy") == 1 and getElementData(v,"Handynummer") == nr)then
					target = v
					break
				end
			end
		end
		
		if(target ~= nil)then
			if(getElementData(target,"Handystatus") == "on")then
				if(getElementData(target,"Telefonpartner") == false and getElementData(target,"WirdAngerufen") == false)then
					setElementData(target,"Telefonpartner",getPlayerName(client))
					setElementData(client,"Telefonpartner",getPlayerName(target))
					setElementData(target,"WirdAngerufen",true)
					setElementData(client,"RuftAn",true)
					triggerClientEvent(target,"Handy.createSound",target)
					triggerClientEvent(client,"Handy.destroyGUIElements",client)
					if(getElementData(client,"AnTelefonzelle"))then
						setElementData(client,"AnTelefonzellenPhone",true)
						triggerClientEvent(client,"setWindowDatas",client)
						infobox(client,loc(client,"Systeme_345"):format(getElementData(client,"Telefonpartner")),"info")
						setElementFrozen(client,true)
						toggleAllControls(client,false)
						toggleControl(client,"chatbox",true)
					end
				else infobox(client,loc(client,"Systeme_346"),"error")end
			else infobox(client,loc(client,"Systeme_347"),"error")end
		else infobox(client,loc(client,"Systeme_348"),"error")end
	else infobox(client,loc(client,"Systeme_349"),"error")end
end)

-- [[ ABHEBEN ]] --

addEvent("Handy.abheben",true)
addEventHandler("Handy.abheben",root,function()
	if(getElementData(client,"Telefonpartner") ~= false)then
		local target = getPlayerFromName(getElementData(client,"Telefonpartner"))
		if(isElement(target))then
			setElementData(target,"WirdAngerufen",false)
			setElementData(target,"RuftAn",false)
			setElementData(client,"WirdAngerufen",false)
			setElementData(client,"RuftAn",false)
			if(getElementData(target,"AnTelefonzelle") == true)then
				infobox(target,loc(target,"Systeme_350"):format(getPlayerName(client)),"info")
				Handy.timer[target] = setTimer(function(target)
					if(getElementData(target,"Geld") >= 1)then
						setElementData(target,"Geld",getElementData(target,"Geld")-10)
					else
						Handy.stopTelefonat(target)
					end
				end,60000,1,target)
			end
		end
	end
end)

-- [[ SMS VERSCHICKEN ]] --

addEvent("Handy.SMS",true)
addEventHandler("Handy.SMS",root,function(nr,text)
	local nr = tonumber(nr)
	local target = nil
	
	if(nr ~= getElementData(client,"Handynummer"))then
		for _,v in pairs(getElementsByType("player"))do
			if(getElementData(v,"loggedin") == 1)then
				if(getElementData(v,"Handy") == 1 and getElementData(v,"Handynummer") == nr)then
					target = v
					break
				end
			end
		end
		
		if(target ~= nil)then
			if(getElementData(target,"Handystatus") == "on")then
				infobox(client,loc(client,"Systeme_352"),"info")
				outputChatBox(loc(target,"Systeme_352"):format(getPlayerName(client),getElementData(client,"Handynummer"),text),target,255,255,0)
			else infobox(client,loc(client,"Systeme_353"),"error")end
		else infobox(client,loc(client,"Systeme_354"),"error")end
	else infobox(client,loc(client,"Systeme_355"),"error")end
end)

-- [[ WAFFEN BESTELLEN ]] --

addEvent("Handy.waffenBestellen",true)
addEventHandler("Handy.waffenBestellen",root,function(waffen,preis)
	local preis = tonumber(preis)
	if(hasMoney(client,preis))then
		if(getElementDimension(client) == 0 and getElementInterior(client) == 0)then
			if(isPedOnGround(client) and not(isElementInWater(client)))then
				takeMoney(client,preis)
				local x,y,z = getElementPosition(client)
				local schirm = createObject(2903,x,y,z + 50)
				local box = createObject(2358,x,y,z + 50)
				setObjectScale(box,3.0)
				attachElements(box,schirm,0,0,-7.68)
				moveObject(schirm,10000,x,y,z + 7)
				infobox(client,loc(client,"Systeme_356"),"info")
				
				setTimer(function(schirm,box,x,y,z,waffen)
					Handy.id = Handy.id + 1
					destroyElement(schirm)
					destroyElement(box)
					Handy.pickups[Handy.id] = createPickup(x,y,z,3,2358,50)
					setElementData(Handy.pickups[Handy.id],"HandyWaffenTable",waffen)
					setElementData(Handy.pickups[Handy.id],"HandyID",Handy.id)
					Handy.timer[Handy.id] = setTimer(function(id)
						if(isElement(Handy.pickups[id]))then
							destroyElement(Handy.pickups[id])
						end
					end,300000,1,Handy.id)
					
					addEventHandler("onPickupHit",Handy.pickups[Handy.id],function(player)
						if(not(isPedInVehicle(player)))then
							if(getElementDimension(player) == 0 and getElementInterior(player) == 0)then
								local ID = getElementData(source,"HandyID")
								local Weapons = getElementData(source,"HandyWaffenTable")
								if(isTimer(Handy.timer[ID]))then killTimer(Handy.timer[ID])end
								for _,v in pairs(Weapons)do
									if(v[1] == "Weste")then
										setPedArmor(player,100)
									else
										giveWeapon(player,Ammunation["ID"][v[1]][1],Ammunation["ID"][v[1]][2],true)
									end
								end
								destroyElement(source)
								infobox(player,loc(player,"Systeme_357"),"info")
							end
						end
					end)
				end,10000,1,schirm,box,x,y,z,waffen)
			else infobox(client,loc(client,"Systeme_358"),"error")end
		else infobox(client,loc(client,"Systeme_359"),"error")end
	end
end)

-- [[ TELEFON BEENDEN ]] --

function Handy.stopTelefonat(player)
	if(getElementData(player,"Telefonpartner") ~= false)then
		local target = getPlayerFromName(getElementData(player,"Telefonpartner"))
		if(isElement(target))then
			setElementData(target,"Telefonpartner",false)
			setElementData(target,"WirdAngerufen",false)
			setElementData(target,"RuftAn",false)
			triggerClientEvent(target,"Handy.setHandyseite",target,1)
			if(isTimer(Handy.timer[target]))then killTimer(Handy.timer[target])end
			if(getElementData(target,"AnTelefonzelle") == true)then
				setElementData(target,"AnTelefonzelle",false)
				toggleAllControls(target,true)
				setElementFrozen(target,false)
				setElementData(target,"AnTelefonzellenPhone",false)
			end
			infobox(player,loc(player,"Systeme_360"),"info")
		end
		setElementData(player,"Telefonpartner",false)
		setElementData(player,"WirdAngerufen",false)
		setElementData(player,"RuftAn",false)
		triggerClientEvent(player,"Handy.setHandyseite",player,1)
		if(isTimer(Handy.timer[player]))then killTimer(Handy.timer[player])end
		if(getElementData(player,"AnTelefonzelle") == true)then
			setElementData(player,"AnTelefonzelle",false)
			toggleAllControls(player,true)
			setElementFrozen(player,false)
			setElementData(player,"AnTelefonzellenPhone",false)
			if(math.random(1,15) == 1)then
				infobox(player,loc(player,"Systeme_361"),"error")
				setElementData(getElementData(player,"ClickedTelefonzelle"),"Kaputt",true)
			end
		end
		infobox(player,loc(player,"Systeme_362"),"info")
	end
end
addEvent("Handy.stopTelefonat",true)
addEventHandler("Handy.stopTelefonat",root,Handy.stopTelefonat)
addCommandHandler("auflegen",Handy.stopTelefonat)

-- [[ WAS PASSIERT, WENN SPIELER STIRBT / QUITTET ]] --

addEventHandler("onPlayerQuit",root,function() Handy.stopTelefonat(source) end)
addEventHandler("onPlayerWasted",root,function() Handy.stopTelefonat(source) end)