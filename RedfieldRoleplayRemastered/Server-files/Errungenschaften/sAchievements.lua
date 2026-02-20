-- [[ DAS FENSTER ÖFFNEN ]] --

function Achievements.openWindow(player)
	local tbl = {}
	for i,v in pairs(Achievements["Achievements"])do
		local reached = getPlayerData("achievements","Username",getPlayerName(player),"Achievement"..i)
		table.insert(tbl,{v[1],reached})
	end
	triggerClientEvent(player,"Achievements.openWindow",player,tbl)
end

-- [[ ACHIEVEMENTDATAS KRIEGEN ]] --

addEvent("Achievements.getDatas",true)
addEventHandler("Achievements.getDatas",root,function(clicked)
	local reached = getPlayerData("achievements","Username",getPlayerName(client),"Achievement"..clicked)
	triggerClientEvent(client,"Achievements.setDatas",client,reached)
end)

-- [[ ACHIEVEMENT ERREICHT ]] --

function setPlayerAchievement(player,id)
	local reached = getPlayerData("achievements","Username",getPlayerName(player),"Achievement"..id)
	if(reached == 0)then
		dbExec(handler,"UPDATE achievements SET Achievement"..id.." = 1 WHERE Username = '"..getPlayerName(player).."'")
		triggerClientEvent(player,"Achievements.showInfo",player,id)
		setElementData(player,"Pokale",getElementData(player,"Pokale")+1)
		outputLog(getPlayerName(player).." hat das Achievement "..Achievements["Achievements"][id][1].." erreicht.","Errungenschaften")
	end
end
addEvent("setPlayerAchievement",true)
addEventHandler("setPlayerAchievement",root,setPlayerAchievement)