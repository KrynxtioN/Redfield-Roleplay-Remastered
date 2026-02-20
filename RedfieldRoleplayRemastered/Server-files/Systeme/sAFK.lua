-- [[ CHECKEN OB SPIELER AFK GESETZT WERDEN SOLL ]] --

setTimer(function()
	for _,v in pairs(getElementsByType("player"))do
		if(getPlayerIdleTime(v) > 300000)then
			if(getElementData(v,"AFK") ~= true)then
				AFK[v] = math.random(1111,9999)
				outputChatBox(loc(v,"Systeme_221"):format(AFK[v]),v,255,255,255,true)
				setElementData(v,"AFK",true)
				if(isPedInVehicle(v))then
					local veh = getPedOccupiedVehicle(v)
					setElementFrozen(veh,true)
					
					addEventHandler("onVehicleStartExit",veh,function(player)
						if(getElementData(player,"AFK") == true)then
							cancelEvent()
							infobox(player,loc(player,"Systeme_222"):format(AFK[player]),"info")
						end
					end)
				else
					setElementFrozen(v,true)
				end
			end
		end
	end
end,30000,0)

-- [[ AUS DEM AFK MODUS GEHEN ]] --

addCommandHandler("afk",function(player,cmd,number)
	if(getElementData(player,"AFK") == true)then
		if(AFK[player])then
			if(number)then
				if(tonumber(number) == AFK[player])then
					setElementData(player,"AFK",false)
					setElementFrozen(player,false)
					infobox(player,loc(player,"Systeme_223"),"info")
					if(isPedInVehicle(player))then
						setElementFrozen(getPedOccupiedVehicle(player),false)
					end
					AFK[player] = nil
				else infobox(player,loc(player,"Systeme_224"),"error")end
			else infobox(player,loc(player,"Systeme_225"):format(AFK[player]),"error")end
		end
	end
end)