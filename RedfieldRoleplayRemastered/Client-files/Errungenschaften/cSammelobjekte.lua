-- [[ DIE MARKER ZUM EINSAMMELN ERSTELLEN ]] --

addEvent("Sammelobjekte.createMarker",true)
addEventHandler("Sammelobjekte.createMarker",root,function(id,type)
	local marker = createMarker(Sammelobjekte[type][id][1],Sammelobjekte[type][id][2],Sammelobjekte[type][id][3],"cylinder",2,255,0,0,25)
	
	addEventHandler("onClientMarkerHit",marker,function(player)
		if(player == localPlayer)then
			if(not(isPedInVehicle(localPlayer)))then
				if(getElementDimension(localPlayer) == getElementDimension(source))then
					local px,py,pz = getElementPosition(localPlayer)
					local mx,my,mz = getElementPosition(source)
					if(isPedOnGround(localPlayer) and pz <= mz + 2)then
						destroyElement(source)
						setElementData(player,type,getElementData(player,type)+1)
						triggerServerEvent("Sammelobjekte.einsammeln",localPlayer,id,type)
					end
				end
			end
		end
	end)
end)

-- [[ DIE PICKUPS ZUM EINSAMMELN ERSTELLEN ]] --

addEvent("Sammelobjekte.createPickup",true)
addEventHandler("Sammelobjekte.createPickup",root,function(id,type)
	local model,x,y,z = Sammelobjekte[type][id][1],Sammelobjekte[type][id][2],Sammelobjekte[type][id][3],Sammelobjekte[type][id][4]
	local pickup = createPickup(x,y,z,3,model,50)
	setElementData(pickup,"SammelobjektePickupID",id)
	setElementData(pickup,"SammelobjekteType",type)
	
	addEventHandler("onClientPickupHit",pickup,function(player)
		if(player == localPlayer)then
			if(not(isPedInVehicle(localPlayer)))then
				if(getElementDimension(localPlayer) == getElementDimension(source))then
					local id = getElementData(source,"SammelobjektePickupID")
					local typ = getElementData(source,"SammelobjekteType")
					triggerServerEvent("Sammelobjekte.pickupEinsammeln",localPlayer,id,typ)
					destroyElement(source)
				end
			end
		end
	end)
end)