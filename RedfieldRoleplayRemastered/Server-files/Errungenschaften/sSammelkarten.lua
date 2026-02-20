-- [[ ALBUM ÖFFNEN ]] --

function Sammelkarten.openAlbum(player)
	local tbl = {}
	local cards = getPlayerData("accounts","Username",getPlayerName(player),"Sammelkarten")
	for i = 1,25 do
		local wstring = gettok(cards,i,string.byte("|"))
		table.insert(tbl,{i,wstring})
	end
	triggerClientEvent(player,"Sammelkarten.openAlbum",player,tbl)
end

-- [[ SPIELER EINE SAMMELKARTE GEBEN ]] --

function Sammelkarten.addKarte(player,id)
	local id = tonumber(id)
	local cards = getPlayerData("accounts","Username",getPlayerName(player),"Sammelkarten")
	local wstring = gettok(cards,id,string.byte("|"))
	if(tonumber(wstring) == 0)then
		local text = ""
		infobox(player,loc(player,"Errungenschaften_11"):format(id),"info")
		for i = 1,25 do
			local wstring = gettok(cards,i,string.byte("|"))
			if(i == id)then
				text = text.."1|"
			else
				text = text..wstring.."|"
			end
		end
		dbExec(handler,"UPDATE accounts SET Sammelkarten = '"..text.."' WHERE Username = '"..getPlayerName(player).."'")
		outputLog(getPlayerName(player).." hat Sammelkarte Nr. "..id.." bekommen.","Errungenschaften")
		setPlayerAchievement(player,7)
	else infobox(player,loc(player,"Errungenschaften_12"):format(id),"error")end
end

-- [[ ALBUM LEEREN ]] --

addEvent("Sammelkarten.albumLeeren",true)
addEventHandler("Sammelkarten.albumLeeren",root,function()
	local cards = getPlayerData("accounts","Username",getPlayerName(client),"Sammelkarten")
	local counter = 0
	for i = 1,25 do
		local wstring = gettok(cards,i,string.byte("|"))
		if(tonumber(wstring) == 1)then
			counter = counter + 1
		end
	end
	if(counter >= 25)then
		dbExec(handler,"UPDATE accounts SET Sammelkarten = '' WHERE Username = '"..getPlayerName(client).."'")
		setElementData(client,"Jobgehaltsbonus",getElementData(client,"Jobgehaltsbonus")+1)
		infobox(client,loc(client,"Errungenschaften_13"),"info")
		triggerClientEvent(client,"Sammelkarten.close",client,"destroy")
		outputLog(getPlayerName(client).." hat sein Sammelkartenalbum geleert.","Errungenschaften")
		setPlayerStatus(client,5)
	else infobox(client,loc(client,"Errungenschaften_14"),"error")end
end)