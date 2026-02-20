-- [[ FAHRZEUGDATAS LADEN ]] --

function Fahrzeugstelle.getDatas(player)
	local privat = {}
	local firma = {}
	local fraktion = {}
	local result = dbPoll(dbQuery(handler,"SELECT * FROM vehicles"),-1)
	if(#result >= 1)then
		for _,v in pairs(result)do
			if(v["Besitzer"] == getPlayerName(client))then
				table.insert(privat,{v["ID"],getVehicleNameFromModel(v["Model"])})
			elseif(v["Firma"] == getElementData(client,"Firma"))then
				table.insert(firma,{v["ID"],getVehicleNameFromModel(v["Model"])})
			elseif(v["Fraktion"] == getElementData(client,"Fraktion"))then
				table.insert(fraktion,{v["ID"],getVehicleNameFromModel(v["Model"])})
			end
		end
	end
	triggerClientEvent(client,"Fahrzeugstelle.setDatas",client,privat,firma,fraktion)
end
addEvent("Fahrzeugstelle.getDatas",true)
addEventHandler("Fahrzeugstelle.getDatas",root,Fahrzeugstelle.getDatas)

-- [[ FAHRZEUG ZUM FIRMENFAHRZEUG / PRIVATFAHRZEUG MACHEN ]] --

addEvent("Fahrzeugstelle.putVehicleInFirma",true)
addEventHandler("Fahrzeugstelle.putVehicleInFirma",root,function(id,type)
	local id = tonumber(id)
	if(isElement(Vehicles[id]))then
		if(type == "Zum Firmenfahrzeug machen")then
			if(getElementData(Vehicles[id],"Besitzer") == getPlayerName(client))then
				if(getElementData(client,"Firma") >= 1)then
					dbExec(handler,"UPDATE vehicles SET Firma = '"..getElementData(client,"Firma").."', Besitzer = '"..getElementData(client,"FirmenName").."', Kennzeichen = '"..getElementData(client,"FirmenName").."' WHERE ID = '"..id.."'")
					setElementData(Vehicles[id],"Firma",getElementData(client,"Firma"))
					setElementData(Vehicles[id],"Besitzer",getElementData(client,"FirmenName"))
					setVehiclePlateText(Vehicles[id],getElementData(client,"FirmenName"))
					infobox(client,loc(client,"Fahrzeugsystem_87"),"info")
					Fahrzeugstelle.getDatas(client)
					outputLog(getPlayerName(client).." hat sein Fahrzeug mit der ID "..id.." zu einem Firmenfahrzeug gemacht.","Fahrzeugsystem")
				else infobox(client,loc(client,"Fahrzeugsystem_88"),"error")end
			else infobox(client,loc(client,"Fahrzeugsystem_89"),"error")end
		else
			if(getElementData(client,"Firmarang") >= 5)then
				if(getElementData(Vehicles[id],"Firma") == getElementData(client,"Firma"))then
					dbExec(handler,"UPDATE vehicles SET Firma = '0', Besitzer = '"..getPlayerName(client).."', Kennzeichen = '"..getPlayerName(client).."' WHERE ID = '"..id.."'")
					setElementData(Vehicles[id],"Firma",0)
					setElementData(Vehicles[id],"Besitzer",getPlayerName(client))
					setVehiclePlateText(Vehicles[id],getPlayerName(client))
					infobox(client,loc(client,"Fahrzeugsystem_90"),"info")
					Fahrzeugstelle.getDatas(client)
					outputLog(getPlayerName(client).." hat das Firmenfahrzeug mit der ID "..id.." zu seinem Privatfahrzeug gemacht.","Fahrzeugsystem")
				else infobox(client,loc(client,"Fahrzeugsystem_91"),"error")end
			else infobox(client,loc(client,"Fahrzeugsystem_92"),"error")end
		end
	else infobox(client,loc(client,"Fahrzeugsystem_93"),"error")end
end)