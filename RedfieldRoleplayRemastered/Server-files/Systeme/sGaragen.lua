-- [[ GARAGEN ERSTELLEN ]] --

local result = dbPoll(dbQuery(handler,"SELECT * FROM garagen"),-1)

if(#result >= 1)then
	for i,v in pairs(result)do
		Garagen[i] = createObject(10575,v["Spawnx"],v["Spawny"],v["Spawnz"],0,0,v["Rotz"])
		setElementData(Garagen[i],"GaragenBesitzer",v["Besitzer"])
		setElementData(Garagen[i],"GaragenPreis",v["Preis"])
		setElementData(Garagen[i],"GaragenID",i)
		local Colshape = createColCircle(v["Spawnx"],v["Spawny"],5)
		
		addEventHandler("onColShapeHit",Colshape,function(player)
			Garagen.moveObject(player,i,v["Spawnx"],v["Spawny"],v["Spawnz"],"open")
		end)
		
		addEventHandler("onColShapeLeave",Colshape,function(player)
			Garagen.moveObject(player,i,v["Spawnx"],v["Spawny"],v["Spawnz"],"close")
		end)
	end
end

-- [[ TOR ÖFFNEN / SCHLIESSEN ]] --

function Garagen.moveObject(player,id,x,y,z,type)
	if(getElementType(player) == "vehicle")then player = getVehicleOccupant(player,0)end
	if(type == "open")then z = z-5 end
	
	if(getElementData(Garagen[id],"GaragenBesitzer") == getPlayerName(player))then
		moveObject(Garagen[id],5000,x,y,z)
	end
end

-- [[ KAUFEN / VERKAUFEN ]] --

addEvent("Garagen.buy",true)
addEventHandler("Garagen.buy",root,function()
	local ID = tonumber(getElementData(client,"GaragenID"))
	local preis = getElementData(Garagen[ID],"GaragenPreis")
	if(getElementData(Garagen[ID],"GaragenBesitzer") == "Niemand")then
		if(hasMoney(client,preis))then
			dbExec(handler,"UPDATE garagen SET Besitzer = '"..getPlayerName(client).."' WHERE ID = '"..ID.."'")
			infobox(client,loc(client,"Systeme_272"),"info")
			takeMoney(client,preis)
			setElementData(Garagen[ID],"GaragenBesitzer",getPlayerName(client))
			triggerClientEvent(client,"setWindowDatas",client)
			setPlayerAchievement(client,39)
		end
	else
		dbExec(handler,"UPDATE garagen SET Besitzer = 'Niemand' WHERE ID = '"..ID.."'")
		setElementData(client,"Geld",getElementData(client,"Geld")+preis/100*75)
		infobox(client,loc(client,"Systeme_273"),"info")
		setElementData(Garagen[ID],"GaragenBesitzer","Niemand")
	end
end)