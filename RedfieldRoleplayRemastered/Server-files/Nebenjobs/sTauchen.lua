-- [[ WASSERFAHRZEUGE ERSTELLEN ]] --

local result = dbPoll(dbQuery(handler,"SELECT * FROM watervehicles"),-1)

if(#result >= 1)then
	for _,v in pairs(result)do
		local vehicle = createVehicle(v["Model"],v["Spawnx"],v["Spawny"],v["Spawnz"],0,0,v["Rotz"],"Tauchen")
		setElementData(vehicle,"TaucherID",v["ID"])
		setElementData(vehicle,"TaucherLevel",v["Level"])
	end
end

-- [[ KISTEN ERSTELLEN ]] --

for _,v in pairs(Tauchen["Kisten"])do
	local object = createObject(v[1],v[2],v[3],v[4],v[5],v[6],v[7])
	setElementData(object,"Taucherkiste",true)
end

-- [[ ERFAHRUNGSPUNKTE GEBEN ]] --

function Tauchen.givePoints(player,points)
	local level = getElementData(player,"TaucherLevel")+1
	setElementData(player,"TaucherPoints",getElementData(player,"TaucherPoints")+points)
	local nextLevel = Tauchen.needExp*level
	if(getElementData(player,"TaucherPoints") >= nextLevel)then
		setElementData(player,"TaucherPoints",0)
		setElementData(player,"TaucherLevel",getElementData(player,"TaucherLevel")+1)
	end
end

-- [[ TAUCHERANZUG BENUTZEN ]] --

function Tauchen.useSuit(player)
	if(not(isTimer(Tauchen.timer[player])))then
		if(isElementInWater(player))then
			Tauchen.timer[player] = setTimer(function(player)
				triggerClientEvent(player,"Tauchen.setPedOxygenLevel",player)
			end,1000,0,player)
			triggerClientEvent(player,"Tauchen.dxDraw",player)
			infobox(player,loc(player,"Nebenjobs_37"),"info")
		else infobox(player,loc(player,"Nebenjobs_38"),"error")end
	else
		killTimer(Tauchen.timer[player])
		triggerClientEvent(player,"Tauchen.dxDraw",player)
		infobox(player,loc(player,"Nebenjobs_39"),"error")
	end
end
addEvent("Tauchen.useSuit",true)
addEventHandler("Tauchen.useSuit",root,Tauchen.useSuit)

-- [[ ITEM GEBEN ]] --

function Tauchen.setItem(player)
	if(math.random(1,150) > 5)then
		local item = math.random(1,#Tauchen["Items"])
		setElementData(player,Tauchen["Items"][item][1],getElementData(player,Tauchen["Items"][item][1])+Tauchen["Items"][item][2])
		infobox(player,loc(player,"Nebenjobs_40"):format(Tauchen["Items"][item][2],Tauchen["Items"][item][1]),"info")
	else
		Sammelkarten.addKarte(player,math.random(1,25))
	end
end

-- [[ BEENDEN ]] --

function Tauchen.destroy(player)
	if(isTimer(Tauchen.timer[player]))then
		killTimer(Tauchen.timer[player])
		triggerClientEvent(player,"Tauchen.dxDraw",player)
	end
end

-- [[ WAS PASSIERT, WENN SPIELER STIRBT / QUITTET ]] --

addEventHandler("onPlayerQuit",root,function() Tauchen.destroy(source) end)
addEventHandler("onPlayerWasted",root,function() Tauchen.destroy(source) end)