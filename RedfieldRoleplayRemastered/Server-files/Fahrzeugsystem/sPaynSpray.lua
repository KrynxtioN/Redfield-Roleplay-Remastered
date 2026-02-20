-- [[ GARAGEN ÖFFNEN ]] --

local Garagen = {8,12,11,19,27,40,41,47}
for _,v in pairs(Garagen)do setGarageOpen(v,true) end

-- [[ MARKER ERSTELLEN ]] --

local result = dbPoll(dbQuery(handler,"SELECT * FROM paynspray"),-1)

if(#result >= 1)then
	for _,v in pairs(result)do
		local marker = createMarker(v["Spawnx"],v["Spawny"],v["Spawnz"],"cylinder",4,0,0,0,0)
		createBlip(v["Spawnx"],v["Spawny"],v["Spawnz"],63,0,0,0,0,0,0,100)
		setElementData(marker,"ID",v["ID"])
		
		addEventHandler("onMarkerHit",marker,function(player)
			if(getElementType(player) == "vehicle")then
				local player = getVehicleOccupant(player,0)
				if(player)then
					if(getElementDimension(player) == getElementDimension(marker))then
						if(getElementHealth(getPedOccupiedVehicle(player)) < 1000)then
							local price = 1000-getElementHealth(getPedOccupiedVehicle(player))
							local price = price*0.5
							if(hasMoney(player,price))then
								local time = 1000-math.floor(getElementHealth(getPedOccupiedVehicle(player)))
								setElementFrozen(getPedOccupiedVehicle(player),true)
								setGarageOpen(v["Garage"],false)
								setElementData(player,"GaragenID",v["Garage"])
								setElementData(player,"InPaynSpray",true)
								setTimer(function(player,marker)
									if(isElement(player))then
										if(hasMoney(player,price))then
											setElementData(player,"InPaynSpray",false)
											takeMoney(player,price)
											fixVehicle(getPedOccupiedVehicle(player))
											setGarageOpen(v["Garage"],true)
											setElementFrozen(getPedOccupiedVehicle(player),false)
											removeElementData(player,"GaragenID")
											if(getPlayerData("business","Databasename","PaynSpray"..getElementData(marker,"ID"),"Besitzer") ~= "Niemand")then
												addBizKasse("PaynSpray"..getElementData(marker,"ID"),price)
											end
											setPlayerAchievement(player,20)
										end
									end
								end,2000+15*time,1,player,source)
								infobox(player,loc(player,"Fahrzeugsystem_115"),"info")
							end
						else infobox(player,loc(player,"Fahrzeugsystem_116"),"error")end
					end
				end
			end
		end)
	end
end

addEventHandler("onPlayerWasted",root,function() setElementData(source,"InPaynSpray",false) end)

addEventHandler("onPlayerWasted",root,function()
	if(getElementData(source,"InPaynSpray") == true)then
		local ID = getElementData(source,"GaragenID")
		setGarageOpen(ID,true)
		removeElementData(source,"GaragenID")
	end
end)

addEventHandler("onPlayerQuit",root,function()
	if(getElementData(source,"InPaynSpray") == true)then
		local ID = getElementData(source,"GaragenID")
		setGarageOpen(ID,true)
		removeElementData(source,"GaragenID")
	end
end)
