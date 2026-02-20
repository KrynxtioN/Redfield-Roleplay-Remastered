-- [[ NACHRICHT VERSENDEN ]] --

function Postfach.sendMessage(empfaenger,betreff,text,ticket)
	local result = dbPoll(dbQuery(handler,"SELECT * FROM accounts WHERE Username = '"..empfaenger.."'"),-1)
	if(tonumber(ticket) == 2)then
		if(#result == 0)then
			infobox(client,loc(client,"Systeme_338"),"error")
			return false
		end
	end
	dbExec(handler,"INSERT INTO postfach (Absender,Empfaenger,Betreff,Text,Ticket) VALUES ('"..getPlayerName(client).."','"..empfaenger.."','"..betreff.."','"..text.."','"..ticket.."')")
	infobox(client,loc(client,"Systeme_339"),"info")
	triggerClientEvent(client,"setWindowDatas",client)
	if(empfaenger == Events.geburtstagskind and Events.geburtstagskind ~= getPlayerName(client))then
		local praemie = getPlayerData("birthday","Geburtstagskind",Events.geburtstagskind,"Praemie")
		if(not(string.find(praemie,getPlayerName(client))))then
			local praemie = praemie..getPlayerName(client).."|"
			dbExec(handler,"UPDATE birthday SET Praemie = '"..praemie.."' WHERE Geburtstagskind = '"..Events.geburtstagskind.."'")
			outputChatBox(loc(client,"Systeme_340"):format(Events.geburtstagskind),client,255,255,255,true)
			setElementData(client,"Geld",getElementData(client,"Geld")+15000)
		end
	end
	if(tonumber(ticket) == 1)then
		for _,v in pairs(getElementsByType("player"))do
			if(getElementData(v,"Adminlevel") >= 1)then
				outputChatBox(loc(v,"Systeme_341"),v,255,255,255,true)
			end
		end
	end
end
addEvent("Postfach.sendMessage",true)
addEventHandler("Postfach.sendMessage",root,Postfach.sendMessage)

-- [[ NACHRICHTEN CHECKEN ]] --

function Postfach.checkMessages(player)
	local result = dbPoll(dbQuery(handler,"SELECT * FROM postfach"),-1)
	if(#result >= 1)then
		for _,v in pairs(result)do
			local counter_player = 0
			local counter_admin = 0
			if(v["Empfaenger"] == getPlayerName(player) and v["Gelesen"] == 0)then
				counter_player = counter_player + 1
			end
			if(v["Ticket"] == 1 and v["Gelesen"] == 0)then
				counter_admin = counter_admin + 1
			end
			if(counter_player > 0)then
				outputChatBox(loc(player,"Systeme_342"):format(counter_player),player,255,255,255,true)
			end
			if(counter_admin > 0 and getElementData(player,"Adminlevel") >= 1)then
				outputChatBox(loc(player,"Systeme_343"):format(counter_admin),player,255,255,255,true)
			end
		end
	end
end

-- [[ ALLE NACHRICHTEN LADEN ]] --

function Postfach.getDatas(player,id,type)
	if(type)then
		local tbl = {}
		local result = dbPoll(dbQuery(handler,"SELECT * FROM postfach"),-1)
		if(#result >= 1)then
			for _,v in pairs(result)do
				if(type == "Normal")then
					if(v["Empfaenger"] == getPlayerName(player))then
						table.insert(tbl,{v["ID"],v["Absender"],v["Betreff"],v["Gelesen"]})
					end
				elseif(type == "Ticket")then
					if(v["Ticket"] == 1)then
						table.insert(tbl,{v["ID"],v["Absender"],v["Betreff"],v["Gelesen"]})
					end
				end
			end
		end
		triggerClientEvent(player,"Postfach.refresh",player,tbl)
	else
		local text = getPlayerData("postfach","ID",id,"Text")
		triggerClientEvent(player,"Postfach.refresh",player,_,text)
		dbExec(handler,"UPDATE postfach SET Gelesen = '1' WHERE ID = '"..id.."'")
	end
end
addEvent("Postfach.getDatas",true)
addEventHandler("Postfach.getDatas",root,Postfach.getDatas)

-- [[ NACHRICHT LÖSCHEN ]] --

addEvent("Postfach.deleteMessage",true)
addEventHandler("Postfach.deleteMessage",root,function(id,type)
	dbExec(handler,"DELETE FROM postfach WHERE ID = '"..id.."'")
	infobox(client,loc(client,"Systeme_344"),"info")
	Postfach.getDatas(client,_,type)
end)