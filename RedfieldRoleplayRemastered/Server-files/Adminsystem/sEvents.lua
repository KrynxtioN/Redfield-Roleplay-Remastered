-- [[ EVENT ANKÜNDIGEN ]] --

addEvent("Adminsystem.startEvent",true)
addEventHandler("Adminsystem.startEvent",root,function(eventName)
	if(isAdminLevel(client,5,0))then
		if(Adminsystem.event == false)then
			if(eventName == "Derby")then
				for _,v in pairs(Adminsystem["Derby"]["Spawn"])do
					local veh = createVehicle(v[1],v[2],v[3],v[4],v[5],v[6],v[7])
					setElementInterior(veh,v[8])
					setElementDimension(veh,2)
					setElementFrozen(veh,true)
					setElementData(veh,"EventFahrzeug",true)
					
					addEventHandler("onVehicleStartExit",veh,function(player)
						infobox(player,loc(player,"Adminsystem_66"),"info")
						cancelEvent()
					end)
				end
				infobox(client,loc(client,"Adminsystem_67"),"info")
			elseif(eventName == "Autorennen")then
				for _,v in pairs(Adminsystem["Autorennen"]["Spawn"])do
					local veh = createVehicle(v[1],v[2],v[3],v[4],v[5],v[6],v[7])
					setElementDimension(veh,2)
					setElementFrozen(veh,true)
					setElementData(veh,"EventFahrzeug",true)
					
					addEventHandler("onVehicleStartExit",veh,function(player)
						infobox(player,loc(player,"Adminsystem_68"),"info")
						cancelEvent()
					end)
				end
				infobox(client,loc(client,"Adminsystem_69"),"info")
			elseif(eventName == "Geldsacksuche")then
				if(Adminsystem["Geldsacksuche"].saeckeID >= 1)then
					for _,v in pairs(getElementsByType("player"))do
						if(getElementData(v,"loggedin") == 1)then
							outputChatBox(loc(v,"Adminsystem_70"):format(Adminsystem["Geldsacksuche"].saeckeID),v,255,255,255,true)
						end
					end
					infobox(client,loc(client,"Adminsystem_71"),"info")
				else infobox(client,loc(client,"Adminsystem_72"),"error")end
			else
				infobox(client,loc(client,"Adminsystem_73"),"info")
			end
			Adminsystem.event = eventName
			if(eventName ~= "Geldsacksuche")then
				for _,v in pairs(getElementsByType("player"))do
					if(getElementData(v,"loggedin") == 1)then
						outputChatBox(loc(v,"Adminsystem_74"):format(eventName,Adminsystem[eventName].maxplayers),v,255,255,255,true)
						outputChatBox(loc(v,"Adminsystem_75"),v,255,255,255,true)
					end
				end
			end
			outputLog(getPlayerName(client).." hat das Event "..Adminsystem.event.." gestartet.","Eventsystem")
		else infobox(client,loc(client,"Adminsystem_76"),"error")end
	end
end)

-- [[ GELDSACK PLATZIEREN ]] --

addCommandHandler("createMoneyBag",function(player)
	if(isAdminLevel(player,5,0))then
		if(Adminsystem["Geldsacksuche"].saeckeID < 3)then
			if(getElementInterior(player) == 0 and getElementDimension(player) and not(isElementInWater(player)) and isPedOnGround(player))then
				local x,y,z = getElementPosition(player)
				Adminsystem["Geldsacksuche"].saeckeID = Adminsystem["Geldsacksuche"].saeckeID + 1
				Adminsystem["Geldsacksuche"][Adminsystem["Geldsacksuche"].saeckeID] = createPickup(x,y,z,3,1550,50)
				setElementData(Adminsystem["Geldsacksuche"][Adminsystem["Geldsacksuche"].saeckeID],"Money",math.random(15000,20000))
				setElementData(Adminsystem["Geldsacksuche"][Adminsystem["Geldsacksuche"].saeckeID],"GeldsacksuchePickup",true)
				outputLog(getPlayerName(player).." hat einen Geldsack erstellt.","Eventsystem")
				
				addEventHandler("onPickupHit",Adminsystem["Geldsacksuche"][Adminsystem["Geldsacksuche"].saeckeID],function(player)
					if(not(isPedInVehicle(player)))then
						if(getElementData(player,"Adminlevel") == 0)then
							if(Adminsystem.event == "Geldsacksuche")then
								if(getElementDimension(player) == getElementDimension(source))then
									local money = getElementData(source,"Money")
									setElementData(player,"Geld",getElementData(player,"Geld")+money)
									infobox(player,loc(player,"Adminsystem_77"):format(money),"info")
									setPlayerAchievement(player,31)
									destroyElement(source)
									Adminsystem["Geldsacksuche"].saeckeID = Adminsystem["Geldsacksuche"].saeckeID - 1
									if(Adminsystem["Geldsacksuche"].saeckeID == 0)then
										for _,v in pairs(getElementsByType("player"))do
											if(getElementData(v,"loggedin") == 1)then
												outputChatBox(loc(v,"Adminsystem_78"),v,255,255,255,true)
											end
										end
									else
										for _,v in pairs(getElementsByType("player"))do
											if(getElementData(v,"loggedin") == 1)then
												outputChatBox(loc(v,"Adminsystem_79"):format(getPlayerName(player),Adminsystem["Geldsacksuche"].saeckeID),v,255,255,255,true)
											end
										end
									end
								end
							end
						end
					end
				end)
			else infobox(player,loc(player,"Adminsystem_80"),"error")end
		else infobox(player,loc(player,"Adminsystem_81"),"error")end
	end
end)

