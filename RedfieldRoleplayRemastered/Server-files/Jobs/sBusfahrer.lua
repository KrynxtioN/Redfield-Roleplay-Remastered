-- [[ FAHRZEUGE ERSTELLEN ]] --

for _,v in pairs(Busfahrer["Vehicles"])do
	local vehicle = createVehicle(431,v[1],v[2],v[3],v[4],v[5],v[6])
	setElementFrozen(vehicle,true)
	
	addEventHandler("onVehicleEnter",vehicle,function(player)
		if(getPedOccupiedVehicleSeat(player) == 0)then
			if(hasPlayerLicense(player,getElementModel(source)))then
				if(getElementData(player,"Job") == "Busfahrer")then
					setElementData(player,"ImBusjob",true)
					setElementFrozen(source,false)
					triggerClientEvent(player,"Busfahrer.createMarker",player,"create")
				else
					exitVehicle(player)
					infobox(player,loc(player,"Jobs_43"),"error")
				end
			end
		end
	end)
	
	addEventHandler("onVehicleExit",vehicle,function(player)
		if(getElementData(player,"ImBusjob") == true)then
			respawnVehicle(source)
			setElementData(player,"ImBusjob",false)
			triggerClientEvent(player,"Busfahrer.createMarker",player)
			triggerClientEvent(player,"Busfahrer.refreshPoints",player)
		end
	end)
end

-- [[ JOB BEENDEN ]] --

function Busfahrer.finish(player)
	if(getElementData(player,"ImBusjob") == true)then
		if(isPedInVehicle(player))then
			respawnVehicle(getPedOccupiedVehicle(player))
		end
		setElementData(player,"ImBusjob",false)
		triggerClientEvent(player,"Busfahrer.createMarker",player)
		triggerClientEvent(player,"Busfahrer.refreshPoints",player)
	end
end

-- [[ WAS PASSIERT, WENN SPIELER STIRBT / QUITTET ]] --

addEventHandler("onPlayerQuit",root,function() Busfahrer.finish(source)end)
addEventHandler("onPlayerWasted",root,function() Busfahrer.finish(source)end)