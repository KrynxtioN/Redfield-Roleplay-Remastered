-- [[ MÖBELDATAS LADEN ]] --

addEvent("Moebel.getPlayerMoebel",true)
addEventHandler("Moebel.getPlayerMoebel",root,function()
	local tbl = {}
	local result = dbPoll(dbQuery(handler,"SELECT * FROM moebelinventory WHERE Besitzer = '"..getPlayerName(client).."'"),-1)
	if(#result >= 1)then
		for _,v in pairs(result)do
			table.insert(tbl,{v["ID"],v["Name"],v["Model"]})
		end
		triggerClientEvent(client,"Moebel.setPlayerMoebel",client,tbl)
	end
end)