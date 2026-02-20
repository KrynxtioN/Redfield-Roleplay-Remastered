-- [[ JOB STARTEN ]] --

addEvent("Meeresreiniger.start",true)
addEventHandler("Meeresreiniger.start",root,function()
	if(hasPlayerLicense(client,453))then
		Meeresreiniger.veh[client] = createVehicle(453,2499.8017578125,-2268.44140625,-0.16085433959961,3.4661865234375,355.9130859375,272.99377441406)
		warpPedIntoVehicle(client,Meeresreiniger.veh[client])
		bindKey(client,"num_0","down",Meeresreiniger.stop)
		triggerClientEvent(client,"Meeresreiniger.createElements",client)
		
		addEventHandler("onVehicleStartExit",Meeresreiniger.veh[client],function(player)
			cancelEvent()
			infobox(player,loc(player,"Jobs_67"),"error")
		end)
	end
end)

-- [[ JOB STOPPEN ]] --

function Meeresreiniger.stop(player)
	if(getDistanceBetweenPoints3D(2494.30542,-2258.43457,3.00000,getElementPosition(player)) <= 20)then
		setTimer(function(player)
			setElementPosition(player,2499.2243652344,-2259.23046875,3)
		end,100,1,player)
		Meeresreiniger.destroy(player)
	else infobox(player,loc(player,"Jobs_68"),"error")end
end

function Meeresreiniger.destroy(player)
	unbindKey(player,"num_0","down",Meeresreiniger.stop)
	if(isElement(Meeresreiniger.veh[player]))then destroyElement(Meeresreiniger.veh[player])end
	triggerClientEvent(player,"Meeresreiniger.finish",player)
end

-- [[ WAS PASSIERT, WENN SPIELER STIRBT / QUITTET ]] --

addEventHandler("onPlayerQuit",root,function() Meeresreiniger.destroy(source)end)
addEventHandler("onPlayerWasted",root,function() Meeresreiniger.destroy(source)end)