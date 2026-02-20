-- [[ PICKUPS ERSTELLEN ]] --

local result = dbPoll(dbQuery(handler,"SELECT * FROM teleporter"),-1)

if(#result >= 1)then
	for _,v in pairs(result)do
		local pickup = createPickup(v["Pickupx"],v["Pickupy"],v["Pickupz"],3,1318,50)
		setElementInterior(pickup,v["PickupInterior"])
		setElementDimension(pickup,v["PickupDimension"])
		if(v["Blip"] > 0)then
			createBlip(v["Pickupx"],v["Pickupy"],v["Pickupz"],v["Blip"],0,0,0,0,0,0,100)
		end
		
		addEventHandler("onPickupHit",pickup,function(player)
			if(getElementDimension(player) == getElementDimension(source))then
				if(not(isPedInVehicle(player)))then
					if(getElementData(player,"wirdGeportet") ~= true)then
						setElementFrozen(player,true)
						fadeElementInterior(player,v["SpawnInterior"],v["SpawnDimension"],v["Spawnx"],v["Spawny"],v["Spawnz"],v["Spawnrotz"])
						setElementData(player,"wirdGeportet",true)
						showChat(player,false)

						setTimer(function(player)
							if(isElement(player))then
								setElementData(player,"wirdGeportet",false)
								setElementFrozen(player,false)
								showChat(player,true)
							end
						end,3000,1,player)
					end
				end
			end
		end)
	end
end

-- [[ SPIELER TELEPORTIEREN ]] --

function fadeElementInterior(player,int,dim,x,y,z,rot)
	triggerClientEvent(player,"createLoadscreen",player)
	setTimer(function(player)
		if(isElement(player))then
			setElementPosition(player,x,y,z)
			setPedRotation(player,rot)
			setElementDimension(player,dim)
			setElementInterior(player,int)
			hasPlayerPizza(player)
			refreshCasinoraubMoneybag(player)
			Flaggenjagd.refreshFlag(player)
		end
	end,1200,1,player)
end