-- [[ FAHRZEUG BETRETEN ]] --

addEventHandler("onVehicleEnter",root,function(player)
	if(getPedOccupiedVehicleSeat(player) == 0)then
		if(not(getElementData(source,"Motor")))then
			setElementData(source,"Motor","off")
			setElementData(source,"Licht","off")
			if(not(getElementData(source,"VehicleID")))then
				setElementData(source,"Kilometer",0)
			end
		end
		if(not(getElementData(source,"Benzin")))then
			setElementData(source,"Benzin",100)
		end
		if(getElementData(source,"Licht") == "off")then
			setVehicleOverrideLights(source,1)
		else
			setVehicleOverrideLights(source,2)
		end
		if(getElementData(source,"Motor") == "off")then
			setVehicleEngineState(source,false)
		else
			setVehicleEngineState(source,true)
		end
		if(hasPlayerVehicleRights(player))then
			if(not(getElementData(source,"EventFahrzeug")))then
				setElementFrozen(source,false)
			end
		end
		if(getElementData(player,"Spielstunden") <= 60)then
			infobox(player,loc(player,"Fahrzeugsystem_150"),"info")
		end
	end
	if(getElementData(source,"Besitzer") == "Polizei")then
		if(Wantedcard[player] == true)then
			triggerClientEvent(player,"Wantedcard.client",player)
		end
	end
end)

-- [[ LICHT & MOTOR ]] --

function motor_func(player)
	if(isPedInVehicle(player))then
		if(hasPlayerVehicleRights(player))then
			local veh = getPedOccupiedVehicle(player)
			if(getVehicleEngineState(veh))then
				setVehicleEngineState(veh,false)
				setElementData(veh,"Motor","off")
			else
				if(tonumber(getElementData(veh,"Benzin")) >= 1)then
					setVehicleEngineState(veh,true)
					setElementData(veh,"Motor","on")
					if(getElementData(veh,"VehicleID"))then
						dbExec(handler,"UPDATE vehicles SET LetzterFahrer = '"..getPlayerName(player).."' WHERE ID = '"..getElementData(veh,"VehicleID").."'")
					end
					setElementData(veh,"LetzterFahrer",getPlayerName(player))
				else infobox(player,loc(player,"Fahrzeugsystem_151"),"error")end
			end
		end
	end
end

function licht_func(player)
	if(isPedInVehicle(player))then
		if(hasPlayerVehicleRights(player))then
			local veh = getPedOccupiedVehicle(player)
			if(getVehicleOverrideLights(veh) ~= 2)then
				setVehicleOverrideLights(veh,2)
				setElementData(veh,"Licht","on")
			else
				setVehicleOverrideLights(veh,1)
				setElementData(veh,"Licht","off")
			end
		end
	end
end

-- [[ DARF SPIELER DAS FAHRZEUG FAHREN? ]] --

function hasPlayerVehicleRights(player,id)
	if(isPedInVehicle(player))then
		if(getPedOccupiedVehicleSeat(player) ~= 0)then
			return false
		end
	end
	local veh = getPedOccupiedVehicle(player)
	if(id)then
		veh = Vehicles[id]
	else
		id = getElementData(veh,"VehicleID")
		if(not(id))then id = 0 end
	end
	if(getElementData(veh,"VehicleID"))then
		if(getElementData(veh,"Besitzer") and getElementData(veh,"Besitzer") ~= "Jobfahrzeuge")then
			local besitzer = getElementData(veh,"Besitzer")
			local pFrak,vFrak = getElementData(player,"Fraktion"),getElementData(veh,"Fraktion")
			local pUnternehmen,vUnternehmen = getElementData(player,"Unternehmen"),getElementData(veh,"Unternehmen")
			local pFirma,vFirma = getElementData(player,"Firma"),getElementData(veh,"Firma")
			if(not(vFirma))then vFirma = 0 end
				
			if(vUnternehmen == 5 and getElementData(player,"InFahrstunde") == true)then
				return true
			else
				if(besitzer == getPlayerName(player) or pFrak == vFrak or pUnternehmen == vUnternehmen and isUnternehmenDuty(player) or vFirma > 0 and pFirma == vFirma or hasPlayerKeys(getPlayerName(player),id))then
					return true
				else
					if(besitzer == "Fahrraeder")then
						return true
					else
						exitVehicle(player)
						infobox(player,loc(player,"Fahrzeugsystem_152"),"error")
						return false
					end
				end
			end
		else
			return true
		end
	else
		return true
	end
end

-- [[ BENZIN / KILOMETERSTAND AKTUALISIEREN ]] --

