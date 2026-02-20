-- [[ BODEN IM INNENRAUM ERSTELLEN ]] --

for i = 1,9 do
	local object = createObject(3055,2214.4985351563,-1143.1350097656,1025.0537109375,90,0,0)
	setElementInterior(object,15)
	setElementDimension(object,i)
end

-- [[ DAS FENSTER ÖFFNEN ]] --

addEvent("Hotel.openWindow",true)
addEventHandler("Hotel.openWindow",root,function()
	local preis = getPlayerData("hotels","ID",getElementDimension(client),"MietePreis")
	triggerClientEvent(client,"Hotel.openWindow",client,preis)
end)

-- [[ ZIMMER MIETEN / AUSCHECKEN ]] --

addEvent("Hotel.server",true)
addEventHandler("Hotel.server",root,function(type)
	if(type == "Zimmer mieten")then
		if(hasPlayerHotelRoom(client) == false)then
			local mieter = getPlayerData("hotels","ID",getElementDimension(client),"Mieter").."|"..getPlayerName(client)
			local mieterAnzahl = getPlayerData("hotels","ID",getElementDimension(client),"MieterAnzahl") + 1
			dbExec(handler,"UPDATE hotels SET Mieter = '"..mieter.."', MieterAnzahl = '"..mieterAnzahl.."' WHERE ID = '"..getElementDimension(client).."'")
			infobox(client,loc(client,"Haussystem_61"),"info")
		else infobox(client,loc(client,"Haussystem_62"),"error")end
	elseif(type == "Auschecken")then
		if(hasPlayerHotelRoom(client))then
			local mieter = getPlayerData("hotels","ID",getElementDimension(client),"Mieter")
			local mieterAnzahl = getPlayerData("hotels","ID",getElementDimension(client),"MieterAnzahl")
			local newMieter = ""
			
			for i = 1,mieterAnzahl do
				local wstring = gettok(mieter,i,string.byte("|"))
				if(wstring ~= getPlayerName(client))then
					newMieter = newMieter..wstring.."|"
				end
			end
			
			dbExec(handler,"UPDATE hotels SET Mieter = '"..newMieter.."', MieterAnzahl = '"..mieterAnzahl - 1 .."' WHERE ID = '"..getElementDimension(client).."'")
			dbExec(handler,"UPDATE accounts SET Spawnx = '-1605.5407714844', Spawny = '773.83746337891', Spawnz = '7.1875', SpawnInterior = '0', SpawnDimension = '0' WHERE Username = '"..getPlayerName(client).."'")
			infobox(client,loc(client,"Haussystem_63"),"info")
		else infobox(client,loc(client,"Haussystem_64"),"error")end
	end
end)

-- [[ HOTEL ALS SPAWNPUNKT WÄHLEN ]] --

addEvent("Hotel.setSpawnpoint",true)
addEventHandler("Hotel.setSpawnpoint",root,function()
	if(hasPlayerHotelRoom(client))then
		local tbl = Hotel[math.random(1,#Hotel)]
		dbExec(handler,"UPDATE accounts SET Spawnx = '"..tbl[1].."', Spawny = '"..tbl[2].."', Spawnz = '"..tbl[3].."', SpawnInterior = '15', SpawnDimension = '"..getElementDimension(client).."' WHERE Username = '"..getPlayerName(client).."'")
		infobox(client,loc(client,"Haussystem_65"),"info")
	end
end)

-- [[ ALLE MIETER LADEN ]] --

function Hotel.getPlayerKeys(id)
	local tbl = {}
	local mieterAnzahl = getPlayerData("hotels","ID",id,"MieterAnzahl")
	local mieter = getPlayerData("hotels","ID",id,"Mieter")
	
	for i = 1,mieterAnzahl do
		local wstring = gettok(mieter,i,string.byte("|"))
		table.insert(tbl,{wstring})
	end
	return tbl
end

-- [[ HAT SPIELER ZIMMER GEMIETET? ]] --

function hasPlayerHotelRoom(player)
	local mieter = Hotel.getPlayerKeys(getElementDimension(player))
	local state = false
	
	for _,v in pairs(mieter)do
		if(v[1] == getPlayerName(player))then
			state = true
			break
		end
	end
	return state
end