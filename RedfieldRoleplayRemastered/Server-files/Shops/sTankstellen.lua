for i = 1,13 do
	local object = createObject(1776,-30.064599990845,-57.936399841309,1003.616875,0,0,180)
	setElementInterior(object,6)
	setElementDimension(object,i)
end

-- [[ SHOPDATEN AUSGEBEN ]] --

function Tankstellen.getDatas(player)
	local tbl = {}
	for _,v in pairs(Tankstellen["Shop"])do
		table.insert(tbl,{v,getPlayerData("tankstellenshop","ID",getElementDimension(player),v),getPlayerData("tankstellenshop","ID",getElementDimension(player),v.."Preis")})
	end
	triggerClientEvent(player,"Tankstellen.setDatas",player,tbl)
end
addEvent("Tankstellen.getDatas",true)
addEventHandler("Tankstellen.getDatas",root,Tankstellen.getDatas)

-- [[ ARTIKEL KAUFEN ]] --

addEvent("Tankstellen.buyShop",true)
addEventHandler("Tankstellen.buyShop",root,function(artikel)
	local price = getPlayerData("tankstellenshop","ID",getElementDimension(client),artikel.."Preis")
	if(hasMoney(client,price))then
		local old = getPlayerData("tankstellenshop","ID",getElementDimension(client),artikel)
		if(getPlayerData("business","Databasename","Tankstelle"..getElementDimension(client),"Besitzer") ~= "Niemand")then
			if(old < 1)then
				infobox(client,loc(client,"Shops_145"),"error")
				return false
			end
		end
		takeMoney(client,price)
		infobox(client,loc(client,"Shops_146"),"info")
		setElementData(client,artikel,getElementData(client,artikel)+1)
		if(getPlayerData("business","Databasename","Tankstelle"..getElementDimension(client),"Besitzer") ~= "Niemand")then
			dbExec(handler,"UPDATE tankstellenshop SET "..artikel.." = '"..old-1 .."' WHERE ID = '"..getElementDimension(client).."'")
			addBizKasse("Tankstelle"..getElementDimension(client),price)
		end
		Tankstellen.getDatas(client)
	end
end)