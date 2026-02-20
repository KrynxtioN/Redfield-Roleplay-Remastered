function News.load(player)
	if(getElementData(player,"loggedin") == 1)then
		local result = dbPoll(dbQuery(handler,"SELECT * FROM news"),-1)
		if(#result >= 1)then
			local tbl = {}
			for _,v in pairs(result)do
				if(not(string.find(v["Gelesen"],getPlayerName(player))))then
					table.insert(tbl,{v["ID"],v["Text"]})
				end
			end
			if(#tbl >= 1)then
				triggerClientEvent(player,"News.createDxDraw",player,tbl)
			end
		end
	end
end
addCommandHandler("news",News.load)

function News.check(player)
	local result = dbPoll(dbQuery(handler,"SELECT * FROM news"),-1)
	if(#result >= 1)then
		local state = false
		for _,v in pairs(result)do
			if(not(string.find(v["Gelesen"],getPlayerName(player))))then
				state = true
				break
			end
		end
		if(state == true)then
			outputChatBox(loc(player,"Adminsystem_92"),player,255,255,255,true)
		end
	end
end

addEvent("News.setReaded",true)
addEventHandler("News.setReaded",root,function(id)
	if(not(string.find(getPlayerData("news","ID",id,"Gelesen"),getPlayerName(client))))then
		dbExec(handler,"UPDATE news SET Gelesen = '"..getPlayerData("news","ID",id,"Gelesen").."|"..getPlayerName(client).."' WHERE ID = '"..id.."'")
	end
end)