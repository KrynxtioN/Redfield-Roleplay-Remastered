-- [[ SPAMSCHUTZ ]] --

setTimer(function()
	for _,v in pairs(getElementsByType("player"))do
		Chatsystem.messages[v] = 0
	end
end,1000,0)

-- [[ TEXT KONVERTIEREN ]] --

function convertText(...)
	local tbl = {...}
	return table.concat(tbl," ")
end

-- [[ ME-CHAT ]] --

function meCMD(player,...)
	local x,y,z = getElementPosition(player)
	for _,v in ipairs(getElementsByType("player"))do
		if(getDistanceBetweenPoints3D(x,y,z,getElementPosition(v)) <= 20)then
			outputChatBox(getPlayerName(player).." "..convertText(...),v,200,0,200)
		end
	end
end

-- [[ CHATTEN ]] --

addEventHandler("onPlayerChat",root,function(message,messageTyp)
	if(getElementData(source,"loggedin") == 1)then
		if(getElementData(source,"Gemuted") == 0)then
			if(messageTyp == 0)then
				Chatsystem.messages[source] = Chatsystem.messages[source] + 1
				if(Chatsystem.messages[source] < 3)then
					local x,y,z = getElementPosition(source)
					if(getElementData(source,"Telefonpartner") ~= false and getElementData(source,"RuftAn") == false and getElementData(source,"WirdAngerufen") == false)then
						local target = getPlayerFromName(getElementData(source,"Telefonpartner"))
						if(isElement(target))then
							outputChatBox(getPlayerName(source).." (am Handy) sagt: "..message,target,0,255,0)
						end
					end
					for _,v in pairs(getElementsByType("player"))do
						if(getDistanceBetweenPoints3D(x,y,z,getElementPosition(v)) <= 20)then
							if(getElementData(source,"Telefonpartner") ~= false and getElementData(source,"RuftAn") == false and getElementData(source,"WirdAngerufen") == false)then
								outputChatBox(getPlayerName(source).." (am Handy) sagt: "..message,v,255,255,255)
							else
								outputChatBox(getPlayerName(source).." sagt: "..message,v,255,255,255)
							end
						end
					end
				end
			elseif(messageTyp == 2)then
				executeCommandHandler("t",source,message)
			end
		end
	end
	cancelEvent()
end)

-- [[ FRAKTIONSCHAT ]] --

addCommandHandler("t",function(player,cmd,...)
	if(getElementData(player,"Gemuted") == 0)then
		if(getElementData(player,"Fraktion") >= 1)then
			local rang = Fraktionssystem["Fraktionsrangnamen"][getElementData(player,"Fraktion")][getElementData(player,"Fraktionrang")]
			local text = convertText(...)
			if(text == nil)then
				infobox(player,"Du hast keinen Text angegeben!","error")
			elseif(text == "" or text == " " or text == "  ")then
				infobox(player,"Du hast keinen Text angegeben!","error")
			else
				for _,v in pairs(getElementsByType("player"))do
					if(getElementData(v,"loggedin") == 1)then
						if(getElementData(v,"Fraktion") == getElementData(player,"Fraktion"))then
							outputChatBox(rang.." "..getPlayerName(player)..": "..text,v,0,200,200)
						end
					end
				end
			end
		end
	end
end)

-- [[ UNTERNEHMENSCHAT ]] --

addCommandHandler("u",function(player,cmd,...)
	if(getElementData(player,"Gemuted") == 0)then
		if(getElementData(player,"Unternehmen") >= 1)then
			local rang = Fraktionssystem["Unternehmenrangnamen"][getElementData(player,"Unternehmen")][getElementData(player,"Unternehmenrang")]
			local text = convertText(...)
			if(text == nil)then
				infobox(player,"Du hast keinen Text angegeben!","error")
			elseif(text == "" or text == " " or text == "  ")then
				infobox(player,"Du hast keinen Text angegeben!","error")
			else
				for _,v in pairs(getElementsByType("player"))do
					if(getElementData(v,"loggedin") == 1)then
						if(getElementData(v,"Unternehmen") == getElementData(player,"Unternehmen"))then
							outputChatBox(rang.." "..getPlayerName(player)..": "..text,v,0,200,200)
						end
					end
				end
			end
		end
	end
end)

-- [[ SCHREIEN ]] --

addCommandHandler("s",function(player,cmd,...)
	if(getElementData(player,"Gemuted") == 0)then
		local x,y,z = getElementPosition(player)
		local text = convertText(...)
		if(text == nil)then
			infobox(player,"Du hast keinen Text angegeben!","error")
		elseif(text == "" or text == " " or text == "  ")then
			infobox(player,"Du hast keinen Text angegeben!","error")
		else
			for _,v in pairs(getElementsByType("player"))do
				if(getDistanceBetweenPoints3D(x,y,z,getElementPosition(v)) <= 50)then
					outputChatBox(getPlayerName(player).." schreit: "..text.."!!!",v,255,255,255)
				end
			end
		end
	end
end)

-- [[ NEULINGSCHAT ]] --

addCommandHandler("n",function(player,cmd,...)
	if(getElementData(player,"Gemuted") == 0)then
		if(getElementData(player,"Level") <= 3)then
			local text = convertText(...)
			if(text == nil)then
				infobox(player,"Du hast keinen Text angegeben!","error")
			elseif(text == "" or text == " " or text == "  ")then
				infobox(player,"Du hast keinen Text angegeben!","error")
			else
				if(not(string.find(convertText(...),"starttruck")))then
					for _,v in pairs(getElementsByType("player"))do
						if(getElementData(v,"loggedin") == 1)then
							if(tonumber(getElementData(v,"Level")) <= 3)then
								outputChatBox("Neuling "..getPlayerName(player)..": "..text,v,200,100,0)
							end
						end
					end
				else infobox(player,"Was soll starttruck bedeuten, bitte unterlassen!","error")end
			end
		end
	end
end)

