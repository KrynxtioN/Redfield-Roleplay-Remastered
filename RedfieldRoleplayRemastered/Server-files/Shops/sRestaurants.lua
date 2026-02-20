-- [[ DAS FENSTER ÖFFNEN ]] --

addEvent("Restaurants.getDatas",true)
addEventHandler("Restaurants.getDatas",root,function(gericht)
	triggerClientEvent(client,"Restaurants.refreshText",client,getPlayerData(getElementData(client,"Restaurant"),"ID",getElementDimension(client),"Gericht"..gericht.."Preis"),getPlayerData(getElementData(client,"Restaurant"),"ID",getElementDimension(client),"Gericht"..gericht))
end)

-- [[ ARTIKEL KAUFEN ]] --

addEvent("Restaurants.buy",true)
addEventHandler("Restaurants.buy",root,function(gericht)
	local preis = tonumber(getPlayerData(getElementData(client,"Restaurant"),"ID",getElementDimension(client),"Gericht"..gericht.."Preis"))
	if(hasMoney(client,preis))then
		local old = getPlayerData(getElementData(client,"Restaurant"),"ID",getElementDimension(client),"Gericht"..gericht)
		if(getPlayerData("business","Databasename",getElementData(client,"Restaurant2")..getElementDimension(client),"Besitzer") ~= "Niemand")then
			if(old < 1)then
				infobox(client,loc(client,"Shops_140"),"error")
				return false
			end
		end
		takeMoney(client,preis)
		infobox(client,loc(client,"Shops_141"),"info")
		if(getPlayerData("business","Databasename",getElementData(client,"Restaurant2")..getElementDimension(client),"Besitzer") ~= "Niemand")then
			dbExec(handler,"UPDATE "..getElementData(client,"Restaurant").." SET Gericht"..gericht.." = '"..old-1 .."' WHERE ID = '"..getElementDimension(client).."'")
			addBizKasse(getElementData(client,"Restaurant")..getElementDimension(client),preis)
		end
		addHunger(client,preis)
		if(getElementData(client,"TutorialTask") == 9)then Tutorial.aufgabeErledigt(client) end
	end
end)

-- [[ HUNGER HINZUFÜGEN ]] --

function addHunger(player,menge)
	setElementData(player,"Hunger",getElementData(player,"Hunger")+menge)
	if(getElementData(player,"Hunger") > 100)then
		setElementData(player,"Hunger",100)
	end
	setElementHealth(player,getElementHealth(player)+menge)
	if(getElementHealth(player) > 100)then
		setElementHealth(player,100)
	end
end