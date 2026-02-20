-- [[ RUNDFAHRT BEENDEN ]] --

addEvent("Rundfahrt.server",true)
addEventHandler("Rundfahrt.server",root,function()
	setElementPosition(Sequenzen.vehicle[client],-2691.2075195313,1233.3905029297,55.826641082764)
	setElementRotation(Sequenzen.vehicle[client],0,0,195)
	setElementData(client,"Intro",1)
	setElementData(client,"Geld",getElementData(client,"Geld")+1900)
	setPlayerAchievement(client,1)
	Wetter.refresh(client)
	
	addEventHandler("onVehicleExit",Sequenzen.vehicle[client],function(player)
		destroyElement(source)
	end)
end)

addEvent("Rundfahrt.ende",true)
addEventHandler("Rundfahrt.ende",root,function()
	setCameraTarget(client)
	setElementDimension(getPedOccupiedVehicle(client),0)
	setElementDimension(client,0)
end)

-- [[ ZUM LETZTEN MARKER TELEPORTIEREN ]] --

addCommandHandler("lastMarker",function(player)
	if(getElementData(player,"ImIntro") == true)then
		local x,y,z = getElementData(player,"RundfahrtX"),getElementData(player,"RundfahrtY"),getElementData(player,"RundfahrtZ")
		if(x and y and z)then
			local veh = getPedOccupiedVehicle(player)
			if(veh)then
				setElementPosition(veh,x,y,z)
				fixVehicle(veh)
			end
		end
	end
end)

-- [[ WAS PASSIERT, WENN DER SPIELER STIRBT / QUITTET ]] --

addEventHandler("onPlayerWasted",root,function()
	if(isElement(Sequenzen.vehicle[source]))then
		destroyElement(Sequenzen.vehicle[source])
	end
end)

addEventHandler("onPlayerQuit",root,function()
	if(isElement(Sequenzen.vehicle[source]))then
		destroyElement(Sequenzen.vehicle[source])
	end
end)