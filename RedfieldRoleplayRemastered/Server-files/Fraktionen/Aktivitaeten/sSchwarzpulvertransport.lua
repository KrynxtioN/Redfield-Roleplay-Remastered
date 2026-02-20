-- [[ BELADEN ]] --

addEvent("Schwarzpulvertransporter.start",true)
addEventHandler("Schwarzpulvertransporter.start",root,function()
	if(isEvil(client))then
		if(getStateFactionMemberOnline() >= 2)then
			if(isAktionPause(client))then
				if(isAktionAktiv(client))then
					if(hasMoney(client,10000))then
						takeMoney(client,10000)
						Schwarzpulvertransporter.vehicle = createVehicle(455,-690.02728271484,2376.5695800781,130.55940246582,0,0,0)
						changeAktionAktiv()
						
						Schwarzpulvertransporter.refreshTimer = setTimer(function()
							Schwarzpulvertransporter.refresh()
						end,1800000,1)
						
						addEventHandler("onVehicleEnter",Schwarzpulvertransporter.vehicle,function(player)
							if(getPedOccupiedVehicleSeat(player) == 0)then
								if(isEvil(player))then
									triggerClientEvent(player,"Schwarzpulvertransporter.createMarker",player,"create")
									infobox(player,loc(player,"Fraktionen_183"),"info")
								else
									exitVehicle(player)
									infobox(player,loc(player,"Fraktionen_181"),"error")
								end
							end
						end)
						
						addEventHandler("onVehicleExit",Schwarzpulvertransporter.vehicle,function(player)
							triggerClientEvent(player,"Schwarzpulvertransporter.createMarker",player)
						end)
						
						addEventHandler("onVehicleExplode",Schwarzpulvertransporter.vehicle,function()
							Schwarzpulvertransporter.refresh()
							createBreakingNews("Fraktionen_182")
						end)
						
						triggerClientEvent(client,"Schwarzpulvertransporter.createMarker",client,"create")
						warpPedIntoVehicle(client,Schwarzpulvertransporter.vehicle)
						infobox(client,loc(client,"Fraktionen_183"),"info")
						triggerClientEvent(client,"setWindowDatas",client)
						createBreakingNews("Fraktionen_184")
					end
				end
			end
		else infobox(client,loc(client,"Fraktionen_185"),"error")end
	else infobox(client,loc(client,"Fraktionen_186"),"error")end
end)

-- [[ ABGABE ]] --

addEvent("Schwarzpulvertransporter.abgabe",true)
addEventHandler("Schwarzpulvertransporter.abgabe",root,function()
	local veh = getPedOccupiedVehicle(client)
	if(veh and veh == Schwarzpulvertransporter.vehicle and getPedOccupiedVehicleSeat(client) == 0)then
		Schwarzpulvertransporter.refresh()
		infobox(client,loc(client,"Fraktionen_187"),"info")
		setElementData(client,"Schwarzpulver",getElementData(client,"Schwarzpulver")+2500)
		triggerClientEvent(client,"Schwarzpulvertransporter.createMarker",client)
		createBreakingNews("Fraktionen_188")
	end
end)

-- [[ REFRESH ]] --

function Schwarzpulvertransporter.refresh()
	changeAktionAktiv()
	changeAktionPause()
	if(isElement(Schwarzpulvertransporter.vehicle))then
		destroyElement(Schwarzpulvertransporter.vehicle)
	end
	for _,v in pairs(getElementsByType("player"))do
		triggerClientEvent(v,"Schwarzpulvertransporter.createMarker",v)
	end
	if(isTimer(Schwarzpulvertransporter.refreshTimer))then
		killTimer(Schwarzpulvertransporter.refreshTimer)
	end
end

-- [[ WAS PASSIERT, WENN SPIELER STIRBT ]] --

addEventHandler("onPlayerWasted",root,function()
	triggerClientEvent(source,"Schwarzpulvertransporter.createMarker",source)
end)