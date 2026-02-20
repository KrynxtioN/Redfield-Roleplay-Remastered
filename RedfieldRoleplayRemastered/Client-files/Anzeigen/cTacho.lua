local State = false

-- [[ DAS TACHO ]] --

function dxDrawTacho()
	if(isWindowOpen() and not(isPlayerMapVisible()))then
		if(isPedInVehicle(localPlayer))then
			local veh = getPedOccupiedVehicle(localPlayer)
			if(veh)then
				local sx,sy,sz = getElementVelocity(getPedOccupiedVehicle(localPlayer))
				local model = getElementModel(veh)
				if(veh and sx and sy and sz)then
					if(model ~= 509 and model ~= 481 and model ~= 510)then
						local speed = math.floor(((sx^2 + sy^2 + sz^2)^(0.5))*180)
						local benzin = getElementData(veh,"Benzin")
						if(getVehicleEngineState(veh))then r,g,b = 0,255,0 else r,g,b = 255,0,0 end
						local kilometer = math.floor(getElementData(veh,"Kilometer"))
						if(isElementFrozen(veh) == false)then r2,g2,b2 = 255, 255, 255 else r2,g2,b2 = 236, 52, 52 end

						dxDrawRectangle(1157*(x/1440), 772*(y/900), 273*(x/1440), 106*(y/900), tocolor(r2,g2,b2, 125), false)
						dxDrawRectangle(1157*(x/1440), 772*(y/900), 273*(x/1440), 17*(y/900), tocolor(17, 17, 17, 255), false)
						dxDrawText(getVehicleNameFromModel(getElementModel(veh)), 1157*(x/1440), 772*(y/900), 1430*(x/1440), 789*(y/900), tocolor(r,g,b, 255), 1.00*(x/1440), "default-bold", "center", "center", false, false, false, false, false)
						dxDrawRectangle(1167*(x/1440), 799*(y/900), 253*(x/1440), 39*(y/900), tocolor(17, 17, 17, 255), false)
						dxDrawText(tostring(speed).." "..loc("Anzeigen_68"), 1167*(x/1440), 799*(y/900), 1420*(x/1440), 838*(y/900), tocolor(255, 255, 255, 255), 1.30*(x/1440), "default-bold", "center", "center", false, false, false, false, false)
						dxDrawText(loc("Anzeigen_69")..": "..kilometer.." "..loc("Anzeigen_70").." ♦ "..loc("Anzeigen_71")..": "..benzin.." "..loc("Anzeigen_72"), 1157*(x/1440), 848*(y/900), 1430*(x/1440), 878*(y/900), tocolor(0, 0, 0, 255), 1.00*(x/1440), "default-bold", "center", "center", false, false, false, false, false)
						
						if(getVehicleUpgradeOnSlot(veh,8))then
							local nitro = getVehicleNitroLevel(veh) or 0
							dxDrawRectangle(1430*(x/1440), 737*(y/900), -143*(x/1440)/1*nitro, 27*(y/900), tocolor(255, 255, 255, 150), false)
						end
					end
				end
			end
		end
	end
end

-- [[ DAS TACHO BEIM BETRETEN / VERLASSEN VON FAHRZEUGEN EIN UND AUSBLENDEN ]] --

addEventHandler("onClientVehicleEnter",root,function(player)
	if(player == localPlayer and getPedOccupiedVehicleSeat(player) == 0)then
		if(State == false)then
			addEventHandler("onClientRender",root,dxDrawTacho)
			State = true
		end
	end
end)

addEventHandler("onClientVehicleExit",root,function(player)
	if(player == localPlayer)then
		State = false
		removeEventHandler("onClientRender",root,dxDrawTacho)
	end
end)

-- [[ WAS PASSIERT, WENN DER SPIELER STIRBT ]] --

addEventHandler("onClientPlayerWasted",root,function(player)
	if(player == localPlayer)then
		removeEventHandler("onClientRender",root,dxDrawTacho)
		State = false
	end
end)