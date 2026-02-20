-- [[ BANKAUTOMATEN ERSTELLEN ]] --

local result = dbPoll(dbQuery(handler,"SELECT * FROM atms"),-1)

if(#result >= 1)then
	for _,v in pairs(result)do
		local atm = createObject(2942,v["Spawnx"],v["Spawny"],v["Spawnz"],0,0,v["Rotation"])
		setElementInterior(atm,v["Interior"])
		setElementDimension(atm,v["Dimension"])
		setElementData(atm,"ATMID",v["ID"])
		setElementData(atm,"ATMInhalt",v["Inhalt"])
	end
end

-- [[ DAS FENSTER ÖFFNEN ]] --

function ATM.openWindow(player)
	local tbl = {}
	local result = dbPoll(dbQuery(handler,"SELECT * FROM zahlungen WHERE Empfaenger = '"..getPlayerName(player).."'"),-1)
	if(#result >= 1)then
		for _,v in pairs(result)do
			table.insert(tbl,{v["Summe"],v["Type"],v["Name"]})
		end
	end
	triggerClientEvent(player,"ATM.openAfterPin",player,tbl)
end
addEvent("ATM.openWindow",true)
addEventHandler("ATM.openWindow",root,ATM.openWindow)

-- [[ KONTOAUSZUG HINZUFÜGEN ]] --

function ATM.addZahlung(summe,type,name,playername)
	dbExec(handler,"INSERT INTO zahlungen (Summe,Type,Name,Empfaenger) VALUES ('"..summe.."','"..type.."','"..name.."','"..playername.."')")
end

-- [[ EIN- / AUSZAHLEN ]] --

addEvent("ATM.server",true)
addEventHandler("ATM.server",root,function(money,type)
	local money = tonumber(money)
	local ATMID = getElementData(client,"ATMID")
	local ATMInhalt = tonumber(getPlayerData("atms","ID",ATMID,"Inhalt"))
	if(type == "auszahlen")then
		if(getElementData(client,"Bankgeld") >= money)then
			if(ATMInhalt >= money)then
				setElementData(client,"Bankgeld",getElementData(client,"Bankgeld")-money)
				setElementData(client,"Geld",getElementData(client,"Geld")+money)
				infobox(client,loc(client,"Systeme_259"):format(money),"info")
				ATM.addZahlung(money,"-","Auszahlung",getPlayerName(client))
				dbExec(handler,"UPDATE atms SET Inhalt = '"..ATMInhalt - money.."' WHERE ID = '"..ATMID.."'")
			else infobox(client,loc(client,"Systeme_260"):format(ATMInhalt),"error")end
		else infobox(client,loc(client,"Systeme_261"),"error")end
	elseif(type == "einzahlen")then
		if(getElementData(client,"Geld") >= money)then
			setElementData(client,"Geld",getElementData(client,"Geld")-money)
			setElementData(client,"Bankgeld",getElementData(client,"Bankgeld")+money)
			infobox(client,loc(client,"Systeme_262"):format(money),"info")
			ATM.addZahlung(money,"+","Einzahlung",getPlayerName(client))
			if(ATMInhalt + money > 750000)then ATMInhalt = 750000 else ATMInhalt = ATMInhalt + money end
			dbExec(handler,"UPDATE atms SET Inhalt = '"..ATMInhalt.."' WHERE ID = '"..ATMID.."'")
		else infobox(client,loc(client,"Systeme_263"),"error")end
	end
	triggerClientEvent(client,"ATM.refresh",client)
end)

-- [[ ÜBERWEISEN ]] --

addEvent("ATM.ueberweisen",true)
addEventHandler("ATM.ueberweisen",root,function(money,target)
	local money = tonumber(money)
	local target = getPlayerFromName(target)
	if(getElementData(client,"Bankgeld") >= money)then
		if(isElement(target))then
			setElementData(target,"Bankgeld",getElementData(target,"Bankgeld")+money)
			setElementData(client,"Bankgeld",getElementData(client,"Bankgeld")-money)
			infobox(target,loc(target,"Systeme_264"):format(getPlayerName(client),money),"info")
		else
			local newMoney = getPlayerData("userdata","Username",target,"Bankgeld")+money
			dbExec(handler,"UPDATE userdata SET Bankgeld = '"..newMoney.."' WHERE Username = '"..target.."'")
			Postfach.sendMessage(getPlayerName(client),target,"Überweisung",getPlayerName(client).." hat dir $"..money.." überwiesen.",0)
		end
		infobox(client,loc(client,"Systeme_265"):format(getPlayerName(target),money),"info")
		ATM.addZahlung(money,"+","Überweisung von "..target,getPlayerName(client))
	else infobox(client,loc(client,"Systeme_266"),"error")end
end)

-- [[ WAS PASSIERT, WENN SPIELER STIRBT / QUITTET ]] --

function ATM.destroyElements(player)
	if(isElement(ATM.moneyBag[player]))then destroyElement(ATM.moneyBag[player])end
	setElementData(player,"AutomatensprengkitStatus",false)
	if(isTimer(ATM.robTimer[player]))then killTimer(ATM.robTimer[player])end
end

addEventHandler("onPlayerQuit",root,function() ATM.destroyElements(source) end)
addEventHandler("onPlayerWasted",root,function() ATM.destroyElements(source) end)