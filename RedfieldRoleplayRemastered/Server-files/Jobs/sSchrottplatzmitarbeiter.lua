-- [[ JOB STARTEN (LEVEL 1) ]] --

addEvent("Schrottplatzmitarbeiter.level1",true)
addEventHandler("Schrottplatzmitarbeiter.level1",root,function()
	if(hasPlayerLicense(client,578))then
		if(not(isElement(Schrottplatzmitarbeiter.vehicle[client])))then
			if(not(isElement(Schrottplatzmitarbeiter.damagedvehicle[client])))then
				Schrottplatzmitarbeiter.vehicle[client] = createVehicle(578,2144.5,-1995.5999755859,14.300000190735,0,0,45.25)
				warpPedIntoVehicle(client,Schrottplatzmitarbeiter.vehicle[client])
				infobox(client,loc(client,"Jobs_90"),"info")
				triggerClientEvent(client,"Schrottplatzmitarbeiter.createMarker",client,"create")
				
				addEventHandler("onVehicleExit",Schrottplatzmitarbeiter.vehicle[client],function(player)
					destroyElement(Schrottplatzmitarbeiter.vehicle[player])
					if(isElement(Schrottplatzmitarbeiter.damagedvehicle[player]))then destroyElement(Schrottplatzmitarbeiter.damagedvehicle[player])end
					triggerClientEvent(player,"Schrottplatzmitarbeiter.createMarker",player)
				end)
			else infobox(client,loc(client,"Jobs_91"),255,0,0)end
		end
	end
end)
	
-- [[ FAHRZEUG BELADEN ]] --

addEvent("Schrottplatzmitarbeiter.vehicle",true)
addEventHandler("Schrottplatzmitarbeiter.vehicle",root,function(vehicle)
	local preis = Schrottplatzmitarbeiter["Fahrzeuge"][vehicle][1]
	if(hasMoney(client,preis))then
		takeMoney(client,preis)
		triggerClientEvent(client,"setWindowDatas",client)
		Schrottplatzmitarbeiter.damagedvehicle[client] = createVehicle(Schrottplatzmitarbeiter["Fahrzeuge"][vehicle][2],0,0,0,0,0,0)
		attachElements(Schrottplatzmitarbeiter.damagedvehicle[client],Schrottplatzmitarbeiter.vehicle[client],0,-1,0.5)
		Schrottplatzmitarbeiter.money[client] = {Schrottplatzmitarbeiter["Fahrzeuge"][vehicle][1], Schrottplatzmitarbeiter["Fahrzeuge"][vehicle][1]/100*25}
		infobox(client,loc(client,"Jobs_92"),"info")
	end
end)
	
-- [[ ABGEBEN ]] --

addEvent("Schrottplatzmitarbeiter.abgabe",true)
addEventHandler("Schrottplatzmitarbeiter.abgabe",root,function()
	if(isElement(Schrottplatzmitarbeiter.damagedvehicle[client]))then
		destroyElement(Schrottplatzmitarbeiter.damagedvehicle[client])
		giveJobMoney(client,Schrottplatzmitarbeiter.money[client][2])
		setElementData(client,"Geld",getElementData(client,"Geld")+Schrottplatzmitarbeiter.money[client][1])
		setElementData(client,"SchrottplatzmitarbeiterPunkte",getElementData(client,"SchrottplatzmitarbeiterPunkte")+Schrottplatzmitarbeiter.money[client][2]/100*0.5)
		infobox(client,loc(client,"Jobs_93"),"info")
	end
end)

-- [[ ELEMENTE ZERSTÖREN ]] --

function Schrottplatzmitarbeiter.destroy(player)
	if(isElement(Schrottplatzmitarbeiter.vehicle[player]))then destroyElement(Schrottplatzmitarbeiter.vehicle[player])end
	if(isElement(Schrottplatzmitarbeiter.damagedvehicle[player]))then destroyElement(Schrottplatzmitarbeiter.damagedvehicle[player])end
	triggerClientEvent(player,"Schrottplatzmitarbeiter.createMarker",player)
end

-- [[ WAS PASSIERT, WENN SPIELER STIRBT / QUITTET ]] --

addEventHandler("onPlayerQuit",root,function() Schrottplatzmitarbeiter.destroy(source)end)
addEventHandler("onPlayerWasted",root,function() Schrottplatzmitarbeiter.destroy(source)end)