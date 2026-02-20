-- [[ ELEMENTE ERSTELLEN ]] --

Mechaniker.vehicleMarker = createMarker(-2052.5959472656,178.66336669922,28.589820480347,"cylinder",3,0,0,200,100)

-- [[ DAS FENSTER ÖFFNEN ]] --

addEvent("Mechaniker.getVehicleInMarker",true)
addEventHandler("Mechaniker.getVehicleInMarker",root,function()
	local tbl = {}
	for _,v in pairs(getElementsByType("vehicle"))do
		if(isElementWithinMarker(v,Mechaniker.vehicleMarker))then
			table.insert(tbl,{getElementData(v,"VehicleID"),getElementModel(v),getElementData(v,"Besitzer")})
		end
	end
	if(#tbl >= 1)then triggerClientEvent(client,"Mechaniker.setVehicleMarkerDatas",client,tbl)end
end)

-- [[ REPAIRKITS KAUFEN ]] --

addEvent("Mechaniker.buyRepairkits",true)
addEventHandler("Mechaniker.buyRepairkits",root,function(menge)
	local menge = tonumber(menge)
	local preis = 1250*menge
	
	if(hasMoney(client,preis))then
		takeMoney(client,preis)
		setElementData(client,"Repairkits",getElementData(client,"Repairkits")+menge)
		infobox(client,loc(client,"Unternehmen_77"):format(menge,preis),"info")
		addToLager(2,"Geld",preis/100*50,"unternehmenlager")
		setPlayerAchievement(client,28)
	end
end)

-- [[ DAS FENSTER VOM ABSCHLEPPHOF ÖFFNEN ]] --

addEvent("Mechaniker.abschlepphof",true)
addEventHandler("Mechaniker.abschlepphof",root,function()
	local result = dbPoll(dbQuery(handler,"SELECT * FROM vehicles"),-1)
	if(#result >= 1)then
		local tbl = {}
		for _,v in pairs(result)do
			if(v["Besitzer"] == getPlayerName(client) and v["Abgeschleppt"] == 1 or v["Fraktion"] == getElementData(client,"Fraktion") and v["Abgeschleppt"] == 1 or v["Unternehmen"] == getElementData(client,"Unternehmen") and v["Abgeschleppt"] == 1)then
				table.insert(tbl,{v["ID"],v["Model"],v["Besitzer"]})
			end
		end
		triggerClientEvent(client,"Mechaniker.abschlepphof",client,tbl)
	end
end)

-- [[ FAHRZEUG ABSCHLEPPEN ]] --

addEvent("Mechaniker.abschleppen",true)
addEventHandler("Mechaniker.abschleppen",root,function()
	if(isPedInVehicle(client))then
		if(isUnternehmenDuty(client))then
			local veh = getPedOccupiedVehicle(client)
			local vehicleTowing = getVehicleTowedByVehicle(veh)
			if(vehicleTowing ~= false)then
				if(getElementModel(veh) == 525 and getElementData(veh,"Unternehmen") == 1)then
					if(getElementData(vehicleTowing,"Besitzer"))then
						infobox(client,loc(client,"Unternehmen_78"),"info")
						destroyElement(vehicleTowing)
						dbExec(handler,"UPDATE vehicles SET abgeschleppt = 1 WHERE ID = '"..getElementData(vehicleTowing,"ID").."'")
					else infobox(client,loc(client,"Unternehmen_79"),"error")end
				else infobox(client,loc(client,"Unternehmen_80"),"error")end
			end
		end
	end
end)

-- [[ ABGESCHLEPPTES FAHRZEUG FREIKAUFEN ]] --

addEvent("Mechaniker.freikaufen",true)
addEventHandler("Mechaniker.freikaufen",root,function(id)
	if(hasMoney(client,2500))then
		if(getPlayerData("vehicles","ID",id,"abgeschleppt") == 0)then
			takeMoney(client,2500)
			dbExec(handler,"UPDATE vehicles SET abgeschleppt = 0 WHERE ID = '"..id.."'")
			addToLager(2,"Geld",2500/100*50,"unternehmenlager")
			infobox(client,loc(client,"Unternehmen_81"),"info")
		else infobox(client,loc(client,"Unternehmen_82"),"error")end
	end
end)

-- [[ EXPLOS LÖSCHEN ]] --

addEvent("Mechaniker.deleteExplos",true)
addEventHandler("Mechaniker.deleteExplos",root,function(id)
	local id = tonumber(id)
	if(isElement(Vehicles[id]))then
		if(isElementWithinMarker(Vehicles[id],Mechaniker.vehicleMarker))then
			if(hasMoney(client,25000))then
				if(getElementData(Vehicles[id],"Explos") >= 1)then
					takeMoney(client,25000)
					setElementData(Vehicles[id],"Explos",getElementData(Vehicles[id],"Explos")-1)
					infobox(client,loc(client,"Unternehmen_83"),"info")
					dbExec(handler,"UPDATE vehicles SET Explos = '"..getElementData(Vehicles[id],"Explos").."' WHERE ID = '"..id.."'")
					addToLager(2,"Geld",25000/100*50,"unternehmenlager")
				else infobox(client,loc(client,"Unternehmen_84"),"error")end
			end
		else infobox(client,loc(client,"Unternehmen_85"),"error")end
	else infobox(client,loc(client,"Unternehmen_86"),"error")end
end)

-- [[ SPORTMOTOR EINBAUEN ]] --

addEvent("Mechaniker.sportmotor",true)
addEventHandler("Mechaniker.sportmotor",root,function(id)
	local id = tonumber(id)
	if(isElement(Vehicles[id]))then
		if(isElementWithinMarker(Vehicles[id],Mechaniker.vehicleMarker))then
			if(hasMoney(client,150000))then
				if(getElementData(Vehicles[id],"Sportmotor") == 0)then
					takeMoney(client,150000)
					setElementData(Vehicles[id],"Sportmotor",1)
					dbExec(handler,"UPDATE vehicles SET Sportmotor = '1' WHERE ID = '"..id.."'")
					setVehicleHandling(Vehicles[id],"engineAcceleration",(getVehicleHandling(Vehicles[id])["engineAcceleration"]/100*150))
					setVehicleHandling(Vehicles[id],"maxVelocity",(getVehicleHandling(Vehicles[id])["maxVelocity"]/100*150))
					infobox(client,loc(client,"Unternehmen_87"),"info")
					addToLager(2,"Geld",150000/100*50,"unternehmenlager")
				else infobox(client,loc(client,"Unternehmen_88"),"error")end
			end
		else infobox(client,loc(client,"Unternehmen_89"),"error")end
	else infobox(client,loc(client,"Unternehmen_90"),"error")end
end)