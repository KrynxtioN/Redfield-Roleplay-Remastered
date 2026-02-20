local Fallschirm = createPickup(-1544.0135498047,-441.29058837891,6,3,371,50)

addEventHandler("onPickupHit",Fallschirm,function(player)
	if(not(isPedInVehicle(player)))then
		takeWeapon(player,11)
		giveWeapon(player,46,1,true)
		infobox(player,loc(player,"Systeme_220"),"info")
	end
end)