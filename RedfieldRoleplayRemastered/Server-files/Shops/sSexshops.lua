-- [[ TABELLEN ]] --

local WeaponIDs = {
	["Vibrator"] = 12,
	["Dildo"]   = 11,
}

-- [[ SHOPDATEN AUSGEBEN ]] --

function Sexshop.getDatas(player)
	local tbl = {}
	for _,v in pairs(Sexshop["Shop"])do
		table.insert(tbl,{v,getPlayerData("sexshops","ID",getElementDimension(player),v),getPlayerData("sexshops","ID",getElementDimension(player),v.."Preis")})
	end
	triggerClientEvent(player,"Sexshop.setDatas",player,tbl)
end
addEvent("Sexshop.getDatas",true)
addEventHandler("Sexshop.getDatas",root,Sexshop.getDatas)

-- [[ ARTIKEL KAUFEN ]] --

addEvent("Sexshop.buyShop",true)
addEventHandler("Sexshop.buyShop",root,function(artikel)
	local price = getPlayerData("sexshops","ID",getElementDimension(client),artikel.."Preis")
	if(hasMoney(client,price))then
		local old = getPlayerData("sexshops","ID",getElementDimension(client),artikel)
		if(getPlayerData("business","Databasename","Sexshop"..getElementDimension(client),"Besitzer") ~= "Niemand")then
			if(old < 1)then
				infobox(client,loc(client,"Shops_116"),"error")
				return false
			end
		end
		takeMoney(client,price)
		infobox(client,loc(client,"Shops_117"),"info")
		giveWeapon(client,WeaponIDs[artikel],1,true)
		if(getPlayerData("business","Databasename","Sexshop"..getElementDimension(client),"Besitzer") ~= "Niemand")then
			dbExec(handler,"UPDATE sexshops SET "..artikel.." = '"..old-1 .."' WHERE ID = '"..getElementDimension(client).."'")
			addBizKasse("Sexshop"..getElementDimension(client),price)
		end
		Sexshop.getDatas(client)
	end
end)