-- [[ JOBCHAT ]] --

addCommandHandler("j",function(player,cmd,...)
	if(getElementData(player,"Gemuted") == 0)then
		if(getElementData(player,"Job") ~= "Arbeitslos")then
			local text = convertText(...)
			if(text == nil)then
				infobox(player,"Du hast keinen Text angegeben!","error")
			elseif(text == "" or text == " " or text == "  ")then
				infobox(player,"Du hast keinen Text angegeben!","error")
			else
				for _,v in pairs(getElementsByType("player"))do
					if(getElementData(v,"loggedin") == 1)then
						if(getElementData(v,"Job") == getElementData(player,"Job"))then
							outputChatBox(getElementData(player,"Job").." "..getPlayerName(player)..": "..text,v,0,200,0)
						end
					end
				end
			end
		end
	end
end)

-- [[ A-CHAT ]] --

addCommandHandler("a",function(player,cmd,...)
	if(getElementData(player,"Gemuted") == 0)then
		if(getElementData(player,"Adminlevel") >= 1)then
			local text = convertText(...)
			if(text == nil)then
				infobox(player,"Du hast keinen Text angegeben!","error")
			elseif(text == "" or text == " " or text == "  ")then
				infobox(player,"Du hast keinen Text angegeben!","error")
			else
				for _,v in pairs(getElementsByType("player"))do
					if(getElementData(v,"loggedin") == 1)then
						if(tonumber(getElementData(v,"Adminlevel")) >= 1)then
							outputChatBox("[A-CHAT] "..getPlayerName(player)..": "..text,v,66, 134, 244)
						end
					end
				end
			end
		end
	end
end)

-- [[ O-CHAT ]] --

addCommandHandler("o",function(player,cmd,...)
	if(getElementData(player,"Gemuted") == 0)then
		if(getElementData(player,"Adminlevel") >= 1)then
			local text = convertText(...)
			if(text == nil)then
				infobox(player,"Du hast keinen Text angegeben!","error")
			elseif(text == "" or text == " " or text == "  ")then
				infobox(player,"Du hast keinen Text angegeben!","error")
			else
				for _,v in pairs(getElementsByType("player"))do
					outputChatBox("(( "..Adminsystem["Names"][getElementData(player,"Adminlevel")].." "..getPlayerName(player)..": "..convertText(...).."))",v,255,255,255)
				end
			end
		end
	end
end)

-- [[ MEGAPHONE ]] --

addCommandHandler("m",function(player,cmd,...)
	if(getElementData(player,"Gemuted") == 0)then
		if(isStateFaction(player) and isStaatDuty(player))then
			local veh = getPedOccupiedVehicle(player)
			if(veh and getElementData(veh,"Fraktion") == 1 or getElementData(veh,"Fraktion") == 2 or getElementData(veh,"Fraktion") == 3)then
				local text = convertText(...)
				if(text == nil)then
					infobox(player,"Du hast keinen Text angegeben!","error")
				elseif(text == "" or text == " " or text == "  ")then
					infobox(player,"Du hast keinen Text angegeben!","error")
				else
					local x,y,z = getElementPosition(veh)
					for _,v in pairs(getElementsByType("player"))do
						if(getDistanceBetweenPoints3D(x,y,z,getElementPosition(v)) <= 35)then
							outputChatBox("Staatsbeamter "..getPlayerName(player)..": "..text,v,255,255,0)
						end
					end
				end
			end
		end
	end
end)

-- [[ OFFLINEMESSAGE ]] --

function offlinemessage(name,text)
	if(name and text)then
		dbExec(handler,"INSERT INTO offlinemessages (Name,Text) VALUES ('"..name.."','"..text.."')")
	end
end

function checkOfflinemessages(player)
	local result = dbPoll(dbQuery(handler,"SELECT * FROM offlinemessages WHERE Name = '"..getPlayerName(player).."'"),-1)
	if(#result >= 1)then
		for _,v in pairs(result)do
			outputChatBox("[Offline-MSG]: "..v["Text"],player)
			dbExec(handler,"DELETE FROM offlinemessages WHERE ID = '"..v["ID"].."'")
		end
	end
end

-- [[ WERBUNG ]] --

local state = false

addCommandHandler("ad",function(player,cmd,...)
	if(getElementData(player,"Gemuted") == 0)then
		local text = table.concat({...}," ")
		if(string.len(text) >= 5)then
			local costs = string.len(text) * 2
			if(hasMoney(player,costs))then
				if(state == false)then
					local Handy = getElementData(player,"Handy")
					if(Handy == 1)then nr = getElementData(player,"Handynummer") else nr = "Kein Handy" end
					outputChatBox("Werbung von "..getPlayerName(player).." (Nr. "..nr.."): "..text,root,0,150,0)
					takeMoney(player,costs)
					state = true
					setTimer(function() state = false end,30000,1)
				else infobox(player,"Es kann nur alle 30 Sekunden eine Werbung geschalten werden!","error")end
			end
		else infobox(player,"Deine Nachricht muss mindestens fünf Zeichen lang sein!","error")end
	end
end)