-- [[ SHOPDATEN AUSGEBEN ]] --

function Gartenclub.getDatas(player)
	local tbl = {}
	for _,v in pairs(Gartenclub["Shop"])do
		table.insert(tbl,{v,getPlayerData("gartenclub","ID",getElementDimension(player),v),getPlayerData("gartenclub","ID",getElementDimension(player),v.."Preis")})
	end
	triggerClientEvent(player,"Gartenclub.setDatas",player,tbl)
end
addEvent("Gartenclub.getDatas",true)
addEventHandler("Gartenclub.getDatas",root,Gartenclub.getDatas)

-- [[ ARTIKEL KAUFEN ]] --

addEvent("Gartenclub.buy",true)
addEventHandler("Gartenclub.buy",root,function(artikel,menge)
	local menge = tonumber(menge)
	local preis = getPlayerData("gartenclub","ID",getElementDimension(client),artikel.."Preis")
	if(hasMoney(client,menge*preis))then
		local old = getPlayerData("gartenclub","ID",getElementDimension(client),artikel)
		if(getPlayerData("business","Databasename","Gartenclub"..getElementDimension(client),"Besitzer") ~= "Niemand")then
			if(old < menge)then
				infobox(client,loc(client,"Shops_114"):format(artikel),"error")
				return false
			end
		end
		takeMoney(client,menge*preis)
		setElementData(client,artikel,getElementData(client,artikel)+menge)
		if(getPlayerData("business","Databasename","Gartenclub"..getElementDimension(client),"Besitzer") ~= "Niemand")then
			dbExec(handler,"UPDATE gartenclub SET "..artikel.." = '"..old-menge.."' WHERE ID = '"..getElementDimension(client).."'")
			addBizKasse("Gartenclub"..getElementDimension(client),menge*preis)
		end
		infobox(client,loc(client,"Shops_115"):format(menge,artikel),"info")
		Gartenclub.getDatas(client)
		if(getElementData(client,"TutorialTask") == 6)then Tutorial.aufgabeErledigt(client) end
		Questsystem.addStufe(client,2,1)
	end
end)