setTimer(function()
	for _,v in pairs(getElementsByType("vehicle"))do
		if(getVehicleOccupant(v))then
			if(getVehicleEngineState(v) == true)then
				if(getElementData(v,"Motor") == "on")then
					if(getElementData(v,"Benzin"))then
						if(getElementData(v,"Benzin") > 0)then
							local nx,ny,nz = getElementPosition(v)
							if(getElementData(v,"OldX"))then
								local ox,oy,oz = getElementData(v,"OldX"),getElementData(v,"OldY"),getElementData(v,"OldZ")
								local distance = getDistanceBetweenPoints3D(ox,oy,oz,nx,ny,nz)
								setElementData(v,"Kilometer",getElementData(v,"Kilometer") + distance/100)
							end
							setElementData(v,"Benzin",getElementData(v,"Benzin")-1)
							if(getElementData(v,"Benzin") == 0)then
								setVehicleEngineState(v,false)
								setElementData(v,"Motor","off")
							end
							saveBenzin(v)
							
							setElementData(v,"OldX",nx)
							setElementData(v,"OldY",ny)
							setElementData(v,"OldZ",nz)
						end
					end
				end
			end
		end
	end
end,30000,0)

-- [[ ALLGEMEINE FUNKTIONEN ]] --

addEvent("Vehicles.lock",true)
addEventHandler("Vehicles.lock",root,function(id)
	if(hasPlayerVehicleRights(client,id))then
		if(isVehicleLocked(Vehicles[id]))then
			setVehicleLocked(Vehicles[id],false)
			infobox(client,loc(client,"Fahrzeugsystem_153"),"info")
		else
			setVehicleLocked(Vehicles[id],true)
			infobox(client,loc(client,"Fahrzeugsystem_154"),"info")
		end
	end
end)

function Vehicles.park(player)
	if(isPedInVehicle(player))then
		if(getPedOccupiedVehicleSeat(player) == 0)then
			if(hasPlayerVehicleRights(player))then
				if(getElementData(player,"elementClicked") ~= true)then
					local veh = getPedOccupiedVehicle(player)
					if(isVehicleOnGround(veh))then
						if(getElementData(veh,"VehicleID"))then
							if(getElementData(veh,"Fraktion") ~= 999)then
								if(tonumber(getElementData(player,"Fraktionrang")) < 4)then
									infobox(player,loc(player,"Fahrzeugsystem_155"))
									return false
								end
							end
							if(getElementData(veh,"Unternehmen") ~= 999)then
								if(tonumber(getElementData(player,"Unternehmenrang")) < 4)then
									infobox(player,loc(player,"Fahrzeugsystem_156"))
									return false
								end
							end
							local x,y,z = getElementPosition(veh)
							local rx,ry,rz = getElementRotation(veh)
							dbExec(handler,"UPDATE vehicles SET Spawnx = ?, Spawny = ?, Spawnz = ?, Spawnrotz = ? WHERE ID = ?",x,y,z,rz,getElementData(veh,"VehicleID"))
							infobox(player,loc(player,"Fahrzeugsystem_157"),"info")
						end
					end
				end
			end
		end
	end
end
addCommandHandler("park",Vehicles.park)

function Vehicles.handbremse(player)
	if(isPedInVehicle(player))then
		if(getPedOccupiedVehicleSeat(player) == 0)then
			if(hasPlayerVehicleRights(player))then
				local veh = getPedOccupiedVehicle(player)
				if(isVehicleOnGround(veh))then
					if(getElementData(player,"AFK") ~= true)then
						if(getElementData(veh,"VehicleID"))then
							if(getElementData(player,"InPaynSpray") ~= true)then
								if(getElementData(veh,"Tankvorgang"))then
									if(getElementData(veh,"Tankvorgang") == true)then
										return false
									end
								end
								if(isElementFrozen(veh) == true)then
									setElementFrozen(veh,false)
									infobox(player,loc(player,"Fahrzeugsystem_158"),"info")
								else
									setElementFrozen(veh,true)
									infobox(player,loc(player,"Fahrzeugsystem_159"),"info")
								end
							end
						end
					end
				end
			end
		end
	end
end
addCommandHandler("break",Vehicles.handbremse)

