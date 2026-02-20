-- [[ HANDELN ]] --

addEvent("Interaktion.handeln",true)
addEventHandler("Interaktion.handeln",root,function(item,menge)
	local menge = tonumber(menge)
	if(getElementData(client,item) >= menge)then
		local interaktion = getPlayerFromName(getElementData(client,"InteraktionPlayer"))
		if(existPlayer(client,interaktion))then
			setElementData(client,item,getElementData(client,item)-menge)
			setElementData(interaktion,item,getElementData(interaktion,item)+menge)
			infobox(client,loc(client,"Systeme_294"):format(getPlayerName(interaktion),item,menge),"info")
			infobox(interaktion,loc(interaktion,"Systeme_295"):format(getPlayerName(client),item,menge),"info")
		end
	else infobox(client,loc(client,"Systeme_296"),"error")end
end)


-- [[ SPIELER BEWERTEN ]] --

addEvent("Interaktion.bewerten",true)
addEventHandler("Interaktion.bewerten",root,function(text)
	local interaktion = getPlayerFromName(getElementData(client,"InteraktionPlayer"))
	if(existPlayer(client,interaktion))then
		if(hasPlayerBewertet(client,interaktion))then
			setElementData(interaktion,"Bewertung"..text,getElementData(interaktion,"Bewertung"..text)+1)
			infobox(client,loc(client,"Systeme_297"):format(getPlayerName(interaktion)),"info")
			local BewertungenGesamt = getPlayerData("bewertungen","Username",getPlayerName(interaktion),"BewertungenGesamt")
			local Bewerter = getPlayerData("bewertungen","Username",getPlayerName(interaktion),"Bewerter")..getPlayerName(interaktion).."|"
			dbExec(handler,"UPDATE bewertungen SET BewertungenGesamt = '"..BewertungenGesamt + 1 .."', Bewerter = '"..Bewerter.."' WHERE Username = '"..getPlayerName(interaktion).."'")
		else infobox(client,loc(client,"Systeme_298"),"error")end
	end
end)

function hasPlayerBewertet(player,target)
	local tbl = {}
	local result = dbPoll(dbQuery(handler,"SELECT Bewerter FROM bewertungen WHERE Username = '"..getPlayerName(target).."'"),-1)
	if(result and result[1])then
		local bewerter = result[1]["Bewerter"]
		for i = 1,getPlayerData("bewertungen","Username",getPlayerName(player),"BewertungenGesamt")do
			local mstring = gettok(bewerter,i,string.byte("|"))
			if(mstring and #mstring >= 1)then
				table.insert(tbl,mstring)
			end
		end
	end
	
	local state = true
	for _,v in pairs(tbl)do
		if(v == getPlayerName(player))then
			state = false
			break
		end
	end
	return state
end


-- [[ LIZENZEN ]] --

addEvent("Interaktion.lizenzen",true)
addEventHandler("Interaktion.lizenzen",root,function()
	local interaktion = getPlayerFromName(getElementData(client,"InteraktionPlayer"))
	if(existPlayer(client,interaktion))then
		outputChatBox("Lizenzen von "..getPlayerName(client)..":",interaktion,0,175,0)
		for _,v in pairs(Vehicles["Lizenzen"])do
			if(getElementData(client,v) == 1)then
				outputChatBox(v,interaktion,0,150,0)
			end
		end
		infobox(client,loc(client,"Systeme_299"):format(getPlayerName(interaktion)),"info")
		infobox(interaktion,loc(interaktion,"Systeme_300"):format(getPlayerName(client)),"info")
	end
end)