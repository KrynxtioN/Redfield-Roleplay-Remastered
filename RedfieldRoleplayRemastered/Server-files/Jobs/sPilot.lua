-- [[ JOB STARTEN ]] --

addEvent("Pilot.start",true)
addEventHandler("Pilot.start",root,function()
	if(hasPlayerLicense(client,519))then
		local dim = getFreeDimension(client)
		Pilot.veh[client] = createVehicle(519,-1648.5999755859,-155.80000305176,15.10000038147,0,0,316)
		warpPedIntoVehicle(client,Pilot.veh[client])
		setElementDimension(Pilot.veh[client],dim)
		setElementDimension(client,dim)
		triggerClientEvent(client,"Pilot.marker",client,"create")
		
		addEventHandler("onVehicleExit",Pilot.veh[client],function(player)
			Pilot.destroy(player)
			setTimer(function(player)
				setElementPosition(player,-1416.6442871094,-298.3210144043,6.203125)
				setElementDimension(player,0)
			end,100,1,player)
		end)
	end
end)

-- [[ JOB BEENDEN ]] --

addEvent("Pilot.finish",true)
addEventHandler("Pilot.finish",root,function(bonus)
	giveJobMoney(client,500+bonus*3)
	destroyElement(Pilot.veh[client])
	triggerClientEvent(client,"Pilot.marker",client)
	setTimer(function(client)
		setElementPosition(client,-1416.6442871094,-298.3210144043,6.203125)
		setElementDimension(client,0)
	end,100,1,client)
	setElementData(client,"PilotPunkte",getElementData(client,"PilotPunkte")+1)
end)

-- [[ ELEMENTE ZERSTÖREN ]] --

function Pilot.destroy(player)
	if(isElement(Pilot.veh[player]))then destroyElement(Pilot.veh[player])end
	triggerClientEvent(player,"Pilot.marker",player)
end

-- [[ WAS PASSIERT, WENN SPIELER STIRBT / QUITTET ]] --

addEventHandler("onPlayerQuit",root,function() Pilot.destroy(source)end)
addEventHandler("onPlayerWasted",root,function() Pilot.destroy(source)end)