-- [[ ZUM EVENT GEHEN ]] --

addCommandHandler("gotoevent",function(player)
	if(getElementData(player,"Jailtime") == 0 and getElementData(player,"Prison") == 0)then
		if(not(Adminsystem.savePos[player]))then
			if(Adminsystem.event ~= false and Adminsystem.event ~= "Geldsacksuche")then
				if(Adminsystem[Adminsystem.event].players < Adminsystem[Adminsystem.event].maxplayers)then
					if(not(isPedInVehicle(player)) and getElementInterior(player) == 0 and getElementDimension(player) == 0)then
						local x,y,z = getElementPosition(player)
						Adminsystem[Adminsystem.event].players = Adminsystem[Adminsystem.event].players + 1
						Adminsystem.savePos[player] = {x,y,z}
						if(Adminsystem.event ~= "Wettschwimmen")then
							for _,v in pairs(getElementsByType("vehicle"))do
								if(getElementData(v,"EventFahrzeug") == true)then
									if(getVehicleOccupant(v) == false)then
										setElementInterior(player,getElementInterior(v))
										setElementDimension(player,getElementDimension(v))
										warpPedIntoVehicle(player,v)
										setElementData(v,"EventOwner",getPlayerName(player))
										break
									end
								end
							end
						else
							local counter = 0
							for _,v in pairs(getElementsByType("player"))do
								if(Adminsystem.savePos[v])then
									counter = counter + 1
									local tbl = Adminsystem[Adminsystem.event]["Spawn"][counter]
									setElementPosition(player,tbl[1],tbl[2],tbl[3])
									setElementDimension(player,2)
									setElementFrozen(player,true)
								end
							end
						end
						if(Adminsystem[Adminsystem.event].players <= 7)then
							for _,v in pairs(getElementsByType("player"))do
								if(getElementData(v,"loggedin") == 1)then
									outputChatBox(loc(v,"Adminsystem_82"):format(Adminsystem[Adminsystem.event].players,Adminsystem[Adminsystem.event].maxplayers),v,255,255,255,true)
								end
							end
						end
						if(Adminsystem[Adminsystem.event].players >= 8)then
							for _,v in pairs(getElementsByType("player"))do
								if(getElementData(v,"loggedin") == 1)then
									outputChatBox(loc(v,"Adminsystem_83"):format(Adminsystem.event),v,255,255,255,true)
								end
							end
							setTimer(Adminsystem.startEvent,60000,1)
						end
					else infobox(player,loc(player,"Adminsystem_84"),"error")end
				else infobox(player,loc(player,"Adminsystem_85"),"error")end
			end
		end
	else infobox(player,loc(player,"Adminsystem_86"),"error")end
end)

-- [[ EVENT STARTEN ]] --

function Adminsystem.startEvent()
	Adminsystem.eventStarted = true
	for _,v in pairs(getElementsByType("player"))do
		if(getElementData(v,"loggedin") == 1)then
			outputChatBox(loc(v,"Adminsystem_87"),v,255,255,255,true)
		end
	end
	for _,v in pairs(getElementsByType("player"))do
		if(Adminsystem.savePos[v])then
			if(isPedInVehicle(v))then
				setElementFrozen(getPedOccupiedVehicle(v),false)
			else
				setElementFrozen(v,false)
			end
			if(Adminsystem.event == "Autorennen" or Adminsystem.event == "Wettschwimmen")then
				setElementData(v,"EventMarkerID",0)
				triggerClientEvent(v,"Adminsystem.createEventMarker",v,"create",Adminsystem.event)
			end
		end
	end
	for _,v in pairs(getElementsByType("vehicle"))do
		if(getElementData(v,"EventFahrzeug") == true)then
			if(getVehicleOccupant(v) == false)then
				destroyElement(v)
			end
		end
	end
end

-- [[ EVENT STOPPEN ]] --

