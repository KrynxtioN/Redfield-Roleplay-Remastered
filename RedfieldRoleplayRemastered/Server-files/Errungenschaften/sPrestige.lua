-- [[ DIE PRESTIGE-OBJEKTE LADEN ]] --

local result = dbPoll(dbQuery(handler,"SELECT * FROM prestige"),-1)

if(#result >= 1)then
	for _,v in pairs(result)do
		local pickup = createPickup(v["Spawnx"],v["Spawny"],v["Spawnz"],3,1239,50)
		setElementData(pickup,"PrestigeID",v["ID"])
		
		addEventHandler("onPickupHit",pickup,function(player)
			if(not(isPedInVehicle(player)))then
				local besitzer = getPlayerData("prestige","ID",getElementData(source,"PrestigeID"),"Besitzer")
				triggerClientEvent(player,"Prestige.openWindow",player,v["Name"],besitzer,v["Preis"])
			end
		end)
	end
end

-- [[ KAUFEN / VERKAUFEN ]] --

addEvent("Prestige.buyObject",true)
addEventHandler("Prestige.buyObject",root,function(name,preis)
	if(getPlayerData("prestige","Name",name,"Besitzer") == "Niemand")then
		if(hasMoney(client,preis))then
			takeMoney(client,preis)
			setElementData(client,"Jobgehaltsbonus",getElementData(client,"Jobgehaltsbonus")+1)
			infobox(client,loc(client,"Errungenschaften_1"),"info")
			dbExec(handler,"UPDATE prestige SET Besitzer = '"..getPlayerName(client).."' WHERE Name = '"..name.."'")
			outputLog(getPlayerName(client).." hat das Prestige-Objekt "..name.." gekauft.","Errungenschaften")
			setPlayerAchievement(client,9)
		end
	else
		setElementData(client,"Jobgehaltsbonus",getElementData(client,"Jobgehaltsbonus")-1)
		infobox(client,loc(client,"Errungenschaften_2"):format(preis/100*75),"info")
		setElementData(client,"Geld",getElementData(client,"Geld")+preis/100*75)
		dbExec(handler,"UPDATE prestige SET Besitzer = 'Niemand' WHERE Name = '"..name.."'")
		outputLog(getPlayerName(client).." hat das Prestige-Objekt "..name.." verkauft.","Errungenschaften")
	end
	triggerClientEvent(client,"setWindowDatas",client)
end)