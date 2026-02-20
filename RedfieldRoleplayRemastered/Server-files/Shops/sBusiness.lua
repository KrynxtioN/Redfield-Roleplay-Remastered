-- [[ BUSINESS ERSTELLEN ]] --

local result = dbPoll(dbQuery(handler,"SELECT * FROM business"),-1)

if(#result >= 1)then
	for _,v in pairs(result)do
		local pickup = createPickup(v["Spawnx"],v["Spawny"],v["Spawnz"],3,1314,50)
		addEventHandler("onPickupHit",pickup,function(player)
			if(not(isPedInVehicle(player)))then	
				local besitzer = getPlayerData("business","Databasename",v["Databasename"],"Besitzer")
				local x,y,z = getElementPosition(source)
				setElementData(player,"BizPosX",x)
				setElementData(player,"BizPosY",y)
				setElementData(player,"BizPosZ",z)
				setElementData(player,"SaveBiz",v["Databasename"])
				triggerClientEvent(player,"Business.openWindow",player,besitzer,v["Preis"],v["Name"],v["Databasename"])
			end
		end)
	end
end

-- [[ GELD IN DIE BIZKASSE LEGEN ]] --

function addBizKasse(name,money)
	if(getPlayerData("business","Name",name,"Besitzer") ~= "Niemand")then
		local newMoney = getPlayerData("business","Databasename",name,"Kasse")+money
		local newSteuern = getPlayerData("business","Databasename",name,"Steuern")+math.floor(money/100*15)
		dbExec(handler,"UPDATE business SET Kasse = '"..newMoney.."', Steuern = '"..newSteuern.."' WHERE Databasename = '"..name.."'")
	end
end

-- [[ KAUFEN / VERKAUFEN ]] --

addEvent("Business.buy",true)
addEventHandler("Business.buy",root,function(type)
	local business = getElementData(client,"SaveBiz")
	local preis = getPlayerData("business","Databasename",business,"Preis")
	local besitzer = getPlayerData("business","Databasename",business,"Besitzer")
	if(type == "Kaufen")then
		if(besitzer == "Niemand")then
			if(hasMoney(client,tonumber(preis)))then
				takeMoney(client,preis)
				dbExec(handler,"UPDATE business SET Besitzer = '"..getPlayerName(client).."' WHERE Databasename = '"..business.."'")
				infobox(client,loc(client,"Shops_118"),"info")
				triggerClientEvent(client,"setWindowDatas",client)
			end
		else infobox(client,loc(client,"Shops_119"),"error")end
	else
		if(besitzer == getPlayerName(client))then
			setElementData(client,"Geld",getElementData(client,"Geld")+preis/100*75)
			infobox(client,loc(client,"Shops_120"):format(preis/100*75),"info")
			triggerClientEvent(client,"setWindowDatas",client)
			dbExec(handler,"UPDATE business SET Besitzer = 'Niemand' WHERE Databasename = '"..business.."'")
		end
	end
end)

-- [[ EIN- / AUSZAHLEN ]] --

addEvent("Business.einAuszahlen",true)
addEventHandler("Business.einAuszahlen",root,function(summe,type)
	local business = getElementData(client,"SaveBiz")
	local summe = tonumber(summe)
	local bizkasse = getPlayerData("business","Databasename",business,"Kasse")
	if(type == "Einzahlen")then
		if(hasMoney(client,summe))then
			takeMoney(client,summe)
			dbExec(handler,"UPDATE business SET Kasse = '"..bizkasse + summe.."' WHERE Databasename = '"..business.."'")
			infobox(client,loc(client,"Shops_121"):format(summe),"info")
		end
	else
		if(bizkasse >= summe)then
			setElementData(client,"Geld",getElementData(client,"Geld")+summe)
			dbExec(handler,"UPDATE business SET Kasse = '"..bizkasse - summe.."' WHERE Databasename = '"..business.."'")
			infobox(client,loc(client,"Shops_122"):format(summe),"info")
		else infobox(client,loc(client,"Shops_123"),"error")end
	end
	Business.getVerwaltungDatas(client)
end)

-- [[ VERWALTUNGSDATAS LADEN ]] --

local Carhousepositions = {
	{-1967.1873779297,291.57431030273,35.263717651367,"wangcars"},
	{-1643.3814697266,1201.1492919922,7.2489910125732,"ottoscars"},
	{555.03753662109,-1293.9266357422,17.248237609863,"grottiscars"},
	{201.26934814453,-236.68061828613,1.578125,"blueberrycars"},
	{-2239.2595214844,107.25885772705,35.3203125,"bikeshop"},
	{-1364.0035400391,-248.51545715332,14.14396572113,"flugzeugshop"},
	{-2184.3872070313,2413.4365234375,5.15625,"bootshaus"},
}

function Business.getVerwaltungDatas(player)
	local business = getElementData(player,"SaveBiz")
	local bizkasse = getPlayerData("business","Databasename",business,"Kasse") 
	local name = getPlayerData("business","Databasename",business,"Name")
	local tabelle = getPlayerData("business","Databasename",business,"Tabelle")
	local tbl = {}
	local rechnungen = {}
	local result = dbPoll(dbQuery(handler,"SELECT * FROM rechnungen WHERE Name = '"..business.."'"),-1)
	if(string.find(business,"Autohaus"))then
		for _,v in pairs(Carhousepositions)do
			if(getDistanceBetweenPoints3D(v[1],v[2],v[3],getElementPosition(player)) <= 5)then
				tabelle = v[4]
				break
			end
		end
	end
	if(Business[tabelle])then
		for _,v in pairs(Business[tabelle])do
			if(string.find(business,"Autohaus"))then
				local lager = getPlayerData("autohaus","Name",business,v)
				if(not(lager))then lager = "/" end
				local preis = getPlayerData("autohaus","Name",business,v.."Preis")
				local bestellpreis = Bestellkosten[v]
				table.insert(tbl,{v,lager,preis,bestellpreis})
			else
				local lager = getPlayerData(tabelle,"Name",business,v)
				if(not(lager))then lager = "/" end
				local preis = getPlayerData(tabelle,"Name",business,v.."Preis")
				local bestellpreis = Bestellkosten[v]
				table.insert(tbl,{v,lager,preis,bestellpreis})
			end
		end
	end
	if(#rechnungen >= 1)then
		for _,v in pairs(result)do
			table.insert(rechnungen,{v["ID"],v["Summe"],v["Grund"]})
		end
	end
	triggerClientEvent(player,"Business.setVerwaltungDatas",player,name,bizkasse,tbl,rechnungen)
end
addEvent("Business.getVerwaltungDatas",true)
addEventHandler("Business.getVerwaltungDatas",root,Business.getVerwaltungDatas)

-- [[ WARE BESTELLEN ]] --

addEvent("Business.bestellen",true)
addEventHandler("Business.bestellen",root,function(artikel,menge)
	local menge = tonumber(menge)
	if(menge >= 1)then
		local business = getElementData(client,"SaveBiz")
		local artikelPreis = Bestellkosten[artikel]
		local gewinn = ((menge*Bestellkosten[artikel])/100)*5
		local preis = Bestellkosten[artikel] * menge + (gewinn)
		local bizkasse = getPlayerData("business","Databasename",business,"Kasse") 
		if(bizkasse >= preis)then
			infobox(client,loc(client,"Shops_124"),"info")
			dbExec(handler,"INSERT INTO trucker (Artikel,Menge,Name,Kosten,Lieferungstyp) VALUES (?,?,?,?,?)",artikel,menge,business,preis,Trucker["Liefertyp"][artikel])
			dbExec(handler,"UPDATE business SET Kasse = '"..bizkasse - preis.."' WHERE Databasename = '"..business.."'")
			for _,v in pairs(getElementsByType("player"))do
				if(getElementData(v,"loggedin") == 1)then
					if(getElementData(v,"Unternehmen") == 4)then
						outputChatBox(loc(v,"Shops_125"),v,255,255,255)
					end
				end
			end
		else infobox(client,loc(client,"Shops_126"):format(preis),"error")end
	else infobox(client,loc(client,"Shops_127"),"error")end
end)

-- [[ PREIS DER WARE VERÄNDERN ]] --

addEvent("Business.changePreis",true)
addEventHandler("Business.changePreis",root,function(item,preis)
	local preis = tonumber(preis)
	if(preis >= 1)then
		local item = item.."Preis"
		local business = getElementData(client,"SaveBiz")
		local tabelle = getPlayerData("business","Databasename",business,"Tabelle")
		dbExec(handler,"UPDATE "..tabelle.." SET "..item.." = "..preis.." WHERE Name = '"..business.."'")
		infobox(client,loc(client,"Shops_128"),"info")
		Business.getVerwaltungDatas(client)
		if(business == "Sprunk")then
			for _,v in pairs(getElementsByType("player"))do
				Sprunk.setDatas(v)
			end
		end
	else infobox(client,loc(client,"Shops_129"),"error")end
end)