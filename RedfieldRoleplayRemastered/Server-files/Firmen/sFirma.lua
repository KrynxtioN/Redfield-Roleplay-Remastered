-- [[ FIRMEN LADEN ]] --

local FirmenID = 0
local result = dbPoll(dbQuery(handler,"SELECT * FROM firma"),-1)

for _,v in pairs(result)do
	FirmenID = FirmenID + 1
end

-- [[ FIRMA / GANG GRÜNDEN ]] --

addEvent("Firma.create",true)
addEventHandler("Firma.create",root,function(name,type)
	if(getElementData(client,"Firma") == 0)then
		local result = dbPoll(dbQuery(handler,"SELECT * FROM firma WHERE Name = '"..name.."'"),-1)
		if(#result == 0)then
			if(hasMoney(client,250000))then
				if(type == "Firma gründen")then id = 1 else id = 2 end
				FirmenID = FirmenID + 1
				takeMoney(client,250000)
				dbExec(handler,"INSERT INTO firma (Name,Type) VALUES ('"..name.."','"..id.."')")
				setElementData(client,"Firma",FirmenID)
				setElementData(client,"Firmarang",5)
				dbExec(handler,"UPDATE accounts SET Firma = '"..FirmenID.."', Firmarang = '5' WHERE Username = '"..getPlayerName(client).."'")
				infobox(client,loc(client,"Firma_12"),"info")
				triggerClientEvent(client,"setWindowDatas",client)
				setElementData(client,"FirmenName",getPlayerData("firma","ID",getElementData(client,"Firma"),"Name"))
				outputLog(getPlayerName(client).." hat eine Firma mit dem Namen "..name.." gegründet. Typ: "..type,"Firmen")
				setPlayerAchievement(client,12)
			end
		else infobox(client,loc(client,"Firma_13"),"error")end
	else infobox(client,loc(client,"Firma_14"),"error")end
end)

--//Firma umbenennen
addEvent("Firma.rename",true)
addEventHandler("Firma.rename",root,function(name)
	if(getElementData(client,"Firma") >= 1 and getElementData(client,"Firmarang") >= 5)then
		if(hasMoney(client,50000))then
			takeMoney(client,50000)
			dbExec(handler,"UPDATE firma SET Name = '"..name.."' WHERE ID = '"..getElementData(client,"Firma").."'")
			infobox(client,loc(client,"Firma_15"),"info")
			triggerClientEvent(client,"setWindowDatas",client)
			for _,v in pairs(getElementsByType("player"))do
				if(getElementData(v,"Firma") == getElementData(client,"Firma"))then
					setElementData(v,"FirmenName",name)
				end
			end
		end
	else infobox(client,loc(client,"Firma_16"),"error")end
end)

--//Firma löschen
addEvent("Firma.delete",true)
addEventHandler("Firma.delete",root,function()
	if(getElementData(client,"Firma") >= 1 and getElementData(client,"Firmarang") >= 5)then
		local Firma = getElementData(client,"Firma")
		local result = dbPoll(dbQuery(handler,"SELECT * FROM accounts WHERE Firma = '"..Firma.."'"),-1)
		for _,v in pairs(result)do
			local target = getPlayerFromName(v["Username"])
			if(isElement(target) and getElementData(target,"loggedin") == 1)then
				setElementData(target,"FirmenName","- Keine -")
				setElementData(target,"Firma",0)
				setElementData(target,"Firmarang",0)
				outputChatBox(loc(target,"Firma_17"),target,255,255,255,true)
			else
				dbExec(handler,"UPDATE accounts SET Firma = '0', FirmenName = '0' WHERE Username = '"..v["Username"].."'")
				offlinemessage(v["Username"],loc(_"Firma_18",v["Username"]))
			end
		end
		local result = dbPoll(dbQuery(handler,"SELECT * FROM vehicles WHERE Firma = '"..Firma.."'"),-1)
		for _,v in pairs(result)do
			dbExec(handler,"UPDATE Firma = '0', Preis = '0' WHERE ID = '"..v["ID"].."'")
			setElementData(Vehicles[v["ID"]],"Firma",0)
			setElementData(Vehicles[v["ID"]],"Preis",0)
		end
		dbExec(handler,"DELETE FROM firma WHERE ID = '"..getElementData(client,"ID").."'")
		
		for _,v in pairs(getElementsByType("player"))do
			getSellFirmenFahrzeuge(v)
		end
	else infobox(client,loc(client,"Firma_19"),"error")end
end)