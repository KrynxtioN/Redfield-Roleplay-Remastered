-- [[ SHOPDATEN AUSGEBEN ]] --

function Zoohandlung.getDatas(player)
	local tbl = {}
	for _,v in pairs(Zoohandlung["Shop"])do
		table.insert(tbl,{v,getPlayerData("zoohandlung","ID",getElementDimension(player),v),getPlayerData("zoohandlung","ID",getElementDimension(player),v.."Preis")})
	end
	triggerClientEvent(player,"Zoohandlung.setDatas",player,tbl)
end
addEvent("Zoohandlung.getDatas",true)
addEventHandler("Zoohandlung.getDatas",root,Zoohandlung.getDatas)

-- [[ TIER KAUFEN ]] --

addEvent("Zoohandlung.buy",true)
addEventHandler("Zoohandlung.buy",root,function(tier,name)
	local price = getPlayerData("zoohandlung","ID",getElementDimension(client),tier.."Preis")
	if(hasMoney(client,price))then
		local old = getPlayerData("zoohandlung","ID",getElementDimension(client),tier)
		if(getPlayerData("business","Databasename","Zoohandlung"..getElementDimension(client),"Besitzer") ~= "Niemand")then
			if(old < 1)then
				infobox(client,loc(client,"Shops_156"),"error")
				return false
			end
		end
		if(tier == "Futter" or tier == "Wasser" or tier == "Spielzeug" or tier == "Medizin")then
			takeMoney(client,price)
			infobox(client,loc(client,"Shops_157"),"info")
			setElementData(client,tier,getElementData(client,tier)+1)
			if(getPlayerData("business","Databasename","Zoohandlung"..getElementDimension(client),"Besitzer") ~= "Niemand")then
				dbExec(handler,"UPDATE zoohandlung SET "..tier.." = '"..old-1 .."' WHERE ID = '"..getElementDimension(client).."'")
				addBizKasse("Zoohandlung"..getElementDimension(client),price)
			end
			Zoohandlung.getDatas(client)
		else
			if(name and #name >= 1)then
				local result = dbPoll(dbQuery(handler,"SELECT * FROM haustiere WHERE Besitzer = '"..getPlayerName(client).."'"),-1)
				if(#result == 0)then
					takeMoney(client,price)
					infobox(client,loc(client,"Shops_158"),"info")
					if(tier == "Huhn")then model = 263 else model = 264 end
					dbExec(handler,"INSERT INTO haustiere (Besitzer,Name,Model) VALUES ('"..getPlayerName(client).."','"..name.."','"..model.."')")
					if(getPlayerData("business","Databasename","Zoohandlung"..getElementDimension(client),"Besitzer") ~= "Niemand")then
						dbExec(handler,"UPDATE zoohandlung SET "..tier.." = '"..old-1 .."' WHERE ID = '"..getElementDimension(client).."'")
						addBizKasse("Zoohandlung"..getElementDimension(client),price)
					end
					Zoohandlung.getDatas(client)
					setPlayerAchievement(client,23)
				else infobox(client,loc(client,"Shops_159"),"error")end
			else infobox(client,loc(client,"Shops_160"),"error")end
		end
	end
end)