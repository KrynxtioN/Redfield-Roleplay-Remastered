-- [[ FAHRZEUGHÄNDLER ERSTELLEN ]] --

function Fraktionsfahrzeughaendler.create()
	local rnd = math.random(1,#Fraktionsfahrzeughaendler["Models"])
	Fraktionsfahrzeughaendler.model = Fraktionsfahrzeughaendler["Models"][rnd]
	Fraktionsfahrzeughaendler.preis = Autohaus["Preise"][Fraktionsfahrzeughaendler.model]
	local rnd = math.random(1,#Fraktionssystem["Verkaufspeds"])
	local tbl = Fraktionssystem["Verkaufspeds"][rnd]
	Fraktionsfahrzeughaendler.ped = createPed(28,tbl[1],tbl[2],tbl[3],tbl[4])
	setElementData(Fraktionsfahrzeughaendler.ped,"FraktionsfahrzeugBuyID",rnd)
	setElementData(Fraktionsfahrzeughaendler.ped,"Name","Anonyme Person\nFraktionsfahreughändler")
end
Fraktionsfahrzeughaendler.create()

-- [[ FAHRZEUG KAUFEN ]] --

addEvent("Fraktionsfahrzeughaendler.buy",true)
addEventHandler("Fraktionsfahrzeughaendler.buy",root,function(model,preis)
	local preis = tonumber(preis)
	if(isElement(Fraktionsfahrzeughaendler.ped))then
		if(hasMoney(client,preis))then
			local ID = getElementData(client,"FraktionsfahrzeugBuyID")
			local tbl = Fraktionssystem["Verkaufspeds"][ID]
			destroyElement(Fraktionsfahrzeughaendler.ped)
			Autohaus.buy(client,Fraktionsfahrzeughaendler.model,Fraktionsfahrzeughaendler.preis,tbl[5],tbl[6],tbl[7],tbl[8],getElementData(client,"Fraktion"),0,Fraktionssystem["Fraktionnamen"][getElementData(client,"Fraktion")],Fraktionssystem["Fraktionnamen"][getElementData(client,"Fraktion")])
			triggerClientEvent(client,"setWindowDatas",client)
			setTimer(Fraktionsfahrzeughaendler.create,3600000,1)
		end
	else infobox(client,loc(client,"Fraktionen_266"),"error")end
end)