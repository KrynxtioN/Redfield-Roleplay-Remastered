-- [[ AUSSTELLUNGSSTÜCKE LADEN ]] --

for _,v in pairs(Autohaus["Fahrzeuge"])do
	local vehicle = createVehicle(v[1],v[2],v[3],v[4],v[5],v[6],v[7])
	setElementFrozen(vehicle,true)
	setVehicleDamageProof(vehicle,true)
	setVehicleColor(vehicle,255,255,255)
	local marker = createMarker(v[9],v[10],v[11]-1,"cylinder",1,255,0,0)
	
	addEventHandler("onClientMarkerHit",marker,function(player)
		if(player == localPlayer)then
			if(not(isPedInVehicle(localPlayer)))then
				if(isPedOnGround(localPlayer))then
					local x,y,z = getElementPosition(localPlayer)
					local mx,my,mz = getElementPosition(source)
					if(math.floor(z) == math.floor(mz + 1))then
						if(getElementDimension(localPlayer) == getElementDimension(source))then
							Autohaus.vehicleID[localPlayer] = v[1]
							Autohaus.vehicleBusinessID[localPlayer] = v[8]
							Autohaus.vehicleSpawnX[localPlayer] = v[12]
							Autohaus.vehicleSpawnY[localPlayer] = v[13]
							Autohaus.vehicleSpawnZ[localPlayer] = v[14]
							Autohaus.vehicleRotation[localPlayer] = v[15]
							triggerServerEvent("Autohaus.vehicleInfo",localPlayer,v[8],v[1])
						end
					end
				end
			end
		end
	end)
	
	addEventHandler("onClientMarkerLeave",marker,function(player)
		if(player == localPlayer)then
			Autohaus.vehicleID[localPlayer] = nil
			Autohaus.vehicleBusinessID[localPlayer] = nil
		end
	end)
end

-- [[ FAHRZEUGE KAUFEN / TESTFART STARTEN ]] --

bindKey("j","down",function()
	if(Autohaus.vehicleID[localPlayer] ~= nil)then
		if(not(isPedDead(localPlayer)))then
			triggerServerEvent("Autohaus.buy",localPlayer,localPlayer,Autohaus.vehicleID[localPlayer],_,Autohaus.vehicleSpawnX[localPlayer],Autohaus.vehicleSpawnY[localPlayer],Autohaus.vehicleSpawnZ[localPlayer],Autohaus.vehicleRotation[localPlayer],0,0,getPlayerName(localPlayer),getPlayerName(localPlayer),Autohaus.vehicleBusinessID[localPlayer])
		end
	end
end)

bindKey("f7","down",function()
	if(Autohaus.vehicleID[localPlayer] ~= nil)then
		if(not(isPedDead(localPlayer)))then
			triggerServerEvent("Autohaus.testfahrt",localPlayer,Autohaus.vehicleID[localPlayer],Autohaus.vehicleSpawnX[localPlayer],Autohaus.vehicleSpawnY[localPlayer],Autohaus.vehicleSpawnZ[localPlayer],Autohaus.vehicleRotation[localPlayer])
		end
	end
end)