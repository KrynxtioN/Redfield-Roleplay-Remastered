-- [[ JOB STARTEN (LEVEL 1) ]] --

addEvent("Muellmann.level1",true)
addEventHandler("Muellmann.level1",root,function()
	setElementData(client,"ImJob",true)
	triggerClientEvent(client,"Muellmann.createDreckZumEinsammeln",client,"create")
	bindKey(client,"num_0","down",Muellmann.destroy)
	infobox(client,loc(client,"Jobs_69"),"info")
end)

-- [[ JOB STARTEN (LEVEL 2) ]] --

addEvent("Muellmann.level2",true)
addEventHandler("Muellmann.level2",root,function()
	if(hasPlayerLicense(client,408))then
		if(getElementData(client,"ImJob") ~= true)then
			Muellmann.vehicle[client] = createVehicle(408,-1881.140625,-1683.7999267578,21.749515533447,0,0,180)
			warpPedIntoVehicle(client,Muellmann.vehicle[client])
			outputChatBox(loc(client,"Jobs_70"),client,255,255,255,true)
			outputChatBox(loc(client,"Jobs_71"),client,255,255,255)
			triggerClientEvent(client,"Muellmann.createMarker",client,"create")
			setElementData(client,"ImJob",true)
			
			addEventHandler("onVehicleExit",Muellmann.vehicle[client],function(player)
				if(isElement(Muellmann.vehicle[player]))then destroyElement(Muellmann.vehicle[player])end
				triggerClientEvent(player,"Muellmann.createMarker",player)
				setElementData(player,"ImJob",false)
			end)
		else infobox(client,loc(client,"Jobs_72"),"error")end
	end
end)

-- [[ ELEMENTE ZERSTÖREN ]] --

function Muellmann.destroy(player)
	unbindKey(player,"num_0","down",Muellmann.destroy)
	setElementData(player,"ImJob",false)
	if(isElement(Muellmann.vehicle[player]))then destroyElement(Muellmann.vehicle[player])end
	triggerClientEvent(player,"Muellmann.createMarker",player)
	triggerClientEvent(player,"Muellmann.createDreckZumEinsammeln",player)
end

-- [[ WAS PASSIERT, WENN SPIELER STIRBT / QUITTET ]] --

addEventHandler("onPlayerQuit",root,function() Muellmann.destroy(source)end)
addEventHandler("onPlayerWasted",root,function() Muellmann.destroy(source)end)