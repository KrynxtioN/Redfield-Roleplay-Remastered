-- [[ WANTEDCARD EINSAMMELN ]] --

local Pickup = createPickup(90.155487060547,-305.32257080078,1.578125,3,1581,50)
local Vehicle = createVehicle(428,90.126953125,-301.48046875,1.827919960022,0,0,0)
setElementFrozen(Vehicle,true)
setVehicleDamageProof(Vehicle,true)
setVehicleLocked(Vehicle,true)
setVehicleColor(Vehicle,0,0,0)

addEventHandler("onPickupHit",Pickup,function(player)
	if(not(isStateFaction(player)))then
		if(Wantedcard[player] ~= true)then
			Wantedcard[player] = true
			setTimer(function(player)
				infobox(player,loc(player,"Fraktionen_196"),"error")
				Wantedcard[player] = nil
			end,900000,1,player)
			infobox(player,loc(player,"Fraktionen_197"),"info")
		else infobox(player,loc(player,"Fraktionen_198"),"error")end
	else infobox(player,loc(player,"Fraktionen_199"),"error")end
end)

-- [[ WANTEDS LÖSCHEN ]] --

addEvent("Wantedcard.delete",true)
addEventHandler("Wantedcard.delete",root,function()
	infobox(client,loc(client,"Fraktionen_200"),"info")
	setElementData(client,"Wanteds",0)
	triggerClientEvent(client,"Wantedcard.client",client)
end)