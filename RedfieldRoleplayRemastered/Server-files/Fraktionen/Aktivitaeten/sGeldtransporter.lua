-- [[ DAS FENSTER ÖFFNEN ]] --

addEvent("Geldtransporter.openWindow",true)
addEventHandler("Geldtransporter.openWindow",root,function()
	if(isStateFaction(client) and isStaatDuty(client))then
		triggerClientEvent(client,"Geldtransporter.openWindow",client)
	end
end)

-- [[ STARTEN ]] --

addEvent("Geldtransporter.start",true)
addEventHandler("Geldtransporter.start",root,function()
	if(isStateFaction(client) and isStaatDuty(client))then
		if(getGangFactionMemberOnline() >= 2)then
			if(isAktionPause(client))then
				if(isAktionAktiv(client))then
					changeAktionAktiv()
					for _,v in pairs(getElementsByType("player"))do
						if(getElementData(v,"loggedin") == 1)then
							if(isStateFaction(v))then
								outputChatBox(loc(v,"Fraktionen_160"),v,0,125,0)
							end
						end
					end
					Geldtransporter.veh = createVehicle(428,2299,12.699999809265,26.700000762939,0,0,0)
					setElementFrozen(Geldtransporter.veh,true)
					setVehicleLocked(Geldtransporter.veh,true)
					setElementData(Geldtransporter.veh,"Moneybags",0)
					setVehicleColor(Geldtransporter.veh,0,0,0)
					triggerClientEvent(client,"setWindowDatas",client)
					
					Geldtransporter.refreshTimer = setTimer(function()
						Geldtransporter.destroy()
					end,1800000,1)
					
					addEventHandler("onVehicleExplode",Geldtransporter.veh,function()
						local gx,gy,gz = getElementPosition(Geldtransporter.veh)
						local moneybags = getElementData(Geldtransporter.veh,"Moneybags")
						
						for i = 1,moneybags do
							if(math.random(1,2) == 1)then
								Geldtransporter.moneyPickup[i] = createPickup(gx+0.3*i,gy+math.random(4,10),gz,3,1550,50)
							else
								Geldtransporter.moneyPickup[i] = createPickup(gx-0.3*i,gy+math.random(4,10),gz,3,1550,50)
							end
							addEventHandler("onPickupHit",Geldtransporter.moneyPickup[i],function(player)
								if(isEvil(player))then
									local money = Geldtransporter.moneyprosack
									infobox(player,loc(player,"Fraktionen_161"):format(money),"info")
									destroyElement(source)
									setElementData(player,"Geld",getElementData(player,"Geld")+money)
								end
							end)
						end
						Geldtransporter.destroy()
						createBreakingNews("Fraktionen_162")
					end)
					
					addEventHandler("onVehicleExit",Geldtransporter.veh,function(player)
						triggerClientEvent(player,"Geldtransporter.marker",player)
					end)
					
					addEventHandler("onVehicleEnter",Geldtransporter.veh,function(player)
						if(getPedOccupiedVehicleSeat(player) == 0)then
							if(isStateFaction(player) and isStaatDuty(player))then
								triggerClientEvent(player,"Geldtransporter.marker",player,"create")
							end
						end
					end)

					addEventHandler("onElementClicked",Geldtransporter.veh,function(button,state,player)
						if(button == "left" and state == "down")then
							if(isElement(Geldtransporter.playerBag[player]))then
								destroyElement(Geldtransporter.playerBag[player])
								infobox(player,loc(player,"Fraktionen_163"),"info")
								setElementData(Geldtransporter.veh,"Moneybags",getElementData(Geldtransporter.veh,"Moneybags")+1)
								if(getElementData(Geldtransporter.veh,"Moneybags") >= 25)then
									setElementFrozen(Geldtransporter.veh,false)
									setVehicleLocked(Geldtransporter.veh,false)
									for _,v in pairs(getElementsByType("player"))do
										if(getElementData(v,"loggedin") == 1)then
											if(isStateFaction(v))then
												outputChatBox(loc(v,"Fraktionen_164"),v,0,125,0)
											end
										end
									end
								end
								createBreakingNews("Fraktionen_165")
							end
						end
					end)
					
					for i,v in pairs(Geldtransporter["Moneybags"])do
						Geldtransporter.bags[i] = createObject(1550,v[1],v[2],v[3],0,0,math.random(0,360))
						setElementData(Geldtransporter.bags[i],"GeldtransporterMoneyBag",true)
					end
				end
			end
		else infobox(client,loc(client,"Fraktionen_166"),"error")end
	end
end)

-- [[ ELEMENTE ZERSTÖREN ]] --

function Geldtransporter.destroy()
	if(isElement(Geldtransporter.veh))then destroyElement(Geldtransporter.veh)end
	for i = 1,#Geldtransporter["Moneybags"] do
		if(isElement(Geldtransporter.bags[i]))then
			destroyElement(Geldtransporter.bags[i])
		end
	end
	for _,v in pairs(getElementsByType("player"))do
		if(isElement(Geldtransporter.playerBag[v]))then destroyElement(Geldtransporter.playerBag[v])end
		triggerClientEvent(v,"Geldtransporter.marker",v)
	end
	for i = 1,25 do
		if(isElement(Geldtransporter.moneyPickup[i]))then
			destroyElement(Geldtransporter.moneyPickup[i])
		end
	end
	if(isTimer(Geldtransporter.refreshTimer))then
		killTimer(Geldtransporter.refreshTimer)
	end
	changeAktionAktiv()
	changeAktionPause()
end
 
-- [[ GELDSACK EINSAMMELN ]] --

function Geldtransporter.takeMoneybag(player)
	Geldtransporter.playerBag[player] = createObject(1550,0,0,0,0,0,0)
	attachElements(Geldtransporter.playerBag[player],player,0,0.4,0)
end

-- [[ ABGABE ]] --

addEvent("Geldtransporter.abgabe",true)
addEventHandler("Geldtransporter.abgabe",root,function()
	Geldtransporter.destroy()
	changeAktionAktiv()
	changeAktionPause()
	addToLager(getElementData(client,"Fraktion"),"Geld",getAktionsMoney(Geldtransporter.money,"Staatsfraktion"),"fraktionslager")
	createBreakingNews("Fraktionen_167")
end)

-- [[ WAS PASSIERT, WENN SPIELER STIRBT / QUITTET ]] --

addEventHandler("onPlayerQuit",root,function()
	if(isElement(Geldtransporter.playerBag[source]))then
		destroyElement(Geldtransporter.playerBag[source])
	end
end)
 
addEventHandler("onPlayerWasted",root,function()
	if(isElement(Geldtransporter.playerBag[source]))then
		destroyElement(Geldtransporter.playerBag[source])
	end
	triggerClientEvent(source,"Geldtransporter.marker",source)
end)