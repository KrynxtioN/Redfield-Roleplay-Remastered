-- [[ CHECKEN OB EVENT AKTIV IST / JEMAND GEBURTSTAG HAT ]] --

function Events.isActive(player)
	local time = getRealTime()
	local month, monthday = time.month+1, time.monthday

	if(Events.geburtstagskind ~= "Niemand")then
		if(getPlayerName(player) == Events.geburtstagskind)then
			outputChatBox(loc(player,"Events_13"):format(Events.geburtstagskind),player,255,255,255,true)
		else
			local praemie = getPlayerData("birthday","Geburtstagskind",Events.geburtstagskind,"Praemie")
			if(not(string.find(praemie,getPlayerName(player))))then
				outputChatBox(loc(player,"Events_11"):format(Events.geburtstagskind),player,255,255,255,true)
			else
				outputChatBox(loc(player,"Events_12"):format(Events.geburtstagskind),player,255,255,255,true)
			end
		end
		triggerClientEvent(player,"drawBirthdayBalloons",player)
	end
	
	--[[if(month == 2 and monthday == 14)then
		outputChatBox(loc(player,"Events_1"),player,255,255,255,true)
		outputChatBox(loc(player,"Events_2"),255,255,255)
	end
	if(month == 4 and monthday >= 8 and monthday <= 22)then
		outputChatBox(loc(player,"Events_14"),player,255,255,255,true)
		outputChatBox(loc(player,"Events_15"),player,255,255,255)
	end
	if(month >= 6 and monthday >= 21 and month <= 9 and monthday <= 23)then
		outputChatBox(loc(player,"Events_3"),player,255,255,255,true)
		outputChatBox(loc(player,"Events_4"),player,255,255,255)
	end
	if(month == 10 and monthday >= 26 and monthday <= 31)then
		outputChatBox(loc(player,"Events_5"),player,255,255,255,true)
		outputChatBox(loc(player,"Events_6"),player,255,255,255)
	end
	if(month == 12 and monthday <= 26)then
		outputChatBox(loc(player,"Events_7"),player,255,255,255,true)
		outputChatBox(loc(player,"Events_8"),player,255,255,255)
	end
	if(month >= 12 and monthday >= 28 and month <= 1 and monthday <= 2)then
		outputChatBox(loc(player,"Events_9"),player,255,255,255,true)
		outputChatBox(loc(player,"Events_10"),player,255,255,255)
	end]]--
end

function isHalloween()
	local time = getRealTime()
	local month, monthday = time.month+1, time.monthday
	if(month == 10 and monthday >= 26 and monthday <= 31)then
		return true
	else
		return false
	end
end

-- [[ CHECKEN, OB JEMAND GEBURTSTAG HAT ]] --

function Events.checkBirthday()
	local time = getRealTime()
	local month, monthday = time.month+1, time.monthday
	if(Events.geburtstagskind == "Niemand")then
		for _,v in pairs(Events["Birthday"])do
			if(month == v[1] and monthday == v[2])then
				Events.geburtstagskind = v[3]
				
				for _,v in pairs(getElementsByType("player"))do
					if(getElementData(v,"loggedin") == 1)then
						Events.isActive(v)
					end
				end
				
				break
			end
		end
		if(Events.geburtstagskind == "Niemand")then
			setTimer(Events.checkBirthday,30000,1)
		end
	end
end
Events.checkBirthday()