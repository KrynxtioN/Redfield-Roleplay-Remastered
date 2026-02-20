-- [[ SHOPDATEN AUSGEBEN ]] --

function Ammunation.getDatas(player)
	local tbl = {}
	for _,v in pairs(Ammunation["Artikel"])do
		table.insert(tbl,{v,getPlayerData("ammunation","ID",getElementDimension(player),v.."Preis"),Ammunation["ID"][v][2],getPlayerData("ammunation","ID",getElementDimension(player),v)})
	end
	triggerClientEvent(player,"Ammunation.setDatas",player,tbl)
end
addEvent("Ammunation.getDatas",true)
addEventHandler("Ammunation.getDatas",root,Ammunation.getDatas)

-- [[ ARTIKEL KAUFEN ]] --

addEvent("Ammunation.buy",true)
addEventHandler("Ammunation.buy",root,function(artikel)
	local preis = getPlayerData("ammunation","ID",getElementDimension(client),artikel.."Preis")
	if(hasMoney(client,preis))then
		local old = getPlayerData("ammunation","ID",getElementDimension(client),artikel)
		if(getPlayerData("business","Databasename","Ammunation"..getElementDimension(client),"Besitzer") ~= "Niemand")then
			if(old < 1)then
				infobox(client,loc(client,"Shops_111"),"error")
				return false
			end
		end
		takeMoney(client,preis)
		
		infobox(client,loc(client,"Shops_112"),"info")
		if(artikel == "Weste")then
			setPedArmor(client,100)
		else
			giveWeapon(client,Ammunation["ID"][artikel][1],Ammunation["ID"][artikel][2],true)
		end
		if(getPlayerData("business","Databasename","Ammunation"..getElementDimension(client),"Besitzer") ~= "Niemand")then
			dbExec(handler,"UPDATE ammunation SET "..artikel.." = '"..old - 1 .."' WHERE ID = '"..getElementDimension(client).."'")
			addBizKasse("Ammunation"..getElementDimension(client),preis)
		end
		Ammunation.getDatas(client)
	end
end)