addEvent("Vehicles.respawn",true)
addEventHandler("Vehicles.respawn",root,function(id,type)
	local veh = Vehicles[id]
	if(not(type))then
		if(not(hasPlayerVehicleRights(client,id)) and not(getElementData(veh,"VehicleID")))then
			return false
		end
	else
		if(getElementData(client,"Adminlevel") < 6)then
			infobox(client,loc(client,"Fahrzeugsystem_160"),"error")
			return false
		end
	end
	
	if(getVehicleOccupant(veh) == false)then
		local vehicleID = getElementData(veh,"VehicleID")
		local x,y,z,rot = getPlayerData("vehicles","ID",vehicleID,"Spawnx"),getPlayerData("vehicles","ID",vehicleID,"Spawny"),getPlayerData("vehicles","ID",vehicleID,"Spawnz"),getPlayerData("vehicles","ID",vehicleID,"Spawnrotz")
		setElementPosition(veh,x,y,z)
		setElementRotation(veh,0,0,rot)
		infobox(client,loc(client,"Fahrzeugsystem_161"),"info")
		setElementDimension(veh,0)
	else infobox(client,loc(client,"Fahrzeugsystem_162"),"error")end
end)

-- [[ BENZIN UND KILOMETERSTAND SPEICHERN ]] --

function saveBenzin(vehicle)
	if(getElementData(vehicle,"VehicleID"))then
		dbExec(handler,"UPDATE vehicles SET Benzin = '"..getElementData(vehicle,"Benzin").."', Kilometer = '"..getElementData(vehicle,"Kilometer").."' WHERE ID = '"..tonumber(getElementData(vehicle,"VehicleID")).."'")
	end
end

-- [[ SPIELER AUS FAHRUZEUG KICKEN ]] --

function exitVehicle(player)
	local veh = getPedOccupiedVehicle(player)
	if(isElement(veh))then
		if(getPedOccupiedVehicleSeat(player) == 0)then
			setElementVelocity(veh,0,0,0)
		end
		setControlState(player,"enter_exit",false)
		setTimer(removePedFromVehicle,750,1,player)
		setTimer(setControlState,125,1,player,"enter_exit",false)
		setTimer(setControlState,125,1,player,"enter_exit",true)
		setTimer(setControlState,700,1,player,"enter_exit",false)
	end
end

-- [[ WAS PASSIERT, WENN FAHRZEUG EXPLODIERT ]] --

addEventHandler("onVehicleExplode",root,function()
	if(isElement(source))then
		if(getVehicleOccupant(source))then
			if(getElementData(source,"VehicleID"))then
				local VehicleID = getElementData(source,"VehicleID")
				setElementData(source,"Explos",getElementData(source,"Explos")+1)
				dbExec(handler,"UPDATE vehicles SET Explos = '"..getElementData(source,"Explos").."' WHERE ID = '"..VehicleID.."'")
				if(getElementData(source,"Explos") >= 5)then
					if(getElementData(source,"Fraktion") >= 1)then
						for _,v in pairs(getElementsByType("player"))do
							if(getElementData(v,"loggedin") == 1)then
								if(getElementData(v,"Fraktion") == getElementData(source,"Fraktion"))then
									outputChatBox(loc(v,"Fahrzeugsystem_163"):format(ID),v,125,0,0)
								end
							end
						end
					elseif(getElementData(source,"Unternehmen") >= 1)then
						for _,v in pairs(getElementsByType("player"))do
							if(getElementData(v,"loggedin") == 1)then
								if(getElementData(v,"Unternehmen") == getElementData(source,"Unternehmen"))then
									outputChatBox(loc(v,"Fahrzeugsystem_164"):format(ID),v,125,0,0)
								end
							end
						end
					else
						local owner = getPlayerFromName(getElementData(source,"Besitzer"))
						if(isElement(owner))then
							outputChatBox(loc(owner,"Fahrzeugsystem_165"):format(VehicleID),owner,125,0,0)
						else
							offlinemessage(owner,loc(_,"Fahrzeugsystem_166",owner):format(VehicleID))
						end
					end
					outputLog("Das Fahrzeug mit der ID "..VehicleID.." von "..owner.." (Model-ID: "..getElementModel(source).." wurde aufgrund von zu vielen Explos gelöscht.","Fahrzeugsystem")
					destroyElement(source)
					dbExec(handler,"DELETE FROM vehicles WHERE ID = '"..VehicleID.."'")
				end
			end
		end
		
		setTimer(function(source)
			if(isElement(source))then
				respawnVehicle(source)
			end
		end,10000,1,source)
	end
end)

-- [[ KOFFERRAUM ]] --

