-- [[ HÄUSER ERSTELLEN ]] --

function Haussystem.load()
	local result = dbPoll(dbQuery(handler,"SELECT * FROM houses"),-1)
	if(#result >= 1)then
		for _,v in pairs(result)do
			if(not(isElement(Haussystem.pickups[v["ID"]])))then
				if(v["Besitzer"] == "Niemand")then ID = 1273 else ID = 1272 end
				Haussystem.pickups[v["ID"]] = createPickup(v["Spawnx"],v["Spawny"],v["Spawnz"],3,ID,50)
				setElementData(Haussystem.pickups[v["ID"]],"HouseID",v["ID"])
				Haussystem[v["ID"]] = {v["Preis"],v["Besitzer"],v["Spawnx"],v["Spawny"],v["Spawnz"],v["Abgeschlossen"],v["Interior"],v["Level"],v["Mietpreis"],v["Text"]}
				setElementData(Haussystem.pickups[v["ID"]],"Klingeln",true)
				
				local int = Haussystem["Interiors"][Haussystem[v["ID"]][7]]
				Haussystem.outPickup[v["ID"]] = createPickup(int[1],int[2],int[3],3,1318,50)
				setElementInterior(Haussystem.outPickup[v["ID"]],int[4])
				setElementDimension(Haussystem.outPickup[v["ID"]],v["ID"])
				
				addEventHandler("onPickupHit",Haussystem.pickups[v["ID"]],function(player)
					if(not(isPedInVehicle(player)))then
						if(isHalloween())then
							infobox(player,loc(player,"Haussystem_36"),"owncolor",250,100,0)
						else
							infobox(player,loc(player,"Haussystem_37"),"info")
						end
						setElementData(player,"HouseID",getElementData(source,"HouseID"))
					end
				end)
				
				addEventHandler("onPickupHit",Haussystem.outPickup[v["ID"]],function(player)
					setElementPosition(player,v["Spawnx"],v["Spawny"],v["Spawnz"])
					setElementInterior(player,0)
					setElementDimension(player,0)
					unbindKey(player,"f7","down",Haussystem.verwaltung)
					setElementData(player,"InHouse",false)
				end)
			end
		end
	end
end
Haussystem.load()

-- [[ DAS FENSTER ÖFFNEN ]] --

function Haussystem.openWindow(player)
	local ID = getElementData(player,"HouseID")
	if(ID)then
		local x,y,z = Haussystem[ID][3],Haussystem[ID][4],Haussystem[ID][5]
		if(getDistanceBetweenPoints3D(x,y,z,getElementPosition(player)) <= 5)then
			local datas = {Haussystem[ID][1],Haussystem[ID][2],Haussystem[ID][8],Haussystem[ID][9]}
			triggerClientEvent(player,"Haussystem.openWindow",player,datas)
		end
	end
end

-- [[ KAUFEN / VERKAUFEN ]] --

addEvent("Haussystem.server",true)
addEventHandler("Haussystem.server",root,function(type)
	local ID = getElementData(client,"HouseID")
	local x,y,z = Haussystem[ID][3],Haussystem[ID][4],Haussystem[ID][5]
	if(getDistanceBetweenPoints3D(x,y,z,getElementPosition(client)) <= 5)then
		local preis = Haussystem[ID][1]
		local owner = Haussystem[ID][2]
		if(type == "Kaufen")then
			if(hasMoney(client,preis))then
				if(owner == "Niemand")then
					takeMoney(client,preis)
					Haussystem[ID][2] = getPlayerName(client)
					dbExec(handler,"UPDATE houses SET Besitzer = '"..getPlayerName(client).."' WHERE ID = '"..ID.."'")
					infobox(client,loc(client,"Haussystem_38"),"info")
					triggerClientEvent(client,"setWindowDatas",client)
					setPlayerStatus(client,7)
					setPlayerAchievement(client,5)
					Haussystem.reload(ID)
				else infobox(client,loc(client,"Haussystem_39"),"error")end
			end
		else
			if(owner == getPlayerName(client))then
				setElementData(client,"Geld",getElementData(client,"Geld")+preis/100*75)
				Haussystem[ID][2] = "Niemand"
				dbExec(handler,"UPDATE houses SET Besitzer = 'Niemand' WHERE ID = '"..ID.."'")
				infobox(client,loc(client,"Haussystem_40"),"info")
				triggerClientEvent(client,"setWindowDatas",client)
				Haussystem.reload(ID)
			else infobox(client,loc(client,"Haussystem_41"),"error")end
		end
	end
end)

function Haussystem.reload(ID)
	if(isElement(Haussystem.pickups[ID]))then
		destroyElement(Haussystem.pickups[ID])
		Haussystem.load()
	end
end

-- [[ HAUS BETRETEN ]] --

addEvent("Haussystem.in",true)
addEventHandler("Haussystem.in",root,function()
	local ID = getElementData(client,"HouseID")
	local x,y,z = Haussystem[ID][3],Haussystem[ID][4],Haussystem[ID][5]
	if(getDistanceBetweenPoints3D(x,y,z,getElementPosition(client)) <= 5)then
		if(Haussystem[ID][6] == "Abgeschlossen")then
			if(isMieter(client,ID) == false and Haussystem[ID][2] ~= getPlayerName(client))then
				infobox(client,loc(client,"Haussystem_42"),"error")
				return false
			end
		end
		
		local int = Haussystem["Interiors"][Haussystem[ID][7]]
		setElementPosition(client,int[1],int[2],int[3])
		setElementInterior(client,int[4])
		setElementDimension(client,ID)	
		bindKey(client,"f7","down",Haussystem.verwaltung)
		triggerClientEvent(client,"setWindowDatas",client)
		setElementData(client,"InHouse",true)
	end
end)

-- [[ AUF- / ABSCHLIESSEN ]] --

addEvent("Haussystem.lock",true)
addEventHandler("Haussystem.lock",root,function()
	local ID = getElementData(client,"HouseID")
	if(Haussystem[ID][2] == getPlayerName(client) or isMieter(client,ID) == true)then
		if(Haussystem[ID][6] == "Abgeschlossen")then
			Haussystem[ID][6] = "Aufgeschlossen"
			infobox(client,loc(client,"Haussystem_43"),"info")
		else
			Haussystem[ID][6] = "Abgeschlossen"
			infobox(client,loc(client,"Haussystem_44"),"error")
		end
	else infobox(client,loc(client,"Haussystem_45"),"error")end
end)

-- [[ HAUS UPDATEN ]] --

addEvent("Haussystem.update",true)
addEventHandler("Haussystem.update",root,function()
	local ID = getElementData(client,"HouseID")
	if(Haussystem[ID][2] == getPlayerName(client))then
		local level = Haussystem[ID][8]
		if(level < 4)then
			local newLevel = level+1
			local preis = newLevel*250000
			if(hasMoney(client,preis))then
				takeMoney(client,preis)
				Haussystem[ID][8] = newLevel
				dbExec(handler,"UPDATE houses SET Level = '"..newLevel.."' WHERE ID = '"..ID.."'")
				Haussystem[ID][7] = Haussystem["Level"][Haussystem[ID][8]][math.random(1,#Haussystem["Level"][Haussystem[ID][8]])]
				local int = Haussystem["Interiors"][Haussystem[ID][7]]
				setElementPosition(client,int[1],int[2],int[3])
				setElementInterior(client,int[4])
				setElementDimension(client,ID)	
				setElementPosition(Haussystem.outPickup[ID],int[1],int[2],int[3])
				setElementInterior(Haussystem.outPickup[ID],int[4])
				setElementDimension(Haussystem.outPickup[ID],ID)
			end
		else infobox(client,loc(client,"Haussystem_46"),"error")end
	end
end)

-- [[ EIN- / AUSMIETEN ]] --

addEvent("Haussystem.mieten",true)
addEventHandler("Haussystem.mieten",root,function()
	local text = ""
	local ID = getElementData(client,"HouseID")
	local x,y,z = Haussystem[ID][3],Haussystem[ID][4],Haussystem[ID][5]
	if(getDistanceBetweenPoints3D(x,y,z,getElementPosition(client)) <= 5)then
		if(Haussystem[ID][2] ~= "Niemand")then
			if(Haussystem[ID][2] ~= getPlayerName(client))then
				if(Haussystem[ID][9] >= 1)then
					if(isMieter(client,ID) == true)then
						for _,v in pairs(getMieter(ID))do
							if(v ~= getPlayerName(client))then
								text = text..v.."|"
							end
						end
						infobox(client,loc(client,"Haussystem_47"),"error")
						counter = getPlayerData("houses","ID",ID,"MieterAnzahl") - 1
					else
						counter = getPlayerData("houses","ID",ID,"MieterAnzahl") + 1
						text = getPlayerData("houses","ID",ID,"Mieter")..getPlayerName(client).."|"
						infobox(client,loc(client,"Haussystem_48"),"info")
					end
					dbExec(handler,"UPDATE houses SET Mieter = '"..text.."', MieterAnzahl = '"..counter.."' WHERE ID = '"..ID.."'")
				else infobox(client,loc(client,"Haussystem_49"),"error")end
			else infobox(client,loc(client,"Haussystem_50"),"error")end
		else infobox(client,loc(client,"Haussystem_51"),"error")end
	end
end)

-- [[ KLINGELN ]] --

function Haussystem.klingeln(player)
	local ID = getElementData(player,"HouseID")
	if(ID)then
		if(getElementData(Haussystem.pickups[ID],"Klingeln") == true)then
			local x,y,z = Haussystem[ID][3],Haussystem[ID][4],Haussystem[ID][5]
			if(getDistanceBetweenPoints3D(x,y,z,getElementPosition(player)) <= 5)then
				if(isHalloween())then
					local rnd = math.random(1,100)
					if(rnd >= 1 and rnd <= 45)then
						outputChatBox(Halloween["Suessigkeiten"][1][math.random(1,#Halloween["Suessigkeiten"][1])],player,250,100,0)
					elseif(rnd >= 51 and rnd <= 99)then
						local rnd = math.random(1,#Halloween["Suessigkeiten"][2])
						outputChatBox(Halloween["Suessigkeiten"][2][rnd][1],player,250,100,0)
						setElementData(player,Halloween["Suessigkeiten"][2][rnd][2],getElementData(player,Halloween["Suessigkeiten"][2][rnd][2])+Halloween["Suessigkeiten"][2][rnd][3])
					elseif(rnd == 100)then
					
					end
					setElementData(Haussystem.pickups[ID],"Klingeln",false)
					setTimer(function(house)
						setElementData(Haussystem.pickups[ID],"Klingeln",true)
					end,3600000,1,Haussystem.pickups[ID])
				end
			end
		else infobox(player,loc(player,"Haussystem_52"),"owncolor",250,100,0)end
	end
end

-- [[ MIETE ÄNDERN ]] --

addEvent("Haussystem.changeMiete",true)
addEventHandler("Haussystem.changeMiete",root,function(miete)
	local miete = tonumber(miete)
	local ID = getElementData(client,"HouseID")
	if(Haussystem[ID][2] == getPlayerName(client))then
		if(miete >= 0 and miete <= 500)then
			dbExec(handler,"UPDATE houses SET Mietpreis = '"..miete.."' WHERE ID = '"..ID.."'")
			infobox(client,loc(client,"Haussystem_53"):format(miete),"info")
			Haussystem[ID][9] = miete
			triggerClientEvent(client,"refreshHouseMiete",client,Haussystem[ID][8],miete)
		else infobox(client,loc(client,"Haussystem_54"),"error")end
	else infobox(client,loc(client,"Haussystem_55"),"error")end
end)

-- [[ HAUSVERWALTUNG ]] --

function Haussystem.verwaltung(player)
	local ID = getElementData(player,"HouseID")
	if(Haussystem[ID][2] == getPlayerName(player) or isMieter(player,ID) == true)then
		local datas = {Haussystem[ID][8],Haussystem[ID][9],Haussystem[ID][10],Haussystem[ID][2]}
		triggerClientEvent(player,"Haussystem.verwaltung",player,datas,getMieter(ID))
	end
end

addEvent("Haussystem.kickMieter",true)
addEventHandler("Haussystem.kickMieter",root,function(mieter)
	local text = "|"
	local ID = getElementData(client,"HouseID")
	if(Haussystem[ID][2] == getPlayerName(client))then
		local counter = 0
		for _,v in pairs(getMieter(ID))do
			if(v ~= mieter)then
				counter = counter + 1
				text = text..v.."|"
			end
		end
		dbExec(handler,"UPDATE houses SET Mieter = '"..text.."', MieterAnzahl = '"..counter.."' WHERE ID = '"..ID.."'")
		infobox(client,loc(client,"Haussystem_56"),"info")
	else infobox(client,loc(client,"Haussystem_57"),"error")end
end)

addEvent("Haussystem.saveText",true)
addEventHandler("Haussystem.saveText",root,function(text)
	dbExec(handler,"UPDATE houses SET Text = '"..text.."' WHERE ID = '"..getElementData(client,"HouseID").."'")
	infobox(client,loc(client,"Haussystem_58"),"info")
end)

-- [[ IST SPIELER MIETER? ]] --

function isMieter(player,id)
	local state = false
	
	for _,v in pairs(getMieter(id))do
		if(v == getPlayerName(player))then
			state = true
			break
		end
	end
	return state
end

-- [[ ALLE MIETER LADEN ]] --

function getMieter(id)
	local tbl = {}
	local Mieter = getPlayerData("houses","ID",id,"Mieter")
	local MieterAnzahl = getPlayerData("houses","ID",id,"MieterAnzahl")
	for i = 1,MieterAnzahl do
		local mstring = gettok(Mieter,i,string.byte("|"))
		if(mstring and #mstring >= 1)then
			table.insert(tbl,mstring)
		end
	end
	return tbl
end

-- [[ NEUES HAUS ERSTELLEN ]] --

addCommandHandler("createhouse",function(player,cmd,preis)
	if(preis)then
		local rnd = math.random(1,#Haussystem["Level"][1])
		local x,y,z = getElementPosition(player)
		dbExec(handler,"INSERT INTO houses (Besitzer,Preis,Spawnx,Spawny,Spawnz,Interior,Mieter,Abgeschlossen,MieterAnzahl,Text) VALUES ('Niemand','"..preis.."','"..x.."','"..y.."','"..z.."','"..rnd.."','','Abgeschlossen','0','Keine Angaben.')")
		Haussystem.load()
	else infobox(player,loc(player,"Haussystem_59"),"error")end
end)

-- [[ SPAWNPUNKT ZU SEINEM HAUS ÄNDERN ]] --

addEvent("Haussystem.spawnInHouse",true)
addEventHandler("Haussystem.spawnInHouse",root,function()
	local ID = getElementData(client,"HouseID")
	if(Haussystem[ID][2] == getPlayerName(client) or isMieter(client,ID) == true)then
		local x,y,z = getElementPosition(client)
		dbExec(handler,"UPDATE accounts SET Spawnx = '"..x.."', Spawny = '"..y.."', Spawnz = '"..z.."', SpawnInterior = '"..getElementInterior(client).."', SpawnDimension = '"..getElementDimension(client).."' WHERE Username = '"..getPlayerName(client).."'")
		infobox(client,loc(client,"Haussystem_60"),"info")
	end
end)