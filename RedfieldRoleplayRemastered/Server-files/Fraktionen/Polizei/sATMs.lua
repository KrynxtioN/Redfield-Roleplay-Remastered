-- [[ MARKER ZUM BELADEN VON GELD ]] --

Polizei.atmBefuellenMarker = createMarker(-1606.4276123047,732.88220214844,-6.2344131469727,"cylinder",3,255,255,0,50)

addEventHandler("onMarkerHit",Polizei.atmBefuellenMarker,function(player)
	if(getElementType(player) == "vehicle")then
		local player = getVehicleOccupant(player,0)
		if(getPedOccupiedVehicleSeat(player) == 0)then
			local veh = getPedOccupiedVehicle(player)
			if(getElementData(veh,"Besitzer") == "SAPD" and getElementModel(veh) == 428)then
				setElementData(veh,"ATMGeld",2500000)
				infobox(player,loc(player,"Fraktionen_210"),"info")
			end
		end
	end
end)

-- [[ BLIPS VON ATMS ERSTELLEN ]] --

function Polizei.createATMBlips(player)
	local tbl = {}
	local result = dbPoll(dbQuery(handler,"SELECT * FROM atms"),-1)
	if(#result >= 1)then
		for _,v in pairs(result)do
			if(v["Inhalt"] < 750000)then
				table.insert(tbl,{v["Spawnx"],v["Spawny"],v["Spawnz"]})
			end
		end
		triggerClientEvent(player,"Polizei.createATMBlips",player,tbl,"create")
		infobox(player,loc(player,"Fraktionen_211"),"info")
	end
end

-- [[ SPIELER STEIGT EIN / AUS ]] --

addEventHandler("onVehicleEnter",root,function(player)
	if(getPedOccupiedVehicleSeat(player) == 0)then
		local veh = getPedOccupiedVehicle(player)
		if(getElementData(veh,"Besitzer") == "SAPD" and getElementModel(veh) == 428)then
			Polizei.createATMBlips(player)
		end
	end
end)

addEventHandler("onVehicleExit",root,function(player)
	triggerClientEvent(player,"Polizei.createATMBlips",player)
end)