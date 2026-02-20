VehicleIDForPort = 0
local result = dbPoll(dbQuery(handler,"SELECT * FROM vehicles"),-1)
for _,v in pairs(result)do VehicleIDForPort = v["ID"] end

-- [[ HAT SPIELER BENÖTIGTE LIZENZ? ]] --

function hasPlayerLicense(player,model)
	if(Autohaus["Fuehrerschein"][model] and Autohaus["Fuehrerschein"][model] == true)then
		if(getElementData(player,"FuehrerscheinTheorie") == 0)then
			if(isPedInVehicle(player))then exitVehicle(player) end
			infobox(player,loc(player,"Fahrzeugsystem_177"),"error")
			return false
		else
			return true
		end
	elseif(Autohaus["Motorradschein"][model] and Autohaus["Motorradschein"][model] == true)then
		if(getElementData(player,"MotorradscheinTheorie") == 0)then
			if(isPedInVehicle(player))then exitVehicle(player) end
			infobox(player,loc(player,"Fahrzeugsystem_178"),"error")
			return false
		else
			return true
		end
	elseif(Autohaus["Helikopterschein"][model] and Autohaus["Helikopterschein"][model] == true)then
		if(getElementData(player,"HelikopterscheinTheorie") == 0)then
			if(isPedInVehicle(player))then exitVehicle(player) end
			infobox(player,loc(player,"Fahrzeugsystem_179"),"error")
			return false
		else
			return true
		end
	elseif(Autohaus["FlugscheinA"][model] and Autohaus["FlugscheinA"][model] == true)then
		if(getElementData(player,"FlugscheinATheorie") == 0)then
			if(isPedInVehicle(player))then exitVehicle(player) end
			infobox(player,loc(player,"Fahrzeugsystem_180"),"error")
			return false
		else
			return true
		end
	elseif(Autohaus["Bootschein"][model] and Autohaus["Bootschein"][model] == true)then
		if(getElementData(player,"BootscheinTheorie") == 0)then
			if(isPedInVehicle(player))then exitVehicle(player) end
			infobox(player,loc(player,"Fahrzeugsystem_181"),"error")
			return false
		else
			return true
		end
	else
		return true
	end
end

-- [[ FAHRZEUG KAUFEN ]] --

function Autohaus.buy(player,model,price,spawnx,spawny,spawnz,rot,faction,unternehmen,kennzeichen,owner,BusinessID)
	local price = tonumber(price)
	if(BusinessID)then
		if(getPlayerData("business","Databasename","Autohaus"..BusinessID,"Besitzer") == getPlayerName(player))then
			infobox(player,loc(player,"Fahrzeugsystem_182"),"error")
			return false
		end
		local vehicleName = getVehicleNameFromModel(model)
		if(model == 496)then vehicleName = "BlistaCompact" end
		if(model == 521)then vehicleName = "FCR900" end
		if(model == 522)then vehicleName = "NRG500" end
		if(model == 461)then vehicleName = "PCJ600" end
		if(model == 477)then vehicleName = "ZR350" end
		if(model == 506)then vehicleName = "SuperGT" end
		local lagerbestand = getPlayerData("autohaus","Name","Autohaus"..BusinessID,vehicleName)
		local preis = getPlayerData("autohaus","Name","Autohaus"..BusinessID,vehicleName.."Preis")
		if(getPlayerData("business","Databasename","Autohaus"..BusinessID,"Besitzer") ~= "Niemand")then
			if(lagerbestand == 0)then
				infobox(player,loc(player,"Fahrzeugsystem_183"),"error")
				return false
			end
		end
		price = preis
	end
	
	if(hasMoney(player,price))then
		takeMoney(player,price)
		local color = math.random(0,255).."|"..math.random(0,255).."|"..math.random(0,255)
		dbExec(handler,"INSERT INTO vehicles (Model,Spawnx,Spawny,Spawnz,Spawnrotz,Fraktion,Unternehmen,Color,Kennzeichen,Besitzer,Schluessel) VALUES ('"..model.."','"..spawnx.."','"..spawny.."','"..spawnz.."','"..rot.."','"..faction.."','"..unternehmen.."','"..color.."','"..kennzeichen.."','"..owner.."','')")
		loadVehicles(getPlayerName(player))
		VehicleIDForPort = VehicleIDForPort + 1
		setElementDimension(Vehicles[VehicleIDForPort],0)
		if(BusinessID and getPlayerData("business","Databasename","Autohaus"..BusinessID,"Besitzer") ~= "Niemand")then
			local vehicleName = getVehicleNameFromModel(model)
			if(model == 496)then vehicleName = "BlistaCompact" end
			if(model == 521)then vehicleName = "FCR900" end
			if(model == 522)then vehicleName = "NRG500" end
			if(model == 461)then vehicleName = "PCJ600" end
			if(model == 477)then vehicleName = "ZR350" end
			if(model == 506)then vehicleName = "SuperGT" end
			local lagerbestand = getPlayerData("autohaus","Name","Autohaus"..BusinessID,vehicleName)
			dbExec(handler,"UPDATE autohaus SET "..vehicleName.." = '"..(lagerbestand-1).."' WHERE ID = '"..BusinessID.."'")
			addBizKasse("Autohaus"..BusinessID,price)
		end
		outputLog(getPlayerName(client).." hat für $"..price.." ein Fahrzeug mit der Model-ID "..model.." erworben.","Fahrzeugsystem")
		setPlayerAchievement(client,6)
		loadVehicles("Dillimore Devils")
		loadVehicles("Los Aztecas")
		loadVehicles("Mafia")
		loadVehicles("Yakuza")
		loadVehicles("SAPD")
		loadVehicles("F.B.I")
		loadVehicles("Mechaniker")
		loadVehicles("Fahrschule")
		loadVehicles("Reporter")
		loadVehicles("Trucker")
		loadVehicles("Rescue Team")
		warpPedIntoVehicle(client,Vehicles[VehicleIDForPort])
	end
