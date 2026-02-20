for i = 1,14 do
	local object = createObject(1776,-24.758800506592,-91.747602844238,1003.616875,0,0,180)
	setElementInterior(object,18)
	setElementDimension(object,i)
end

-- [[ SHOPDATEN AUSGEBEN ]] --

function Supermarkt.getDatas(player)
	local tbl = {}
	for _,v in pairs(Supermarkt["Shop"])do
		table.insert(tbl,{v,getPlayerData("supermarkt","ID",getElementDimension(player),v),getPlayerData("supermarkt","ID",getElementDimension(player),v.."Preis")})
	end
	triggerClientEvent(player,"Supermarkt.setDatas",player,tbl)
end
addEvent("Supermarkt.getDatas",true)
addEventHandler("Supermarkt.getDatas",root,Supermarkt.getDatas)

-- [[ ARTIKEL KAUFEN ]] --

addEvent("Supermarkt.buy",true)
addEventHandler("Supermarkt.buy",root,function(artikel)
	local price = getPlayerData("supermarkt","ID",getElementDimension(client),artikel.."Preis")
	if(hasMoney(client,price))then
		local old = getPlayerData("supermarkt","ID",getElementDimension(client),artikel)
		if(getPlayerData("business","Databasename","Supermarkt"..getElementDimension(client),"Besitzer") ~= "Niemand")then
			if(old < 1)then
				infobox(client,loc(client,"Shops_143"):format(artikel),"error")
				return false
			end
		end
		takeMoney(client,price)
		infobox(client,loc(client,"Shops_144"),"info")
		setElementData(client,artikel,getElementData(client,artikel)+1)
		if(getPlayerData("business","Databasename","Supermarkt"..getElementDimension(client),"Besitzer") ~= "Niemand")then
			dbExec(handler,"UPDATE supermarkt SET "..artikel.." = '"..old-1 .."' WHERE ID = '"..getElementDimension(client).."'")
			addBizKasse("Supermarkt"..getElementDimension(client),price)
		end
		Supermarkt.getDatas(client)
	end
end)