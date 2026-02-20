-- [[ STARTEN ]] --

function Fahrzeugraub.start()
	if(isElement(Fahrzeugraub.vehicle))then destroyElement(Fahrzeugraub.vehicle)end
	if(isElement(Fahrzeugraub.blip))then destroyElement(Fahrzeugraub.blip)end
	Fahrzeugraub.stufe = 0
	Fahrzeugraub.kaeuferID = nil
	Fahrzeugraub.wait = false
	Fahrzeugraub.faction = nil
	Fahrzeugraub.triggerDestroy()
	
	if(getStateFactionMemberOnline() >= 2)then
		Fahrzeugraub.stufe = 0
		Fahrzeugraub.kaeuferID = nil
		Fahrzeugraub.wait = false
		Fahrzeugraub.faction = nil
		createBreakingNews("Fraktionen_150")
		
		local rnd = math.random(1,#Fahrzeugraub["PosVehicle"])
		local tbl = Fahrzeugraub["PosVehicle"][rnd]
		Fahrzeugraub.vehicle = createVehicle(tbl[1],tbl[2],tbl[3],tbl[4],tbl[5],tbl[6],tbl[7])
		Fahrzeugraub.blip = createBlip(tbl[2],tbl[3],tbl[4],0,2,0,150,0)
		Fahrzeugraub.stufe = Fahrzeugraub.stufe + 1
		Fahrzeugraub.timer = setTimer(function()
			if(not(getVehicleOccupant(Fahrzeugraub.vehicle)))then
				destroyElement(Fahrzeugraub.vehicle)
				destroyElement(Fahrzeugraub.blip)
			end
		end,600000,1)
		
		addEventHandler("onVehicleEnter",Fahrzeugraub.vehicle,function(player)
			if(getPedOccupiedVehicleSeat(player) == 0)then
				if(isTimer(Fahrzeugraub.timer))then killTimer(Fahrzeugraub.timer)end
				if(Fahrzeugraub.wait == false)then
					if(isEvil(player))then
						if(isElement(Fahrzeugraub.blip))then destroyElement(Fahrzeugraub.blip)end
						if(Fahrzeugraub.stufe == 1)then
							triggerClientEvent(player,"Fahrzeugraub.stufe1",player,"create")
						elseif(Fahrzeugraub.stufe == 2)then
							triggerClientEvent(player,"Fahrzeugraub.stufe2",player,Fahrzeugraub.kaeuferID)
						end
					end
				end
			end
		end)
		
		addEventHandler("onVehicleExit",Fahrzeugraub.vehicle,function(player)
			triggerClientEvent(player,"Fahrzeugraub.stufe1",player)
		end)
		
		addEventHandler("onVehicleExplode",Fahrzeugraub.vehicle,function()
			Fahrzeugraub.triggerDestroy()
		end)
	end
end
setTimer(Fahrzeugraub.start,3600000,1)

-- [[ ELEMENTE ZERSTÖREN ]] --

function Fahrzeugraub.triggerDestroy()
	for _,v in pairs(getElementsByType("player"))do
		triggerClientEvent(v,"Fahrzeugraub.ped",v)
		triggerClientEvent(v,"Fahrzeugraub.stufe1",v)
		triggerClientEvent(v,"Fahrzeugraub.stufe2",v)
	end
	if(isTimer(Fahrzeugraub.kaeuferTimer))then killTimer(Fahrzeugraub.kaeuferTimer)end
end

-- [[ GARAGE ]] --

addEvent("Fahrzeugraub.garage",true)
addEventHandler("Fahrzeugraub.garage",root,function()
	if(isPedInVehicle(client))then
		if(getPedOccupiedVehicle(client) == Fahrzeugraub.vehicle)then
			setElementFrozen(Fahrzeugraub.vehicle,true)
			Fahrzeugraub.kaeuferTimer = setTimer(Fahrzeugraub.kaeufer,300000,1)
			Fahrzeugraub.wait = true
			Fahrzeugraub.faction = getElementData(client,"Fraktion")
			infobox(client,loc(client,"Fraktionen_151"),"error")
		end
	end
end)

-- [[ ABGABE ]] --

addEvent("Fahrzeugraub.abgabe",true)
addEventHandler("Fahrzeugraub.abgabe",root,function()
	if(isPedInVehicle(client))then
		if(getPedOccupiedVehicle(client) == Fahrzeugraub.vehicle)then
			destroyElement(Fahrzeugraub.vehicle)
			Fahrzeugraub.triggerDestroy()
			addToLager(getElementData(client,"Fraktion"),"Geld",getAktionsMoney(7500,"Gang"),"fraktionslager")
			infobox(client,loc(client,"Fraktionen_152"),"info")
		end
	end
end)

function Fahrzeugraub.kaeufer()
	local kaeuferID = math.random(1,#Fahrzeugraub["PosPed"])
	Fahrzeugraub.kaeuferID = kaeuferID
	Fahrzeugraub.stufe = Fahrzeugraub.stufe + 1
	setElementFrozen(Fahrzeugraub.vehicle,false)
	Fahrzeugraub.wait = false
	for _,v in pairs(getElementsByType("player"))do
		if(getElementData(v,"loggedin") == 1)then
			if(getElementData(v,"Fraktion") == Fahrzeugraub.faction)then
				outputChatBox(loc(v,"Fraktionen_153"),v,125,0,0)
			end
		end
	end
	
	for _,v in pairs(getElementsByType("player"))do
		if(isPedInVehicle(v) and getPedOccupiedVehicleSeat(v) == 0)then
			if(getPedOccupiedVehicle(v) == Fahrzeugraub.vehicle)then
				triggerClientEvent(v,"Fahrzeugraub.stufe2",v,Fahrzeugraub.kaeuferID)
			end
		end
		triggerClientEvent(v,"Fahrzeugraub.ped",v,Fahrzeugraub.kaeuferID)
	end
end