function Adminsystem.stopEvent(player)
	if(Adminsystem.event ~= false)then
		if(player)then
			infobox(player,loc(player,"Adminsystem_88"),"error")
		end
		for _,v in pairs(getElementsByType("vehicle"))do
			if(getElementData(v,"EventFahrzeug") == true)then
				destroyElement(v)
			end
		end
		for _,v in pairs(getElementsByType("player"))do
			Adminsystem.spawnAfterEvent(v)
			triggerClientEvent(v,"Adminsystem.createEventMarker",v)
		end
		for _,v in pairs(getElementsByType("object"))do
			if(getElementData(v,"GeldsacksuchePickup") == true)then
				destroyElement(v)
			end
		end
		Adminsystem[Adminsystem.event].players = 0
		Adminsystem.eventStarted = false
		Adminsystem.event = false
		
		for _,v in pairs(getElementsByType("player"))do
			if(getElementData(v,"loggedin") == 1)then
				outputChatBox(loc(v,"Adminsystem_88"),v,255,255,255,true)
			end
		end
	else
		if(player)then
			infobox(player,loc(v,"Adminsystem_89"),"error")
		end
	end
end
addEvent("Adminsystem.stopEvent",true)
addEventHandler("Adminsystem.stopEvent",root,Adminsystem.stopEvent)

-- [[ EVENT GEWONNEN ]] --

addEvent("Adminsystem.eventGewonnen",true)
addEventHandler("Adminsystem.eventGewonnen",root,function()
	for _,v in pairs(getElementsByType("player"))do
		if(getElementData(v,"loggedin") == 1)then
			outputChatBox(loc(v,"Adminsystem_90"):format(getPlayerName(client)),v,255,255,255,true)
		end
	end
	Adminsystem.stopEvent()
	setElementData(client,"Geld",getElementData(client,"Geld")+25000)
	outputLog(getPlayerName(client).." hat das Rennen gewonnen und $25.000 bekommen.","Eventsystem")
	Adminsystem.event = false
end)

-- [[ EVENT VERLASSEN ]] --

function Adminsystem.spawnAfterEvent(player)
	if(Adminsystem.savePos[player])then
		if(isPedInVehicle(player))then
			removePedFromVehicle(player)
		end
		local x,y,z = Adminsystem.savePos[player][1],Adminsystem.savePos[player][2],Adminsystem.savePos[player][3]
		setTimer(function(player,x,y,z)
			if(not(isPedDead(player)))then
				setElementPosition(player,x,y,z)
				setElementInterior(player,0)
				setElementDimension(player,0)
			end
		end,50,1,player,x,y,z)
		Adminsystem.savePos[player] = nil
		triggerClientEvent(player,"Adminsystem.createEventMarker",player)
		Adminsystem[Adminsystem.event].players = Adminsystem[Adminsystem.event].players - 1
		setElementFrozen(player,false)
	end
end
addCommandHandler("leaveevent",Adminsystem.spawnAfterEvent)

-- [[ WENN DERBY-FAHRZEUG EXPLODIERT ]] --

addEventHandler("onVehicleExplode",root,function()
	if(getElementData(source,"EventFahrzeug") == true)then
		destroyElement(source)
		Adminsystem[Adminsystem.event].players = Adminsystem[Adminsystem.event].players - 1
		if(Adminsystem[Adminsystem.event].players == 1)then
			for _,v in pairs(getElementsByType("vehicle"))do
				if(getElementData(v,"EventFahrzeug") == true)then
					local ownerName = getElementData(v,"EventOwner")
					local owner = getPlayerFromName(ownerName)
					for _,v in pairs(getElementsByType("player"))do
						if(getElementData(v,"loggedin") == 1)then
							outputChatBox(loc(v,"Adminsystem_91"):format(ownerName,Adminsystem.even),v,255,255,255,true)
						end
					end
					if(isElement(owner))then
						setElementData(owner,"Geld",getElementData(owner,"Geld")+25000)
					end
					destroyElement(v)
					Adminsystem.stopEvent()
					setPlayerAchievement(owner,25)
					break
				end
			end
		end
	end
end)

-- [[ FALLS FAHRZEUG EVENTFAHRZEUG IST, ZERSTÖREN ]] --

function Adminsystem.checkEventVehicle(player)
	if(isPedInVehicle(player))then
		local veh = getPedOccupiedVehicle(player)
		if(getElementData(veh,"EventFahrzeug"))then
			destroyElement(veh)
		end
	end
end

-- [[ WAS PASSIERT, WENN SPIELER STIRBT / QUITTET ]] --

addEventHandler("onPlayerQuit",root,function()
	Adminsystem.savePos[source] = nil
	Adminsystem.checkEventVehicle(source)
end)

addEventHandler("onPlayerWasted",root,function()
	Adminsystem.savePos[source] = nil
	Adminsystem.checkEventVehicle(source)
	triggerClientEvent(source,"Adminsystem.createEventMarker",source)
end)