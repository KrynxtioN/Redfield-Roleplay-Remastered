-- [[ NEWS ]] --

addCommandHandler("news",function(player,cmd,...)
	if(getElementData(player,"Unternehmen") == 2)then
		if(isUnternehmenDuty(player))then
			if(isPedInVehicle(player))then
				local veh = getPedOccupiedVehicle(player)
				if(getElementData(veh,"Unternehmen") == 2)then
					outputChatBox("Reporter "..getPlayerName(player)..": "..convertText(...),root,250,100,0)
				end
			end
		end
	end
end)