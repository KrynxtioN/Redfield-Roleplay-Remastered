-- [[ VARIABLEN ]] --

VehicleSystemID = 0
local ID = 0

-- [[ FAHRZEUGE LADEN ]] --

function loadVehicles(name)
	local result = dbPoll(dbQuery(handler,"SELECT * FROM vehicles WHERE Besitzer = '"..name.."'"),-1)
	if(#result >= 1)then
		for _,v in pairs(result)do
			if(not(isElement(Vehicles[v["ID"]])))then
				Vehicles[v["ID"]] = createVehicle(v["Model"],v["Spawnx"],v["Spawny"],v["Spawnz"],0,0,v["Spawnrotz"],v["Kennzeichen"])
				if(v["Model"] ~= 597 and v["Model"] ~= 427 and v["Model"] ~= 601 and v["Model"] ~= 599 and v["Model"] ~= 523 and v["Model"] ~= 416 and v["Model"] ~= 407)then
					if(v["Fraktion"] > 0 or v["Unternehmen"] > 0)then
						if(v["Fraktion"] > 0)then type = "Fraktion" elseif(v["Unternehmen"] > 0)then type = "Unternehmen" end
						local tbl = Fraktionssystem[type][v[type]]
						setVehicleColor(Vehicles[v["ID"]],tbl[1],tbl[2],tbl[3])
					end
				end
				if(v["Fraktion"] == 0 and v["Unternehmen"] == 0)then
					ID = ID + 1
					setElementDimension(Vehicles[v["ID"]],ID)
				end
				setElementData(Vehicles[v["ID"]],"Besitzer",v["Besitzer"])
				setElementData(Vehicles[v["ID"]],"Benzin",v["Benzin"])
				setElementData(Vehicles[v["ID"]],"VehicleID",v["ID"])
				setElementData(Vehicles[v["ID"]],"Slot",v["Slot"])
				setElementData(Vehicles[v["ID"]],"Abgeschleppt",v["Abgeschleppt"])
				setElementData(Vehicles[v["ID"]],"Fraktion",v["Fraktion"])
				setElementData(Vehicles[v["ID"]],"Unternehmen",v["Unternehmen"])
				setElementData(Vehicles[v["ID"]],"Explos",v["Explos"])
				setElementData(Vehicles[v["ID"]],"Firma",v["Firma"])
				setVehicleLocked(Vehicles[v["ID"]],true)
				setElementData(Vehicles[v["ID"]],"Sportmotor",v["Sportmotor"])
				setElementData(Vehicles[v["ID"]],"Preis",v["Preis"])
				setElementData(Vehicles[v["ID"]],"Kilometer",v["Kilometer"])
				setElementData(Vehicles[v["ID"]],"LetzterFahrer",v["LetzterFahrer"])
				if(v["Sportmotor"] == 1)then
					setVehicleHandling(Vehicles[v["ID"]],"engineAcceleration",(getVehicleHandling(Vehicles[v["ID"]])["engineAcceleration"]/100*150))
					setVehicleHandling(Vehicles[v["ID"]],"maxVelocity",(getVehicleHandling(Vehicles[v["ID"]])["maxVelocity"]/100*150))
				end
				if(v["Fraktion"] == 0)then setElementData(Vehicles[v["ID"]],"Fraktion",999)end
				if(v["Unternehmen"] == 0)then setElementData(Vehicles[v["ID"]],"Unternehmen",999)end
				Tuningsystem.loadTunings(Vehicles[v["ID"]])
				VehicleSystemID = v["ID"]
			end
		end
	end
end
loadVehicles("Dillimore Devils")
loadVehicles("Los Aztecas")
loadVehicles("Mafia")
loadVehicles("Yakuza")
loadVehicles("SAPD")
loadVehicles("F.B.I")
loadVehicles("Mechaniker")
loadVehicles("Fahrschule")
loadVehicles("Reporter")
loadVehicles("Trucker")
loadVehicles("Rescue Team")

addEventHandler("onPlayerQuit",root,function()
	for _,v in pairs(getElementsByType("vehicle"))do
		if(getElementData(v,"Besitzer") and getElementData(v,"Besitzer") == getPlayerName(source))then
			destroyElement(v)
		end
	end
end)

local FahrradRespawnTimer = {}

if(#Fahrraeder >= 1)then
	for _,v in pairs(Fahrraeder)do
		local vehicle = createVehicle(510,v[1],v[2],v[3],v[4],v[5],v[6])
		setElementData(vehicle,"Besitzer","Fahrraeder")
		setVehicleColor(vehicle,0,255,0)
		
		addEventHandler("onVehicleEnter",vehicle,function(player)
			if(isTimer(FahrradRespawnTimer[source]))then killTimer(FahrradRespawnTimer[source])end
		end)
		
		addEventHandler("onVehicleExit",vehicle,function(player)
			if(isTimer(FahrradRespawnTimer[source]))then killTimer(FahrradRespawnTimer[source])end
			FahrradRespawnTimer[source] = setTimer(function(source)
				respawnVehicle(source)
				fixVehicle(source)
			end,300000,1,source)
		end)
	end
end

-- [[ FAHRZEUG RESPAWNEN ]] --

function newRespawnVehicle(player,name)
	for _,v in pairs(getElementsByType("vehicle"))do
		if(getElementData(v,"Besitzer") == name)then
			if(getVehicleOccupant(v) == false)then
				respawnVehicle(v)
				if(getElementData(v,"VehicleID"))then
					local vehicleID = getElementData(v,"VehicleID")
					local x,y,z,rot = getPlayerData("vehicles","ID",vehicleID,"Spawnx"),getPlayerData("vehicles","ID",vehicleID,"Spawny"),getPlayerData("vehicles","ID",vehicleID,"Spawnz"),getPlayerData("vehicles","ID",vehicleID,"Spawnrotz")
					setElementPosition(v,x,y,z)
					setElementRotation(v,0,0,rot)
					setElementFrozen(v,true)
					setVehicleLocked(v,true)
				end
			end
		end
	end
	infobox(player,loc(player,"Fahrzeugsystem_94"),"info")
end
addEvent("newRespawnVehicle",true)
addEventHandler("newRespawnVehicle",root,newRespawnVehicle)

-- [[ DIE FAHRZEUGVERWALTUNG ÖFFNEN ]] --

function Vehicles.loadPlayerVehicles(player)
	local tbl = {}
	local result = dbPoll(dbQuery(handler,"SELECT * FROM vehicles WHERE Besitzer = '"..getPlayerName(client).."'"),-1)
	if(#result >= 1)then
		for _,v in pairs(result)do
			table.insert(tbl,{v["ID"],getVehicleNameFromModel(v["Model"]),v["Benzin"],v["Explos"]})
		end
	end
	triggerClientEvent(player,"Fahrzeugverwaltung.setVehicles",player,tbl)
end
addEvent("Fahrzeugverwaltung.loadPlayerVehicles",true)
addEventHandler("Fahrzeugverwaltung.loadPlayerVehicles",root,Vehicles.loadPlayerVehicles)

-- [[ FAHRZEUGVERWALTUNG-FUNKTIONEN ]] --

addEvent("Fahrzeugverwaltung.server",true)
addEventHandler("Fahrzeugverwaltung.server",root,function(id,type,player,preis)
	local id = tonumber(id)
	local vehicle = Vehicles[id]
	if(isElement(vehicle))then
		if(getElementData(vehicle,"Abgeschleppt") == 0)then
			if(type == "Respawnen")then
				if(getVehicleOccupant(vehicle) == false)then
					local x,y,z,rot = getPlayerData("vehicles","ID",id,"Spawnx"),getPlayerData("vehicles","ID",id,"Spawny"),getPlayerData("vehicles","ID",id,"Spawnz"),getPlayerData("vehicles","ID",id,"Spawnrotz")
					setElementPosition(vehicle,x,y,z)
					setElementRotation(vehicle,0,0,rot)
					infobox(client,loc(client,"Fahrzeugsystem_95"),"info")
					setElementDimension(vehicle,0)
				else infobox(client,loc(client,"Fahrzeugsystem_96"),"error")end
			elseif(type == "Löschen")then
				dbExec(handler,"DELETE FROM vehicles WHERE ID = '"..id.."'")
				infobox(client,loc(client,"Fahrzeugsystem_97"),"info")
				destroyElement(Vehicles[id])
				outputLog(getPlayerName(client).." hat sein Fahrzeug mit der ID "..id.." gelöscht.","Fahrzeugsystem")
			elseif(type == "Orten")then
				local x,y,z = getElementPosition(vehicle)
				if(getElementDimension(client) == 0)then
					triggerClientEvent(client,"Fahrzeugverwaltung.orten",client,x,y,z)
				else infobox(client,loc(client,"Fahrzeugsystem_98"),"error")end
			elseif(type == "Verkaufen")then
				if(player ~= "")then
					if(tonumber(preis))then
						local preis = tonumber(preis)
						local kaeufer = getPlayerFromName(player)
						if(existPlayer(client,kaeufer))then
							if(Vehicles.activeSellcar[client] == nil)then
								local modelName = getVehicleNameFromModel(getElementModel(vehicle))
								local x,y,z = getElementPosition(kaeufer)
								if(getDistanceBetweenPoints3D(x,y,z,getElementPosition(client)) <= 5)then
									Vehicles.sellcarSave[kaeufer] = getPlayerName(client)
									Vehicles.sellcarPrice[kaeufer] = preis
									Vehicles.sellcarID[kaeufer] = id
									Vehicles.activeSellcar[client] = true
									Vehicles.activeSellcar[kaeufer] = true
									
									outputChatBox(loc(kaeufer,"Fahrzeugsystem_100"):format(getPlayerName(client),modelName,preis),kaeufer,0,125,0)
									infobox(client,loc(client,"Fahrzeugsystem_99"):format(getPlayerName(kaeufer,modelName,preis)),"info")
									bindKey(kaeufer,"j","down",Vehicles.acceptSell)
									outputLog(getPlayerName(client).." hat "..getPlayerName(kaeufer).." seinen "..modelName.." für $"..preis.." angeboten.","Fahrzeugsystem")
									
									Vehicles.vehicleSellTimer[client] = setTimer(function(client,kaeufer)
										if(isElement(client))then
											infobox(client,loc(client,"Fahrzeugsystem_101"),"error")
											Vehicles.activeSellcar[client] = nil
										end
										if(isElement(kaeufer))then Vehicles.activeSellcar[kaeufer] = nil end
									end,60000,1,client,kaeufer)
								else infobox(client,loc(client,"Fahrzeugsystem_102"),"error")end
							else infobox(client,loc(client,"Fahrzeugsystem_103"),"error")end
						end
					end
				else
					infobox(client,loc(client,"Fahrzeugsystem_104"),"error")
					--[[ if(Autohaus["Preise"][getElementModel(vehicle)])then
						local preis = Autohaus["Preise"][getElementModel(vehicle)]/100*50
						destroyElement(vehicle)
						dbExec(handler,"DELETE FROM vehicles WHERE ID = '"..id.."'")
						setElementData(client,"Geld",getElementData(client,"Geld")+preis)
						infobox(client,"Du hast $"..preis.." erhalten.","info")
						outputLog(getPlayerName(client).." hat sein Fahrzeug mit der ID "..id.." für $"..preis.." an den Server verkauft.","Fahrzeugsystem")
					else infobox(client,"Dieses Fahrzeug kann nicht an den Server verkauft werden!","error")end ]]--
				end
			end
			Vehicles.loadPlayerVehicles(client)
		else infobox(client,loc(client,"Fahrzeugsystem_105"),"error")end
	else infobox(client,loc(client,"Fahrzeugsystem_106"),"error")end
end)

function Vehicles.acceptSell(player)
	if(hasMoney(player,tonumber(Vehicles.sellcarPrice[player])))then
		local seller = getPlayerFromName(Vehicles.sellcarSave[player])
		local id = Vehicles.sellcarID[player]
		if(existPlayer(player,seller))then
			if(isElement(Vehicles[id]))then
				setElementData(Vehicles[id],"Besitzer",getPlayerName(player))
				setVehiclePlateText(Vehicles[id],getPlayerName(player))
				if(isTimer(Vehicles.vehicleSellTimer[seller]))then
					killTimer(Vehicles.vehicleSellTimer[seller])
				end
				takeMoney(player,Vehicles.sellcarPrice[player])
				setElementData(seller,"Geld",getElementData(seller,"Geld")+Vehicles.sellcarPrice[player])
				infobox(player,loc(player,"Fahrzeugsystem_107"):format(getPlayerName(seller)),"info")
				infobox(seller,loc(seller,"Fahrzeugsystem_108"):format(getPlayerName(player)),"info")
				dbExec(handler,"UPDATE vehicles SET Besitzer = '"..getPlayerName(player).."', Kennzeichen = '"..getPlayerName(player).."' WHERE ID = '"..id.."'")
				outputLog(getPlayerName(player).." hat "..getPlayerName(seller).." sein Fahrzeug mit der ID "..id.." für $"..Vehicles.sellcarPrice[player].." abgekauft.","Fahrzeugsystem")
				Vehicles.activeSellcar[player] = nil
				Vehicles.activeSellcar[seller] = nil
			else infobox(player,loc(client,"Fahrzeugsystem_109"),"error")end
		end
	end
end

-- [[ FIRMENFAHRZEUG VERKAUFEN ]] --

addCommandHandler("sellFirmenFahrzeug",function(player,cmd,preis)
	if(isPedInVehicle(player))then
		local veh = getPedOccupiedVehicle(player)
		local VehicleID = tonumber(getElementData(veh,"VehicleID"))
		if(hasPlayerVehicleRights(player,VehicleID))then
			if(getElementData(veh,"Firma") >= 1)then
				local Firma = tonumber(getElementData(player,"Firma"))
				if(Firma >= 1)then
					if(getPlayerData("firma","ID",Firma,"Type") == 1)then
						if(getPedOccupiedVehicleSeat(player) == 0)then
							if(preis and tonumber(preis))then
								setElementData(veh,"Preis",preis)
								if(tonumber(preis) > 0)then
									infobox(player,loc(player,"Fahrzeugsystem_110"):format(preis),"info")
								else
									infobox(player,loc(player,"Fahrzeugsystem_111"),"info")
								end
								dbExec(handler,"UPDATE vehicles SET Preis = '"..preis.."' WHERE ID = '"..getElementData(veh,"VehicleID").."'")
								for _,v in pairs(getElementsByType("player"))do
									getSellFirmenFahrzeuge(v)
								end
							else infobox(player,loc(player,"Fahrzeugsystem_112"),"error")end
						end
					end
				end
			end
		end
	end
end)

function getSellFirmenFahrzeuge(player)
	sellFirmenFahrzeuge = {}
	for _,v in pairs(getElementsByType("vehicle"))do
		if(tonumber(getElementData(v,"Preis")) and tonumber(getElementData(v,"Preis")) >= 1)then
			table.insert(sellFirmenFahrzeuge,v)
		end
	end
	triggerClientEvent(player,"setSellFirmenFahrzeuge",player,sellFirmenFahrzeuge)
end

-- [[ FIRMENFAHRZEUG KAUFEN ]] --

addEvent("buyFirmenfahrzeug",true)
addEventHandler("buyFirmenfahrzeug",root,function()
	local VehID = getElementData(client,"VehicleID")
	local preis = tonumber(getElementData(Vehicles[VehID],"Preis"))
	if(preis >= 1)then
		if(hasMoney(client,preis))then
			takeMoney(client,preis)
			addToLager(getElementData(Vehicles[VehID],"Firma"),"Geld",preis,"firma")
			setElementData(Vehicles[VehID],"Firma",0)
			setElementData(Vehicles[VehID],"Besitzer",getPlayerName(client))
			setElementData(Vehicles[VehID],"Preis",0)
			setVehiclePlateText(Vehicles[VehID],getPlayerName(client))

			dbExec(handler,"UPDATE vehicles SET Besitzer = '"..getPlayerName(client).."', Kennzeichen = '"..getPlayerName(client).."', Firma = '0', Preis = '0' WHERE ID = '"..VehID.."'")
			infobox(client,loc(client,"Fahrzeugsystem_113"),"info")
			triggerClientEvent(client,"setWindowDatas",client)
			outputLog(getPlayerName(client).." hat das Firmenfahrzeug mit der ID "..VehID.." für $"..preis.." gekauft.","Fahrzeugsystem")
		end
	else infobox(client,loc(client,"Fahrzeugsystem_114"),"error")end
end)