DeagleArena.marker = createMarker(-2171.6999511719,252,34.299999237061,"cylinder",2,255,0,0,100)
DeagleArena.blip = createBlip(-2171.6999511719,252,34.299999237061,18,0,0,0,0,0,0,100)
DeagleArena.players = 0

addEventHandler("onMarkerHit",DeagleArena.marker,function(player)
	if(not(isPedInVehicle(player)))then
		triggerClientEvent(player,"DeagleArena.openWindow",player,DeagleArena.players)
	end
end)

function DeagleArena.spawnPlayer(player)
	DeagleArena.streak[player] = 0
	local rnd = math.random(1,#DeagleArena["Spawnpoints"])
	local tbl = DeagleArena["Spawnpoints"][rnd]
	if(getElementData(player,"Skin"))then model = getElementData(player,"Skin") else model = 0 end
	spawnPlayer(player,tbl[1],tbl[2],tbl[3],tbl[4],model,tbl[5],tbl[6])
	takeAllWeapons(player)
	giveWeapon(player,24,9999,true)
	setPedArmor(player,100)
end

function DeagleArena.join()
	if(getElementData(client,"Lobby") == "Reallife")then
		if(hasMoney(client,50))then
			savePlayerWeaponsTemporaer(client)
			takeMoney(client,50)
		else
			return false
		end
	end
	if(getElementData(client,"Lobby") == "Eingangsbereich")then
		triggerClientEvent(client,"removeCamHandler",client)
		setCameraTarget(client)
	end
	setElementData(client,"LastLobby",getElementData(client,"Lobby"))
	setElementData(client,"Lobby","Deagle-Arena")
	DeagleArena.spawnPlayer(client)
	outputChatBox(loc(client,"Systeme_217"),client,255,255,255,true)
	DeagleArena.players = DeagleArena.players + 1
	DeagleArena.refreshPlayer()
	triggerClientEvent(client,"setWindowDatas",client)
	givePlayerWeaponskills(client)
end
addEvent("DeagleArena.join",true)
addEventHandler("DeagleArena.join",root,DeagleArena.join)

addCommandHandler("leave",function(player)
	if(getElementData(player,"Lobby") == "Deagle-Arena")then
		setElementData(player,"Lobby",getElementData(player,"LastLobby"))
		triggerClientEvent(player,"Information.dxDraw",player,_,"destroy")
		takeAllWeapons(player)
		DeagleArena.players = DeagleArena.players - 1
		if(getElementData(player,"LastLobby") == "Reallife")then
			spawnPlayer(player,-2170.3999023438,248.60000610352,35.299999237061,270,getElementData(player,"Skin"),0,0)
			DeagleArena.refreshPlayer()
			givePlayerWeaponsTemporaer(player)
		elseif(getElementData(player,"DeagleArenaGast") == true)then
			triggerClientEvent(player,"RedfieldLobby.createLobby",player)
			triggerClientEvent(player,"loadAnmeldebereichStuff",player)
		end
		givePlayerWeaponskills(player)
	end
end)

function DeagleArena.refreshPlayer()
	for _,v in pairs(getElementsByType("player"))do
		if(getElementData(v,"Lobby") == "Deagle-Arena")then
			triggerClientEvent(v,"DeagleArena.refreshPlayer",v,DeagleArena.players)
		end
	end
end

function DeagleArena.quitOrDied(player)
	if(getElementData(player,"Lobby") == "Deagle-Arena")then
		triggerClientEvent(player,"Information.dxDraw",player,_,"destroy")
		DeagleArena.players = DeagleArena.players - 1
		DeagleArena.refreshPlayer()
	end
end

addEventHandler("onPlayerQuit",root,function() DeagleArena.quitOrDied(source) end)