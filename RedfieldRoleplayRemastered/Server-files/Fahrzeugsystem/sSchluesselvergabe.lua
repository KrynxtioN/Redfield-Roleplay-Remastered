-- [[ SCHLÜSSEL-DATAS LADEN ]] --

function Schluesselvergabe.getKeys(id)
	local tbl = {}
	local schluessel = getPlayerData("vehicles","ID",id,"Schluessel")
	local keys = getPlayerData("vehicles","ID",id,"VergebeneKeys")
	
	for i = 1,keys do
		local wstring = gettok(schluessel,i,string.byte("|"))
		table.insert(tbl,{wstring})
	end
	return tbl
end

function Schluesselvergabe.getDatas(player,id)
	local schluessel = Schluesselvergabe.getKeys(id)
	triggerClientEvent(client,"Schluesselvergabe.setKeys",client,schluessel)
end
addEvent("Schluesselvergabe.getDatas",true)
addEventHandler("Schluesselvergabe.getDatas",root,Schluesselvergabe.getDatas)

-- [[ HAT SPIELER SCHLÜSSEL? ]] --

function hasPlayerKeys(name,id)
	if(id ~= 0)then
		local schluessel = Schluesselvergabe.getKeys(id)
		local state = false
		
		for _,v in pairs(schluessel)do
			if(v[1] == name)then
				state = true
				break
			end
		end
		return state
	end
end

-- [[ SCHLÜSSEL VERGEBEN / ABNEHMEN ]] --

addEvent("Schluesselvergabe.giveTake",true)
addEventHandler("Schluesselvergabe.giveTake",root,function(name,type)
	local ID = getElementData(client,"SchluesselvergabeID")
	local playerName = getPlayerFromName(name)
	if(type == "Schlüssel vergeben")then
		local result = dbPoll(dbQuery(handler,"SELECT * FROM accounts WHERE Username = '"..name.."'"),-1)
		if(#result >= 1)then
			if(hasPlayerKeys(name,ID) == false)then
				local schluessel = getPlayerData("vehicles","ID",ID,"Schluessel").."|"..name
				local keys = getPlayerData("vehicles","ID",ID,"VergebeneKeys") + 1
				dbExec(handler,"UPDATE vehicles SET Schluessel = '"..schluessel.."', VergebeneKeys = '"..keys.."' WHERE ID = '"..ID.."'")
				if(isElement(playerName))then
					infobox(client,loc(client,"Fahrzeugsystem_117"):format(getPlayerName(playerName)),"info")
					infobox(playerName,loc(client,"Fahrzeugsystem_118"):format(getPlayerName(client)),"info")
				else
					infobox(client,loc(client,"Fahrzeugsystem_119"):format(name),"info")
					offlinemessage(loc(_,"Fahrzeugsystem_120",name):format(name),name)
				end
				Schluesselvergabe.getDatas(client,ID)
			else infobox(client,loc(client,"Fahrzeugsystem_121"),"error")end
		else infobox(client,loc(client,"Fahrzeugsystem_122"),"error")end
	elseif(type == "Schlüssel abnehmen")then
		if(hasPlayerKeys(name,ID) == true)then
			local schluesselText = ""
			local schluessel = getPlayerData("vehicles","ID",ID,"Schluessel")
			local keys = getPlayerData("vehicles","ID",ID,"VergebeneKeys")
			for i = 1,keys do
				local wstring = gettok(schluessel,i,string.byte("|"))
				if(wstring ~= name)then
					schluesselText = schluesselText..wstring.."|"
				end
			end
			dbExec(handler,"UPDATE vehicles SET Schluessel = '"..schluesselText.."', VergebeneKeys = '"..keys - 1 .."' WHERE ID = '"..ID.."'")
			if(isElement(playerName))then
				infobox(client,loc(client,"Fahrzeugsystem_123"):format(getPlayerName(playerName)),"info")
				infobox(playerName,loc(client,"Fahrzeugsystem_124"):format(getPlayerName(client)),"info")
			else
				infobox(client,loc(client,"Fahrzeugsystem_125"):format(name),"info")
				offlinemessage(loc(_,"Fahrzeugsystem_126",name):format(name),name)
			end
			Schluesselvergabe.getDatas(client,ID)
		else infobox(client,loc(client,"Fahrzeugsystem_127"),"error")end
	end
end)