function getKofferraumDatas(player)
	local VehicleID = getElementData(player,"VehicleID")
	local Kofferraum = getPlayerData("vehicles","ID",VehicleID,"Kofferraum")
	local tbl = {}
	table.insert(tbl,{"Gras",tonumber(gettok(Kofferraum,1,string.byte("|")))})
	table.insert(tbl,{"Materialien",tonumber(gettok(Kofferraum,2,string.byte("|")))})
	triggerClientEvent(player,"setKofferraumDatas",player,tbl)
end
addEvent("getKofferraumDatas",true)
addEventHandler("getKofferraumDatas",root,getKofferraumDatas)

addEvent("Kofferraum.einlagern",true)
addEventHandler("Kofferraum.einlagern",root,function(item,menge)
	local menge = tonumber(menge)
	local VehicleID = getElementData(client,"VehicleID")
	if(hasPlayerVehicleRights(client,VehicleID))then
		if(getElementData(client,item) >= menge)then
			local Kofferraum = getPlayerData("vehicles","ID",VehicleID,"Kofferraum")
			local Gras = tonumber(gettok(Kofferraum,1,string.byte("|")))
			local Materialien = tonumber(gettok(Kofferraum,2,string.byte("|")))
			setElementData(client,item,getElementData(client,item)-menge)
			if(item == "Gras")then Gras = Gras + menge end
			if(item == "Materialien")then Materialien = Materialien + menge end
			local string = Gras.."|"..Materialien.."|0|0"
			dbExec(handler,"UPDATE vehicles SET Kofferraum = '"..string.."' WHERE ID = '"..VehicleID.."'")
			infobox(client,loc(client,"Fahrzeugsystem_167"):format(menge,item),"info")
			getKofferraumDatas(client)
		else infobox(client,loc(client,"Fahrzeugsystem_168"):format(item),"error")end
	end
end)

addEvent("Kofferraum.auslagern",true)
addEventHandler("Kofferraum.auslagern",root,function(item,menge)
	local menge = tonumber(menge)
	local VehicleID = getElementData(client,"VehicleID")
	if(hasPlayerVehicleRights(client,VehicleID))then
		if(menge >= 1)then
			local Kofferraum = getPlayerData("vehicles","ID",VehicleID,"Kofferraum")
			local Gras = tonumber(gettok(Kofferraum,1,string.byte("|")))
			local Materialien = tonumber(gettok(Kofferraum,2,string.byte("|")))
			if(item == "Gras")then
				if(Gras < menge)then
					infobox(client,loc(client,"Fahrzeugsystem_169"),"error")
					return false
				end
			elseif(item == "Materialien")then
				if(Materialien < menge)then
					infobox(client,loc(client,"Fahrzeugsystem_170"),"error")
					return false
				end
			end
			setElementData(client,item,getElementData(client,item)+menge)
			if(item == "Gras")then Gras = Gras - menge end
			if(item == "Materialien")then Materialien = Materialien - menge end
			local string = Gras.."|"..Materialien.."|0|0"
			dbExec(handler,"UPDATE vehicles SET Kofferraum = '"..string.."' WHERE ID = '"..VehicleID.."'")
			infobox(client,loc(client,"Fahrzeugsystem_171"):format(menge,item),"info")
			getKofferraumDatas(client)
		else infobox(client,loc(client,"Fahrzeugsystem_187"),"error")end
	end
end)

-- [[ AUF- / ABSCHLIESSEN ]] --

addCommandHandler("lock",function(player,cmd,id)
	if(not(id))then
		for _,v in pairs(getElementsByType("vehicle"))do
			local x,y,z = getElementPosition(v)
			if(getDistanceBetweenPoints3D(x,y,z,getElementPosition(player)) <= 5)then
				if(getElementData(v,"VehicleID"))then
					if(hasPlayerVehicleRights(player,getElementData(v,"VehicleID")))then
						if(isVehicleLocked(v))then
							setVehicleLocked(v,false)
							infobox(player,loc(player,"Fahrzeugsystem_172"),"info")
						else
							setVehicleLocked(v,true)
							infobox(player,loc(player,"Fahrzeugsystem_173"),"info")
						end
						break
					end
				end
			end
		end
	else
		local id = tonumber(id)
		if(isElement(Vehicles[id]))then
			if(hasPlayerVehicleRights(player,id))then
				if(isVehicleLocked(Vehicles[id]))then
					setVehicleLocked(Vehicles[id],false)
					infobox(player,loc(player,"Fahrzeugsystem_174"),"info")
				else
					setVehicleLocked(Vehicles[id],true)
					infobox(player,loc(player,"Fahrzeugsystem_175"),"info")
				end
			end
		else infobox(player,loc(player,"Fahrzeugsystem_176"),"error")end
	end
end)