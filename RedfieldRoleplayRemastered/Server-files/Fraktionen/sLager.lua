-- [[ LAGER ERSTELLEN ]] --

for _,v in pairs(Fraktionslager["Objekte"])do
	local object = createObject(3577,v[1],v[2],v[3],0,0,0)
	setElementData(object,"DepotType",v[4])
	setElementData(object,"DepotDatabase",v[5])
	setElementData(object,"DepotID",v[6])
end

-- [[ LAGERDATAS LADEN ]] --

addEvent("getFraktionsDepotDatas",true)
addEventHandler("getFraktionsDepotDatas",root,function()
	local DepotDatabase = getElementData(client,"DepotDatabase")
	local DepotID = getElementData(client,"DepotID")
	local tbl = {}
	for _,v in pairs(Fraktionslager["Items"])do
		table.insert(tbl,{v,getPlayerData(DepotDatabase,"ID",DepotID,v)})
	end
	triggerClientEvent(client,"setFraktionsDepotDatas",client,tbl,getPlayerData(DepotDatabase,"ID",DepotID,"Rang"),DepotDatabase)
end)

-- [[ ITEM INS LAGER PACKEN ]] --

function addToLager(id,name,menge,lager)
	local old = getPlayerData(lager,"ID",id,name)
	dbExec(handler,"UPDATE "..lager.." SET "..name.." = '"..old + menge.."' WHERE ID = '"..id.."'")
end

-- [[ EIN- / AUSZAHLEN ]] --

addEvent("Fraktionssystem.lager",true)
addEventHandler("Fraktionssystem.lager",root,function(id,name,menge,type,lager,button)
	local menge = tonumber(menge)
	local neededRang = getPlayerData(lager,"ID",id,"Rang")
	local old = getPlayerData(lager,"ID",id,name)
	
	if(button == "Auszahlen")then
		if(getElementData(client,type.."rang") >= neededRang)then
			if(old >= menge)then
				dbExec(handler,"UPDATE "..lager.." SET "..name.." = '"..old - menge.."' WHERE ID = '"..id.."'")
				setElementData(client,name,getElementData(client,name)+menge)
				infobox(client,loc(client,"Fraktionen_335"):format(menge,name),"info")
			else infobox(client,loc(client,"Fraktionen_336"):format(name),"error")end
		else infobox(client,loc(client,"Fraktionen_337"),"error")end
	else
		if(getElementData(client,name) >= menge)then
			dbExec(handler,"UPDATE "..lager.." SET "..name.." = '"..old + menge.."' WHERE ID = '"..id.."'")
			setElementData(client,name,getElementData(client,name)-menge)
			infobox(client,loc(client, "Fraktionen_338"):format(name,menge),"info")
		else infobox(client,loc(client,"Fraktionen_339"):format(name),"error")end
	end
end)

-- [[ BENÖTIGTEN RANG FÜR DEPOTNUTZUNG EINSTELLEN ]] --

addEvent("Fraktionssystem.neededRangForDepot",true)
addEventHandler("Fraktionssystem.neededRangForDepot",root,function(type,rang,lager)
	local rang = tonumber(rang)
	if(getElementData(client,type.."rang") >= 5)then
		if(rang >= 0 and rang <= 5)then
			dbExec(handler,"UPDATE "..lager.." SET Rang = '"..rang.."' WHERE ID = '"..getElementData(client,type).."'")
			infobox(client,loc(client,"Fraktionen_340"):format(rang,type),"info")
		else infobox(client,loc(client,"Fraktionen_341"),"error")end
	else infobox(client,loc(client,"Fraktionen_342"),"error")end
end)