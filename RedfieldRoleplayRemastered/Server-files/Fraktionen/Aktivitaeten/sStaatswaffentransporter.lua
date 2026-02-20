-- [[ DAS FENSTER ÖFFNEN ]] --

addEvent("Staatswaffentransporter.openWindow",true)
addEventHandler("Staatswaffentransporter.openWindow",root,function()
	if(isStateFaction(client) and isStaatDuty(client))then
		triggerClientEvent(client,"Staatswaffentransporter.openWindow",client)
	end
end)

-- [[ STARTEN ]] --

addEvent("Staatswaffentransporter.start",true)
addEventHandler("Staatswaffentransporter.start",root,function()
	if(isStateFaction(client) and isStaatDuty(client))then
		if(getGangFactionMemberOnline() >= 2)then
			if(isAktionPause(client))then
				if(isAktionAktiv(client))then
					changeAktionAktiv()
					Staatswaffentransporter.vehicle = createVehicle(455,132.30000305176,1951.5999755859,20,0,0,0)
					warpPedIntoVehicle(client,Staatswaffentransporter.vehicle)
					infobox(client,loc(client,"Fraktionen_190"),"info")
					triggerClientEvent(client,"Staatswaffentransporter.marker",client,"create")
					triggerClientEvent(client,"setWindowDatas",client)
					createBreakingNews("Fraktionen_191")
					
					Staatswaffentransporter.refreshTimer = setTimer(function()
						Staatswaffentransporter.finish()
					end,1800000,1)
					
					addEventHandler("onVehicleExit",Staatswaffentransporter.vehicle,function(player)
						triggerClientEvent(player,"Staatswaffentransporter.create",player)
					end)
					
					addEventHandler("onVehicleEnter",Staatswaffentransporter.vehicle,function(player)
						if(isStateFaction(player) and isDuty(player))then
							if(getPedOccupideVehicleSeat(player) == 0)then
								triggerClientEvent(player,"Staatswaffentransporter.marker",player,"create")
								infobox(player,loc(player,"Fraktionen_192"),"info")
							end
						end
					end)
					
					addEventHandler("onVehicleExplode",Staatswaffentransporter.vehicle,function()
						Staatswaffentransporter.finish()
					end)
				end
			end
		else infobox(client,loc(client,"Fraktionen_193"),"error")end
	end
end)

-- [[ AKTION BEENDEN ]] --

function Staatswaffentransporter.finish(player)
	if(isTimer(Staatswaffentransporter.refreshTimer))then
		killTimer(Staatswaffentransporter.refreshTimer)
	end
	if(isElement(Staatswaffentransporter.vehicle))then
		destroyElement(Staatswaffentransporter.vehicle)
	end
	changeAktionAktiv()
	changeAktionPause()
	
	for _,v in pairs(getElementsByType("player"))do
		triggerClientEvent(v,"Staatswaffentransporter.marker",v)
	end
end

-- [[ ABGABE ]] --

addEvent("Staatswaffentransporter.abgabe",true)
addEventHandler("Staatswaffentransporter.abgabe",root,function()
	infobox(client,loc(client,"Fraktionen_194"),"info")
	local newRearms = getPlayerData("fraktionslager","ID","1","Pakete")+50
	dbExec(handler,"UPDATE fraktionslager SET Pakete = '"..newRearms.."' WHERE ID = '1'")
	Staatswaffentransporter.finish(client)
	createBreakingNews("Fraktionen_195")
end)

-- [[ WAS PASSIERT, WENN SPIELER STIRBT ]] --

addEventHandler("onPlayerWasted",root,function()
	triggerClientEvent(source,"Staatswaffentransporter.marker",source)
end)