-- [[ DAS FENSTER ÖFFNEN ]] --

addEvent("Marktplatz.openWindow",true)
addEventHandler("Marktplatz.openWindow",root,function()
	if(getDistanceBetweenPoints3D(2717.3803710938,-1422.5891113281,16.25,getElementPosition(client)) <= 5)then typ = "Schwarzmarkt" else typ = "Marktplatz" end
	triggerClientEvent(client,"Marktplatz.openWindow",client,typ)
end)

-- [[ ALLE ANGEBOTE LADEN ]] --

addEvent("Marktplatz.getAngebote",true)
addEventHandler("Marktplatz.getAngebote",root,function()
	if(getDistanceBetweenPoints3D(2717.3803710938,-1422.5891113281,16.25,getElementPosition(client)) <= 5)then typ = "Schwarzmarkt" else typ = "Marktplatz" end
	local tbl = {}
	local result = dbPoll(dbQuery(handler,"SELECT * FROM marktplatz WHERE Type = '"..typ.."'"),-1)
	
	for _,v in pairs(result)do
		table.insert(tbl,{v["ID"],v["Item"],v["Menge"],v["Preis"],v["Username"]})
	end
	triggerClientEvent(client,"Marktplatz.loadAngebote",client,tbl)
end)

-- [[ KAUFEN ]] --

addEvent("Marktplatz.buy",true)
addEventHandler("Marktplatz.buy",root,function(id)
	local preis = tonumber(getPlayerData("marktplatz","ID",id,"Preis"))
	if(preis)then
		if(hasMoney(client,preis))then
			local item = getPlayerData("marktplatz","ID",id,"Item")
			local menge = getPlayerData("marktplatz","ID",id,"Menge")
			local verkaeufer = getPlayerData("marktplatz","ID",id,"Username")
			local verkaeuferName = getPlayerFromName(verkaeufer)
			setElementData(client,item,getElementData(client,item)+menge)
			takeMoney(client,preis)
			infobox(client,loc(client,"Shops_147"),"info")
			if(isElement(verkaeuferName))then
				outputChatBox(loc(verkaeuferName,"Shops_148"):format(getPlayerName(client),preis),verkaeuferName,255,255,255,true)
				setElementData(verkaeuferName,"Bankgeld",getElementData(verkaeuferName,"Bankgeld")+preis)
			else
				local oldMoney = getPlayerData("accounts","Username",verkaeufer,"Bankgeld")
				dbExec(handler,"UPDATE accounts SET Bankgeld = '"..oldMoney + preis.."' WHERE Username = '"..getPlayerName(client).."'")
				offlinemessage(loc(_,"Shops_149",verkaeufer):format(getPlayerName(client),preis))
			end
			dbExec(handler,"DELETE FROM marktplatz WHERE ID = '"..id.."'")
		end
	else infobox(client,loc(client,"Shops_150"),"error")end
end)

-- [[ ANGEBOT ERSTELLEN ]] --

addEvent("Marktplatz.createAngebot",true)
addEventHandler("Marktplatz.createAngebot",root,function(item,menge,preis)
	local menge = tonumber(menge)
	if(tonumber(getElementData(client,item)) >= menge)then
		if(getDistanceBetweenPoints3D(2717.3803710938,-1422.5891113281,16.25,getElementPosition(client)) <= 5)then typ = "Schwarzmarkt" else typ = "Marktplatz" end
		setElementData(client,item,getElementData(client,item)-menge)
		infobox(client,loc(client,"Shops_151"),"info")
		dbExec(handler,"INSERT INTO marktplatz (Username,Item,Menge,Preis,Type) VALUES ('"..getPlayerName(client).."','"..item.."','"..menge.."','"..preis.."','"..typ.."')")
	else infobox(client,loc(client,"Shops_152"),"error")end
end)

-- [[ ANGEBOT LÖSCHEN ]] --

addEvent("Marktplatz.delete",true)
addEventHandler("Marktplatz.delete",root,function(id)
	local verkaeufer = getPlayerData("marktplatz","ID",id,"Username")
	if(verkaeufer)then
		if(getPlayerName(client) == verkaeufer)then
			local Item,Menge = getPlayerData("marktplatz","ID",id,"Item"),getPlayerData("marktplatz","ID",id,"Menge")
			setElementData(client,Item,getElementData(client,Item)+tonumber(Menge))
			dbExec(handler,"DELETE FROM marktplatz WHERE ID = '"..id.."'")
			infobox(client,loc(client,"Shops_153"),"info")
		else infobox(client,loc(client,"Shops_154"),"error")end
	else infobox(client,loc(client,"Shops_155"),"error")end
end)