-- [[ GARAGEN ÖFFNEN ]] --

setGarageOpen( 7,true)
setGarageOpen(10,true)
setGarageOpen(15,true)
setGarageOpen(18,true)
setGarageOpen(33,true)

-- [[ MARKER ERSTELLEN ]] --

for i,v in ipairs(Tuningsystem["Marker"])do
	Tuningsystem[i] = createMarker(v[1],v[2],v[3],"cylinder",2,255,0,0,150)
	setElementData(Tuningsystem[i],"TuningID",i)
	createBlip(v[1],v[2],v[3],27,_,_,_,_,_,_,100)
	
	addEventHandler("onMarkerHit",Tuningsystem[i],function(player)
		if(getElementDimension(player) == getElementDimension(source))then
			if(getElementType(player) == "vehicle")then
				local player = getVehicleOccupant(player,0)
				local veh = getPedOccupiedVehicle(player)
				local VehicleID = getElementData(veh,"VehicleID")
				if(VehicleID)then
					local state = false
					for i = 1,3 do
						if(getVehicleOccupant(veh,i) == true)then
							state = true
							break
						end
					end
					if(state == false)then
						local dim = getFreeDimension()
						setElementPosition(veh,614.44848632813,-124.11219787598,998.12097167969)
						setElementRotation(veh,0,0,90)
						setElementInterior(veh,3)
						setElementInterior(player,3)
						setElementDimension(player,dim)
						setElementDimension(veh,dim)
						triggerClientEvent(player,"Tuningsystem.openWindow",player)
						setElementData(player,"InTuninggarage",true)
						setElementData(player,"TuningID",getElementData(source,"TuningID"))
					else infobox(player,loc(player,"Fahrzeugsystem_128"),"error")end
				else infobox(player,loc(player,"Fahrzeugsystem_129"),"error")end
			end
		end
	end)
end

-- [[ SPAWN VOR TUNINGGARAGE ]] --

addEvent("Tuningsystem.spawnVorGarage",true)
addEventHandler("Tuningsystem.spawnVorGarage",root,function()
	setTimer(function(client)
		local ID = getElementData(client,"TuningID")
		setElementData(client,"InTuninggarage",false)
		local tbl = Tuningsystem["Spawn"][ID]
		local veh = getPedOccupiedVehicle(client)
		setElementPosition(veh,tbl[1],tbl[2],tbl[3])
		setElementRotation(veh,0,0,tbl[4])
		setElementInterior(veh,0)
		setElementInterior(client,0)
		setElementDimension(veh,0)
		setElementDimension(client,0)
		setCameraTarget(client)
		Tuningsystem.loadTunings(veh)
	end,50,1,client)
end)

-- [[ TUNINGS HINZUFÜGEN / ENTFERNEN ]] --

addEvent("Tuningsystem.addRemoveTuning",true)
addEventHandler("Tuningsystem.addRemoveTuning",root,function(type,preis,tuningteil)
	local preis = tonumber(preis)
	local veh = getPedOccupiedVehicle(client)
	if(type == "add")then
		if(hasMoney(client,preis))then
			addVehicleUpgrade(veh,tuningteil)
			takeMoney(client,preis)
			infobox(client,loc(client,"Fahrzeugsystem_130")"info")
			Tuningsystem.saveTunings(veh)
			setPlayerStatus(client,6)
		end
	elseif(type == "remove")then
		removeVehicleUpgrade(veh,tuningteil)
		infobox(client,loc(client,"Fahrzeugsystem_131"),"error")
		Tuningsystem.saveTunings(veh)
	elseif(type == "show")then
		addVehicleUpgrade(veh,tuningteil)
	end
end)

-- [[ TUNINGS SPEICHERN ]] --

function Tuningsystem.saveTunings(veh)
	local tunings = ""
	for i = 0,16 do
		local upgrade = getVehicleUpgradeOnSlot(veh,i)
		if(upgrade)then
			tunings = tunings..upgrade.."|"
		else
			tunings = tunings.."0|"
		end
	end
	dbExec(handler,"UPDATE vehicles SET Tunings = '"..tunings.."' WHERE ID = '"..getElementData(veh,"VehicleID").."'")
end

-- [[ TUNINGS LADEN ]] --

function Tuningsystem.loadTunings(veh)
	for i = 0,16 do
		local upgrade = getVehicleUpgradeOnSlot(veh,i)
		if(upgrade)then
			removeVehicleUpgrade(veh,upgrade)
		end
	end

	local result = dbPoll(dbQuery(handler,"SELECT Tunings FROM vehicles WHERE ID = '"..getElementData(veh,"VehicleID").."'"),-1)
	if(result and result[1])then
		local tunings = result[1]["Tunings"]
		for i = 1,17 do
			local tstring = gettok(tunings,i,string.byte("|"))
			if(tstring and #tstring >= 1 and tstring ~= 0)then
				addVehicleUpgrade(veh,tstring)
			end
		end
	end
	
	if(tonumber(getElementData(veh,"Fraktion")) == 999 and tonumber(getElementData(veh,"Unternehmen")) == 999)then
		local colors = getPlayerData("vehicles","ID",getElementData(veh,"VehicleID"),"Color")
		local r = tonumber(gettok(colors,1,string.byte("|")))
		local g = tonumber(gettok(colors,2,string.byte("|")))
		local b = tonumber(gettok(colors,3,string.byte("|")))
		setVehicleColor(veh,r,g,b)
	end
end
addEvent("Tuningsystem.loadTunings",true)
addEventHandler("Tuningsystem.loadTunings",root,Tuningsystem.loadTunings)

-- [[ FARBE KAUFEN ]] --

addEvent("Tuningsystem.buyColor",true)
addEventHandler("Tuningsystem.buyColor",root,function(r,g,b)
	if(hasMoney(client,0))then
		local veh = getPedOccupiedVehicle(client)
		local VehicleID = getElementData(veh,"VehicleID")
		if(tonumber(getElementData(veh,"Fraktion")) == 999 and tonumber(getElementData(veh,"Unternehmen")) == 999)then
			local Color = r.."|"..g.."|"..b
			dbExec(handler,"UPDATE vehicles SET Color = '"..Color.."' WHERE ID = '"..VehicleID.."'")
			takeMoney(client,0)
			infobox(client,loc(client,"Fahrzeugsystem_132"),"info")
		else infobox(client,loc(client,"Fahrzeugsystem_133"),"error")end
	end
end)