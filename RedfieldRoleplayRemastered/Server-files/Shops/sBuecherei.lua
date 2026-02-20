-- [[ BÜCHER-DATAS LADEN ]] --

function Buecherei.getBooks(typ)
	local result = dbPoll(dbQuery(handler,"SELECT * FROM books"),-1)
	local tbl = {}
	for _,v in pairs(result)do
		if(not(typ))then typ = 1 end
		if(v["Freigeschaltet"] == typ)then
			table.insert(tbl,{v["ID"],v["Titel"],v["Autor"]})
		end
	end
	return tbl
end

addEvent("Buecherei.getBooks",true)
addEventHandler("Buecherei.getBooks",root,function()
	triggerClientEvent(client,"Buecherei.openWindow",client,Buecherei.getBooks(1))
end)

-- [[ BUCH EINREICHEN ]] --

addEvent("Buecherei.einreichen",true)
addEventHandler("Buecherei.einreichen",root,function(titel,text)
	local result = dbPoll(dbQuery(handler,"SELECT * FROM books WHERE Titel = '"..titel.."'"),-1)
	if(#result == 0)then
		if(hasMoney(client,250000))then
			takeMoney(client,250000)
			infobox(client,loc(client,"Shops_130"),"info")
			dbExec(handler,"INSERT INTO books (Autor,Titel,Text) VALUES (?,?,?)",getPlayerName(client),titel,text)
			triggerClientEvent(client,"setWindowDatas",client)
		end
	else infobox(client,loc(client,"Shops_131"),"error")end
end)

-- [[ BUCH FREISCHALTEN / LÖSCHEN ]] --

addEvent("Buecherei.freischaltenOrDelete",true)
addEventHandler("Buecherei.freischaltenOrDelete",root,function(id,type)
	if(type == "Genehmigen")then
		dbExec(handler,"UPDATE books SET Freigeschaltet = '1' WHERE ID = '"..id.."'")
		infobox(client,loc(client,"Shops_132"),"info")
	else
		local titel = getPlayerData("books","ID",id,"Titel")
		local author = getPlayerData("books","ID",id,"Autor")
		local authorName = getPlayerFromName(author)
		if(isElement(authorName))then
			outputChatBox(loc(authorName,"Shops_133"):format(titel),authorName,255,255,255,true)
			setElementData(authorName,"Bankgeld",getElementData(authorName,"Bankgeld")+250000)
		else
			local bankmoney = getPlayerData("accounts","Username",author,"Bankgeld")
			offlinemessage(autor,loc(_,"Shops_134",autor))
			dbExec(handler,"accounts SET Bankgeld = '"..bankmoney + 250000 .."' WHERE Username = '"..author.."'")
		end
		dbExec(handler,"DELETE FROM books WHERE ID = '"..id.."'")
		infobox(client,loc(client,"Shops_135"),"error")
	end
end)

-- [[ BUCH AUSLEIHEN ]] --

addEvent("Buecherei.ausleihen",true)
addEventHandler("Buecherei.ausleihen",root,function(id)
	if(hasMoney(client,2500))then
		local result = dbPoll(dbQuery(handler,"SELECT * FROM booksausgeliehen WHERE Username = '"..getPlayerName(client).."' AND BookID = '"..id.."'"),-1)
		if(#result == 0 and getPlayerData("books","ID",id,"Autor") ~= getPlayerName(client))then
			local author = getPlayerData("books","ID",id,"Autor")
			local authorName = getPlayerFromName(author)
			local titel = getPlayerData("books","ID",id,"Titel")
			if(isElement(authorName))then
				outputChatBox(loc(authorName,"Shops_136"):format(titel),authorName,255,255,255,true)
				setElementData(authorName,"Bankgeld",getElementData(authorName,"Bankgeld")+1250)
			else
				local bankmoney = getPlayerData("accounts","Username",author,"Bankgeld")
				offlinemessage(author,loc(_,"Shops_137",autor):format(titel))
				dbExec(handler,"accounts SET Bankgeld = '"..bankmoney + 1250 .."' WHERE Username = '"..author.."'")
			end
			takeMoney(client,2500)
			infobox(client,loc(client,"Shops_138"),"info")
			dbExec(handler,"INSERT INTO booksausgeliehen (Username,BookID,STime) VALUES ('"..getPlayerName(client).."','"..id.."','"..getSecTime(48).."')")
		else infobox(client,loc(client,"Shops_139"),"error")end
	end
end)

-- [[ BUCHVERWALTUNG ÖFFNEN ]] --

addEvent("Buecherei.getVerwaltungsBooks",true)
addEventHandler("Buecherei.getVerwaltungsBooks",root,function()
	local tbl = {}
	local result = dbPoll(dbQuery(handler,"SELECT * FROM booksausgeliehen WHERE Username = '"..getPlayerName(client).."'"),-1)
	if(#result >= 1)then
		for _,v in pairs(result)do
			local titel = getPlayerData("books","ID",v["BookID"],"Titel")
			local autor = getPlayerData("books","ID",v["BookID"],"Autor")
			table.insert(tbl,{v["BookID"],titel,autor,v["Leihzeit"]})
		end
	end
	triggerClientEvent(client,"Buecherei.setVerwaltungsBooks",client,tbl)
end)

-- [[ BUCHTEXT LADEN ]] --

addEvent("Buecherei.getBookText",true)
addEventHandler("Buecherei.getBookText",root,function(id)
	local name = getPlayerData("books","ID",id,"Titel")
	local text = getPlayerData("books","ID",id,"Text")
	triggerClientEvent(client,"Buecherei.inhalt",client,name,text)
end)

addEvent("Buecherei.getEingereichteBooks",true)
addEventHandler("Buecherei.getEingereichteBooks",root,function()
	triggerClientEvent(client,"Buecherei.setEingereichteBooks",client,Buecherei.getBooks(0))
end)

addEvent("Buecherei.getEingereichtesBookData",true)
addEventHandler("Buecherei.getEingereichtesBookData",root,function(id)
	local titel = getPlayerData("books","ID",id,"Titel")
	local autor = getPlayerData("books","ID",id,"Autor")
	local text = getPlayerData("books","ID",id,"Text")
	triggerClientEvent(client,"Buecherei.setEingereichtesBookData",client,titel,autor,text)
end)