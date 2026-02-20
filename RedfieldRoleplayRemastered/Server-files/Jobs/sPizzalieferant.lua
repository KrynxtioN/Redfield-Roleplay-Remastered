-- [[ KÜCHENPICKUPS ERSTELLEN ]] --

for _,v in pairs(Pizzalieferant["Pickups"])do
	local pickup = createPickup(v[1],v[2],v[3],3,1239,50)
	setElementInterior(pickup,v[4])
	setElementDimension(pickup,v[5])
	
	addEventHandler("onPickupHit",pickup,function(player)
		if(getElementData(player,"Job") == "Pizzalieferant")then
			Pizzalieferant.setPlayerPizza(player)
		end
	end)
end

-- [[ FAHRZEUGE ERSTELLEN ]] --

for _,v in pairs(Pizzalieferant["Fahrzeuge"])do
	local vehicle = createVehicle(448,v[1],v[2],v[3],v[4],v[5],v[6])
	setElementFrozen(vehicle,true)
	setElementData(vehicle,"Jobfahrzeuge",true)
	
	addEventHandler("onVehicleEnter",vehicle,function(player)
		if(getElementData(player,"Job") == "Pizzalieferant")then
			if(hasPlayerLicense(player,getElementModel(source)))then
				if(isElement(Pizzalieferant.object[player]) or Pizzalieferant.first[player] == true)then
					if(isTimer(Pizzalieferant.timer[source]))then killTimer(Pizzalieferant.timer[source])end
					setElementFrozen(source,false)
					if(isElement(Pizzalieferant.object[player]))then destroyElement(Pizzalieferant.object[player])end
					if(Pizzalieferant.beladen[player] == true and Pizzalieferant.isMarker[player] ~= true)then
						triggerClientEvent(player,"Pizzalieferant.createMarker",player,"create")
						Pizzalieferant.isMarker[player] = true
					end
					Pizzalieferant.first[player] = true
				else
					exitVehicle(player)
					infobox(player,loc(player,"Jobs_73"),"error")
				end
			end
		else
			exitVehicle(player)
			infobox(player,loc(player,"Jobs_74"),"error")
		end
	end)
	
	addEventHandler("onVehicleExit",vehicle,function(player)
		Pizzalieferant.timer[source] = setTimer(function(source)
			respawnVehicle(source)
			fixVehicle(source)
		end,180000,1,source)
		if(Pizzalieferant.beladen[player] == true)then
			Pizzalieferant.createPizza(player)
		end
		infobox(player,loc(player,"Jobs_75"),"error")
	end)
	
	addEventHandler("onVehicleExplode",vehicle,function()
		if(isTimer(Pizzalieferant.timer[source]))then
			killTimer(Pizzalieferant.timer[source])
		end
	end)
end

-- [[ HAT SPIELER PIZZA? ]] --

function hasPlayerPizza(player)
	if(isElement(Pizzalieferant.object[player]))then
		setElementInterior(Pizzalieferant.object[player],getElementInterior(player))
		setElementDimension(Pizzalieferant.object[player],getElementDimension(player))
	end
end

-- [[ SPIELER EINE PIZZA GEBEN ]] --

function Pizzalieferant.setPlayerPizza(player)
	if(not(isElement(Pizzalieferant.object[player])))then
		Pizzalieferant.createPizza(player)
		infobox(player,loc(player,"Jobs_76"),"info")
		Pizzalieferant.beladen[player] = true
	else infobox(player,loc(player,"Jobs_77"),"error")end
end

-- [[ PIZZA ERSTELLEN ]] --

function Pizzalieferant.createPizza(player)
	Pizzalieferant.object[player] = createObject(1582,0,0,0)
	setElementInterior(Pizzalieferant.object[player],getElementInterior(player))
	setElementDimension(Pizzalieferant.object[player],getElementDimension(player))
	setObjectScale(Pizzalieferant.object[player],0.7)
	attachElements(Pizzalieferant.object[player],player,0,0.4,0.3)
	setElementCollisionsEnabled(Pizzalieferant.object[player],false)
	setPedAnimation(player,"CARRY","crry_prtial",50)
end

-- [[ PIZZA ABGEBEN ]] --

addEvent("Pizzalieferant.server",true)
addEventHandler("Pizzalieferant.server",root,function()
	if(Pizzalieferant.beladen[client] == true)then
		if(not(isPedInVehicle(client)))then
			if(isPedOnGround(client))then
				if(isElement(Pizzalieferant.object[client]))then destroyElement(Pizzalieferant.object[client])end
				local trinkgeld = math.random(3,6)
				giveJobMoney(client,75)
				givePlayerMoney(client,trinkgeld)
				triggerClientEvent(client,"Pizzalieferant.createMarker",client)
				Pizzalieferant.beladen[client] = false
				setPedAnimation(client)
				Pizzalieferant.isMarker[client] = false
				setElementData(client,"PizzalieferantPunkte",getElementData(client,"PizzalieferantPunkte")+1)
			else infobox(client,loc(client,"Jobs_78"),"error")end
		else infobox(client,loc(client,"Jobs_79"),"error")end
	end
end)

-- [[ ELEMENTE ZERSTÖREN ]] --

function Pizzalieferant.destroy(player)
	if(isElement(Pizzalieferant.object[player]))then destroyElement(Pizzalieferant.object[player])end
	triggerClientEvent(player,"Pizzalieferant.createMarker",player)
	Pizzalieferant.beladen[player] = false
	Pizzalieferant.first[player] = false
	Pizzalieferant.isMarker[player] = false
end

-- [[ WAS PASSIERT, WENN SPIELER STIRBT / QUITTET ]] --

addEventHandler("onPlayerQuit",root,function() Pizzalieferant.destroy(source)end)
addEventHandler("onPlayerWasted",root,function() Pizzalieferant.destroy(source)end)