end
addEvent("Autohaus.buy",true)
addEventHandler("Autohaus.buy",root,Autohaus.buy)

-- [[ TESTFAHRT STARTEN ]] --

addEvent("Autohaus.testfahrt",true)
addEventHandler("Autohaus.testfahrt",root,function(model,spawnx,spawny,spawnz,rot)
	if(getElementData(client,"Wanteds") == 0)then
		local dim = getFreeDimension()
		Autohaus.testfahrtVeh[client] = createVehicle(model,spawnx,spawny,spawnz,0,0,rot)
		warpPedIntoVehicle(client,Autohaus.testfahrtVeh[client])
		infobox(client,loc(client,"Fahrzeugsystem_184"),"info")
		setElementDimension(Autohaus.testfahrtVeh[client],dim)
		
		addEventHandler("onVehicleExit",Autohaus.testfahrtVeh[client],function(player)
			destroyElement(source)
			setElementDimension(player,0)
			setElementPosition(player,spawnx,spawny,spawnz)
		end)
	else infobox(client,loc(client,"Fahrzeugsystem_185"),"error")end
end)

-- [[ VEHICLE INFO ]] --

addEvent("Autohaus.vehicleInfo",true)
addEventHandler("Autohaus.vehicleInfo",root,function(BusinessID,model)
	local vehicleName = getVehicleNameFromModel(model)
	if(model == 496)then vehicleName = "BlistaCompact" end
	if(model == 521)then vehicleName = "FCR900" end
	if(model == 522)then vehicleName = "NRG500" end
	if(model == 461)then vehicleName = "PCJ600" end
	if(model == 477)then vehicleName = "ZR350" end
	if(model == 506)then vehicleName = "SuperGT" end
	local lagerbestand = getPlayerData("autohaus","Name","Autohaus"..BusinessID,vehicleName)
	local preis = getPlayerData("autohaus","Name","Autohaus"..BusinessID,vehicleName.."Preis")
	infobox(client,loc(player,"Fahrzeugsystem_186"):format(lagerbestand,preis),"info")
end)

-- [[ WAS PASSIERT, WENN SPIELER STIRBT / QUITTET ]] --

addEventHandler("onPlayerQuit",root,function()
	if(isElement(Autohaus.testfahrtVeh[source]))then
		destroyElement(Autohaus.testfahrtVeh[source])
	end
end)

addEventHandler("onPlayerWasted",root,function()
	if(isElement(Autohaus.testfahrtVeh[source]))then
		destroyElement(Autohaus.testfahrtVeh[source])
	end
end)