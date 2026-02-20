-- [[ DAS FENSTER ÖFFNEN ]] --

addEvent("Status.openWindow",true)
addEventHandler("Status.openWindow",root,function()
	local tbl = {}
	for i,v in pairs(Status["Status"])do
		local reached = getPlayerData("status","Username",getPlayerName(client),"Status"..i)
		table.insert(tbl,{v[1],reached})
	end
	triggerClientEvent(client,"Status.openWindow",client,tbl)
end)

-- [[ STATUSDATAS KRIEGEN ]] --

addEvent("Status.getDatas",true)
addEventHandler("Status.getDatas",root,function(clicked)
	local reached = getPlayerData("status","Username",getPlayerName(client),"Status"..clicked)
	triggerClientEvent(client,"Status.setDatas",client,reached)
end)

-- [[ STATUS GEBEN ]] --

function setPlayerStatus(player,id)
	local id = tonumber(id)
	local reached = getPlayerData("status","Username",getPlayerName(player),"Status"..id)
	if(reached == 0)then
		dbExec(handler,"UPDATE status SET Status"..id.." = 1 WHERE Username = '"..getPlayerName(player).."'")
		triggerClientEvent(player,"Status.showInfo",player,id)
		outputLog(getPlayerName(player).." hat den Status "..Status["Status"][id][1].." freigeschaltet.","Errungenschaften")
	end
end
addEvent("setPlayerStatus",true)
addEventHandler("setPlayerStatus",root,setPlayerStatus)

-- [[ STATUS FREIGESCHALTET ]] --

addEvent("Status.doubleClick",true)
addEventHandler("Status.doubleClick",root,function(id)
	local id = tonumber(id)
	local reached = getPlayerData("status","Username",getPlayerName(client),"Status"..id)
	if(reached == 1)then
		setElementData(client,"SozialerStatus",Status["Status"][id][1])
		infobox(client,loc(client,"Errungenschaften_17"):format(Status["Status"][id][1]),"info")
	else infobox(client,loc(client,"Errungenschaften_18"),"error")end
end)