-- [[ BELADEN ]] --

addEvent("Drogentransporter.beladen",true)
addEventHandler("Drogentransporter.beladen",root,function(menge,type)
	local menge = tonumber(menge)
	if(getStateFactionMemberOnline() >= 2)then
		if(isAktionPause(client))then
			if(isAktionAktiv(client))then
				if(type == "Verkaufen")then
					if(getElementData(client,"Gras") >= menge)then
						setElementData(client,"Gras",getElementData(client,"Gras")-menge)
						Drogentransporter.vehicle = createVehicle(455,1703.3000488281,679.29998779297,11.39999961853,0,0,0)
						setElementData(Drogentransporter.vehicle,"Money",menge*Drogentransporter.preis)
					else infobox(client,loc(client,"Fraktionen_154"),"error")end
				elseif(type == "Kaufen")then
					if(hasMoney(client,menge*Drogentransporter.costs))then
						takeMoney(client,menge*Drogentransporter.costs)
						Drogentransporter.vehicle = createVehicle(455,1703.3000488281,679.29998779297,11.39999961853,0,0,0)
						setElementData(Drogentransporter.vehicle,"Drugs",menge)
					end
				end
				
				if(isElement(Drogentransporter.vehicle))then
					changeAktionAktiv()
					
					Drogentransporter.refreshTimer = setTimer(function()
						Drogentransporter.refresh()
					end,1800000,1)
					
					addEventHandler("onVehicleEnter",Drogentransporter.vehicle,function(player)
						if(getPedOccupiedVehicleSeat(player) == 0)then
							if(isEvil(player))then
								triggerClientEvent(player,"Drogentransporter.marker",player,"create")
							else
								exitVehicle(player)
								infobox(player,loc(player,"Fraktionen_155"),"error")
							end
						end
					end)
					
					addEventHandler("onVehicleExit",Drogentransporter.vehicle,function(player)
						triggerClientEvent(player,"Drogentransporter.marker",player)
					end)
					
					addEventHandler("onVehicleExplode",Drogentransporter.vehicle,function()
						Drogentransporter.refresh()
					end)
					
					triggerClientEvent(client,"Drogentransporter.marker",client,"create")
					warpPedIntoVehicle(client,Drogentransporter.vehicle)
					infobox(client,loc(client,"Fraktionen_156"),"info")
					triggerClientEvent(client,"setWindowDatas",client)
					createBreakingNews("Fraktionen_157")
				end
			end
		end
	else infobox(client,loc(client,"Fraktionen_158"),"error")end
end)

-- [[ ABGABE ]] --

addEvent("Drogentransporter.abgabe",true)
addEventHandler("Drogentransporter.abgabe",root,function()
	local veh = getPedOccupiedVehicle(client)
	if(veh and veh == Drogentransporter.vehicle and getPedOccupiedVehicleSeat(client) == 0)then
		if(getElementData(veh,"Money"))then
			setElementData(client,"Money",getElementData(client,"Money")+getElementData(veh,"Money"))
			infobox(client,loc(client,"Fraktionen_159"):format(getElementData(veh,"Money")),"info")
			outputLog("[Drogentransporter]: "..getPlayerName(client).." hat einen Drogentransporter abgegeben und $"..getElementData(veh,"Money").." bekommen.","Fraktionen")
		elseif(getElementData(veh,"Drugs"))then
			setElementData(client,"Gras",getElementData(client,"Gras")+getElementData(veh,"Drugs"))
			infobox(client,loc(client,"Fraktionen_160"):format(getElementData(client,"Drugs")),"info")
			outputLog("[Drogentransporter]: "..getPlayerName(client).." hat einen Drogentransporter abgegeben und "..getElementData(client,"Drugs").."g Gras bekommen.","Fraktionen")
		end
		createBreakingNews("Fraktionen_161")
		Drogentransporter.refresh()
	end
end)

-- [[ REFRESH ]] --

function Drogentransporter.refresh()
	changeAktionAktiv()
	changeAktionPause()
	if(isElement(Drogentransporter.vehicle))then
		destroyElement(Drogentransporter.vehicle)
	end
	for _,v in pairs(getElementsByType("player"))do
		triggerClientEvent(v,"Drogentransporter.marker",v)
		setElementData(v,"Drugs",0)
	end
	if(isTimer(Drogentransporter.refreshTimer))then
		killTimer(Drogentransporter.refreshTimer)
	end
end

-- [[ WAS PASSIERT, WENN SPIELER STIRBT ]] --

addEventHandler("onPlayerWasted",root,function()
	triggerClientEvent(source,"Drogentransporter.marker",source)
end)