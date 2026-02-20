-- [[ WOHNWAGEN LADEN ]] --

function Wohnwagen.load()
	local result = dbPoll(dbQuery(handler,"SELECT * FROM wohnwagen"),-1)
	if(#result >= 1)then
		for _,v in pairs(result)do
			local ID = v["ID"]
			Wohnwagen.veh[v["ID"]] = createObject(3175,v["Spawnx"],v["Spawny"],v["Spawnz"],0,0,v["Spawnrotz"])
			setElementData(Wohnwagen.veh[v["ID"]],"WohnwagenBesitzer",v["Besitzer"])
			setElementData(Wohnwagen.veh[v["ID"]],"Angekuppelt",false)
			setElementData(Wohnwagen.veh[v["ID"]],"WohnwagenID",v["ID"])
			Wohnwagen.marker[v["ID"]] = createMarker(v["Spawnx"],v["Spawny"],v["Spawnz"],"cylinder",3,255,0,0,0)
			setElementData(Wohnwagen.marker[v["ID"]],"WohnwagenID",v["ID"])
			setElementData(Wohnwagen.marker[v["ID"]],"WohnwagenBesitzer",v["Besitzer"])
			attachElements(Wohnwagen.marker[v["ID"]],Wohnwagen.veh[v["ID"]],-2,1,0.5)
			Wohnwagen.pickup[v["ID"]] = createPickup(2.0622541904449,-3.0843980312347,999.42840576172,3,1318,50)
			setElementInterior(Wohnwagen.pickup[v["ID"]],2)
			setElementDimension(Wohnwagen.pickup[v["ID"]],v["ID"])
			
			for _,v in pairs(Wohnwagen["Objects"])do
				local object = createObject(v[1],v[2],v[3],v[4],v[5],v[6],v[7])
				setElementDimension(object,ID)
				setElementInterior(object,2)
				setElementAlpha(object,0)
			end
			
			addEventHandler("onMarkerHit",Wohnwagen.marker[v["ID"]],function(player)
				if(getElementType(player) == "player")then
					if(getElementDimension(player) == getElementDimension(source))then
						if(not(isPedInVehicle(player)) and isPedOnGround(player))then
							local ID = getElementData(source,"WohnwagenID")
							setElementData(player,"WohnwagenID",ID)
							setElementData(player,"WohnwagenBesitzer",getElementData(source,"WohnwagenBesitzer"))
							triggerClientEvent(player,"Wohnwagen.openWindow",player,getElementData(source,"WohnwagenBesitzer"))
						end
					end
				end
			end)
			
			addEventHandler("onPickupHit",Wohnwagen.pickup[v["ID"]],function(player)
				if(getElementDimension(player) == getElementDimension(source))then
					triggerClientEvent(player,"Wohnwagen.verwaltung",player)
				end
			end)
		end
	end
end
Wohnwagen.load()

-- [[ IM WOHNWAGEN SPAWNEN ]] --

addEvent("Wohnwagen.changeSpawn",true)
addEventHandler("Wohnwagen.changeSpawn",root,function()
	if(getElementData(Wohnwagen.marker[getElementDimension(client)],"WohnwagenBesitzer") == getPlayerName(client))then
		dbExec(handler,"UPDATE accounts SET Spawnx = '2.0622541904449', Spawny = '-3.0843980312347', Spawnz = '999.42840576172', Spawnrotz = '270', SpawnDimension = '"..getElementDimension(client).."', SpawnInterior = '2' WHERE Username = '"..getPlayerName(client).."'")
		infobox(client,loc(client,"Fahrzeugsystem_140"),"info")
	else infobox(client,loc(client,"Fahrzeugsystem_141"),"error")end
end)

-- [[ WOHNWAGEN BETRETEN / VERLASSEN ]] --

addEvent("Wohnwagen.betreten",true)
addEventHandler("Wohnwagen.betreten",root,function()
	local ID = getElementData(client,"WohnwagenID")
	local Schloss = getPlayerData("wohnwagen","ID",ID,"Schloss")
	if(Schloss == "Aufgeschlossen")then
		if(getElementData(Wohnwagen.veh[ID],"WohnwagenBesitzer") ~= getPlayerName(client))then
			infobox(client,loc(client,"Fahrzeugsystem_142"),"error")
			return false
		end
	end
	triggerClientEvent(client,"setWindowDatas",client)
	setElementPosition(client,2.0622541904449,-3.0843980312347,999.42840576172)
	setElementInterior(client,2)
	setElementDimension(client,ID)
	setPedRotation(client,270)
end)

addEvent("Wohnwagen.verlassen",true)
addEventHandler("Wohnwagen.verlassen",root,function()
	local ID = getElementDimension(client)
	local x,y,z = getElementPosition(Wohnwagen.marker[ID])
	triggerClientEvent(client,"setWindowDatas",client)
	setElementPosition(client,x,y,z)
	setElementInterior(client,0)
	setElementDimension(client,0)
end)

-- [[ AUF- / ABSCHLIESSEN ]] --

addEvent("Wohnwagen.lock",true)
addEventHandler("Wohnwagen.lock",root,function()
	local ID = getElementData(client,"WohnwagenID")
	if(getElementData(Wohnwagen.veh[ID],"WohnwagenBesitzer") == getPlayerName(client))then
		local Schloss = getPlayerData("wohnwagen","ID",ID,"Schloss")
		if(Schloss == "Aufgeschlossen")then
			dbExec(handler,"UPDATE wohnwagen SET Schloss = 'Abgeschlossen' WHERE ID = '"..ID.."'")
			infobox(client,loc(client,"Fahrzeugsystem_143"),"error")
		else
			dbExec(handler,"UPDATE wohnwagen SET Schloss = 'Aufgeschlossen' WHERE ID = '"..ID.."'")
			infobox(client,loc(client,"Fahrzeugsystem_144"),"info")
		end
	else infobox(client,loc(client,"Fahrzeugsystem_145"),"error")end
end)

-- [[ WOHNWAGEN KAUFEN]] --

addEvent("Wohnwagen.buy",true)
addEventHandler("Wohnwagen.buy",root,function()
	if(hasMoney(client,175000))then
		takeMoney(client,175000)
		dbExec(handler,"INSERT INTO wohnwagen (Spawnx,Spawny,Spawnz,Spawnrotz,Besitzer,Schloss) VALUES ('-903.84497070313','-494.67691040039','24.960899353027','0','"..getPlayerName(client).."','Aufgeschlossen')")
		Wohnwagen.load()
		infobox(client,loc(client,"Fahrzeugsystem_146"),"info")
		triggerClientEvent(client,"setWindowDatas",client)
		setPlayerAchievement(client,19)
		outputLog(getPlayerName(client).." hat sich einen Wohnwagen gekauft.","Fahrzeugsystem")
	end
end)

-- [[ WOHNWAGEN VERKAUFEN ]] --

addEvent("Wohnwagen.sell",true)
addEventHandler("Wohnwagen.sell",root,function()
	local ID = getElementData(client,"WohnwagenID")
	if(getElementData(Wohnwagen.veh[ID],"WohnwagenBesitzer") == getPlayerName(client))then
		local money = 175000/100*75
		dbExec(handler,"DELETE FROM wohnwagen WHERE ID = '"..ID.."'")
		infobox(client,loc(client,"Fahrzeugsystem_147"):format(money),"info")
		setElementData(client,"Geld",getElementData(client,"Geld")+money)
		destroyElement(Wohnwagen.veh[ID])
		triggerClientEvent(client,"setWindowDatas",client)
		outputLog(getPlayerName(client).." hat seinen Wohnwagen verkauft.","Fahrzeugsystem")
	else infobox(client,loc(client,"Fahrzeugsystem_148"),"error")end
end)

-- [[ WOHNWAGENPOSITION ÄNDERN ]] --

function Wohnwagen.runter(player)
	local ID = getElementData(player,"WohnwagenID")
	local x,y,z = getElementPosition(Wohnwagen.veh[ID])
	if(x and y and z)then
		setElementPosition(Wohnwagen.veh[ID],x,y,z-0.1)
	end
end

function Wohnwagen.hoch(player)
	local ID = getElementData(player,"WohnwagenID")
	local x,y,z = getElementPosition(Wohnwagen.veh[ID])
	if(x and y and z)then
		setElementPosition(Wohnwagen.veh[ID],x,y,z+0.1)
	end
end

function Wohnwagen.savePosition(player)
	local ID = getElementData(player,"WohnwagenID")
	local x,y,z = getElementPosition(Wohnwagen.veh[ID])
	local rx,ry,rz = getElementRotation(Wohnwagen.veh[ID])
	if(ID)then
		dbExec(handler,"UPDATE wohnwagen SET Spawnx = '"..x.."', Spawny = '"..y.."', Spawnz = '"..z.."', Spawnrotz = '"..rz.."' WHERE ID = '"..ID.."'")
		infobox(player,loc(player,"Fahrzeugsystem_149"),"info")
		unbindKey(player,"mouse_wheel_down","down",Wohnwagen.runter)
		unbindKey(player,"mouse_wheel_up","down",Wohnwagen.hoch)
		unbindKey(player,"j","down",Wohnwagen.savePosition)
	end
end

-- [[ WAS PASSIERT, WENN SPIELER STIRBT ]] --

addEventHandler("onPlayerWasted",root,function()
	unbindKey(source,"mouse_wheel_down","down",Wohnwagen.runter)
	unbindKey(source,"mouse_wheel_up","down",Wohnwagen.hoch)
	unbindKey(source,"j","down",Wohnwagen.savePosition)
end)