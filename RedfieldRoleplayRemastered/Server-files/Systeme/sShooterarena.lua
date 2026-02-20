Shooterarena.joinMarker = createMarker(-2110.3688964844,-444.11819458008,37.559600830078,"cylinder",2,0,150,100,100)
createBlip(-2110.3688964844,-444.11819458008,37.559600830078,33,0,0,0,0,0,0,100)
Shooterarena.players = 0

for _,v in pairs(Shooterarena["Objects"])do
	local object = createObject(v[1],v[2],v[3],v[4],v[5],v[6],v[7])
	setElementDimension(object,Shooterarena.dim)
end

addEventHandler("onMarkerHit",Shooterarena.joinMarker,function(player)
	if(not(isPedInVehicle(player)))then
		triggerClientEvent(player,"Shooterarena.openWindow",player,Shooterarena.players)
	end
end)

function Shooterarena.join(player)
	if(getElementData(player,"Lobby") ~= "Shooter-Arena")then
		if(hasMoney(player,50))then
			takeMoney(player,50)
			setElementData(player,"LastLobby",getElementData(player,"Lobby"))
			setElementData(player,"Lobby","Shooter-Arena")
			outputChatBox(loc(player,"Systeme_278"),player,255,255,255,true)
			outputChatBox(loc(player,"Systeme_279"),player,255,255,255)
			Shooterarena.players = Shooterarena.players + 1
			savePlayerWeaponsTemporaer(player)
			Shooterarena.refreshPlayer()
		end
	end
	local rnd = math.random(1,#Shooterarena["Spawns"])
	local x,y,z = Shooterarena["Spawns"][rnd][1],Shooterarena["Spawns"][rnd][2],Shooterarena["Spawns"][rnd][3]
	local rot = Shooterarena["Spawns"][rnd][4]
	if(isElement(Shooterarena.veh[player]))then destroyElement(Shooterarena.veh[player])end
	Shooterarena.veh[player] = createVehicle(411,x,y,z,0,0,rot)
	setElementDimension(Shooterarena.veh[player],Shooterarena.dim)
	setElementData(Shooterarena.veh[player],"shooterVehicle",true)
	setElementDimension(player,Shooterarena.dim)
	warpPedIntoVehicle(player,Shooterarena.veh[player])
	triggerClientEvent(player,"Shooterarena.join",player,"bind")
	addEventHandler("onVehicleStartExit",Shooterarena.veh[player],function(player)
		destroyElement(source)
		setElementData(player,"Lobby","Reallife")
		triggerClientEvent(player,"Shooterarena.join",player)
		setTimer(function(player)
			if(isElement(player))then
				setElementPosition(player,-2111.5241699219,-441.03668212891,38.734375)
				setPedRotation(player,90)
				setElementDimension(player,0)
				givePlayerWeaponsTemporaer(player)
				triggerClientEvent(player,"Information.dxDraw",player,_,"destroy")
			end
			Shooterarena.players = Shooterarena.players - 1
			Shooterarena.refreshPlayer()
		end,100,1,player)
	end)
	addEventHandler("onVehicleExplode",Shooterarena.veh[player],function()
		destroyElement(source)
	end)
end
addEvent("Shooterarena.join",true)
addEventHandler("Shooterarena.join",root,Shooterarena.join)

function Shooterarena.refreshPlayer()
	for _,v in pairs(getElementsByType("player"))do
		if(getElementData(v,"Lobby") == "Shooter-Arena")then
			triggerClientEvent(v,"Shooterarena.refreshPlayer",v,Shooterarena.players)
		end
	end
end

addEventHandler("onPlayerQuit",root,function()
	if(isElement(Shooterarena.veh[source]))then
		destroyElement(Shooterarena.veh[source])
	end
	if(getElementData(source,"Lobby") == "Shooter-Arena")then
		Shooterarena.players = Shooterarena.players - 1
	end
end)