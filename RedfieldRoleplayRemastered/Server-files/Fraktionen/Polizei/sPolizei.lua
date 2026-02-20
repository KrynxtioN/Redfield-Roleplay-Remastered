-- [[ EINKNASTMARKER ]] --

Einknasten_SFPD = createMarker(-1590.1864013672,716.22076416016,-5.2421875-2,"cylinder",4,200,200,0,75)
Einknasten_FBI = createMarker(-1744.0725097656,769.17596435547,24.890625-2,"cylinder",4,200,200,0,75)

-- [[ KNAST-CHECK ]] --

function Polizei.checkGefaengnis(player)
	if(tonumber(getElementData(player,"Jailtime")) >= 1)then
		removePedFromVehicle(player)
		local rnd = math.random(1,#Polizei["Gefaengnis"])
		local x,y,z,rot = Polizei["Gefaengnis"][rnd][1],Polizei["Gefaengnis"][rnd][2],Polizei["Gefaengnis"][rnd][3],Polizei["Gefaengnis"][rnd][4]
		setElementPosition(player,x,y,z)
		setPedRotation(player,rot)
		setElementInterior(player,10)
		setElementDimension(player,0)
		takeAllWeapons(player)
		triggerClientEvent(player,"Staatsfraktionen.dxDraw",player,"create")
		toggleAllControls(player,true)
	end
end

-- [[ STELLEN ]] --

addEvent("Polizei.stellen",true)
addEventHandler("Polizei.stellen",root,function()
	if(getElementData(client,"Wanteds") >= 1)then
		triggerClientEvent(client,"setWindowDatas",client)
		setElementData(client,"Jailtime",getElementData(client,"Wanteds")*2)
		Polizei.checkGefaengnis(client)
		setElementData(client,"Wanteds",0)
		setPlayerAchievement(client,21)
	else infobox(client,loc(client,"Fraktionen_259"),"error")end
end)

-- [[ KAUTION EINES SPIELERS ZAHLEN ]] --

addEvent("Polizei.kaution",true)
addEventHandler("Polizei.kaution",root,function(target)
	local target = getPlayerFromName(target)
	if(existPlayer(client,target))then
		if(getElementData(target,"Jailtime") >= 1)then
			local preis = 500
			if(hasMoney(client,getElementData(target,"Jailtime")*preis))then
				takeMoney(client,getElementData(target,"Jailtime")*preis)
				infobox(client,loc(client,"Fraktionen_260"):format(getPlayerName(target)),"info")
				infobox(target,loc(target,"Fraktionen_261"):format(getPlayerName(client)),"info")
				fadeElementInterior(target,0,0,-1605.1999511719,717.5,11.89999961853,0)
			end
		else infobox(client,loc(client,"Fraktionen_262"),"error")end
	end
end)

-- [[ SPIELER EINKNASTEN ]] --

function Polizei.einknasten(player)
	if(getElementType(player) == "vehicle")then
		local player = getVehicleOccupant(player,0)
		if(getPedOccupiedVehicleSeat(player) == 0)then
			if(isStateFaction(player) and isStaatDuty(player))then
				local veh = getPedOccupiedVehicle(player)
				if(getElementData(veh,"Fraktion") == 1 or getElementData(veh,"Fraktion") == 2 or getElementData(veh,"Fraktion") == 3)then
					for _,v in pairs(getElementsByType("player"))do
						if(isPedInVehicle(v))then
							if(getPedOccupiedVehicle(v) == getPedOccupiedVehicle(player))then
								if(getElementData(v,"Wanteds") >= 1)then
									local time = getElementData(v,"Wanteds")*2
									setElementData(v,"Jailtime",time)
									Polizei.checkGefaengnis(v)
									for _,k in pairs(getElementsByType("player"))do
										if(getElementData(k,"loggedin") == 1)then
											outputChatBox(loc(k,"Fraktionen_263"):format(getPlayerName(v),getPlayerName(player)),root,100,100,0)
										end
									end
									infobox(player,loc(player,"Fraktionen_264"):format(getPlayerName(v)),"info")
									infobox(v,loc(v,"Fraktionen_265"):format(getPlayerName(player),getElementData(v,"Wanteds")*time),"error")
									setElementData(v,"Wanteds",0)
									Polize["PaydayBonus"][getElementData(player,"Fraktion")] = Polize["PaydayBonus"][getElementData(player,"Fraktion")] + 1 
								end
							end
						end
					end
				end
			end
		end
	end
end
addEventHandler("onMarkerHit",Einknasten_SFPD,Polizei.einknasten)
addEventHandler("onMarkerHit",Einknasten_FBI,Polizei.einknasten)