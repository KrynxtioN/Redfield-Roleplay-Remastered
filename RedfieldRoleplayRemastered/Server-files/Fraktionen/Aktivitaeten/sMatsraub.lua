-- [[ ELEMENTE ERSTELLEN ]] --

Matsraub.pickupInLager = createPickup(294.10137939453,-102.99792480469,1001.5229492188,3,1318,50)
setElementInterior(Matsraub.pickupInLager,6)
setElementDimension(Matsraub.pickupInLager,98)
Matsraub.pickupOutLager = createPickup(293.20373535156,-76.850143432617,1006.4665527344,3,1318,50)
setElementInterior(Matsraub.pickupOutLager,6)
setElementDimension(Matsraub.pickupOutLager,98)

Matsraub.keypad = createObject(2886,293.10000610352,-102.59999847412,1002.0999755859,0,0,0)
setElementInterior(Matsraub.keypad,6)
setElementDimension(Matsraub.keypad,98)

-- [[ SPIELER TELEPORTIEREN ]] --

addEventHandler("onPickupHit",Matsraub.pickupInLager,function(player)
	if(Matsraub.state == true)then
		fadeElementInterior(player,6,98,293.29998779297,-74.5,1006.4000244141,0)
	else
		if(getElementData(player,"MatsraubKey") == true)then
			infobox(player,loc(player,"Fraktionen_170"),"error")
		else infobox(player,loc(player,"Fraktionen_171"),"error")end
	end
end)

addEventHandler("onPickupHit",Matsraub.pickupOutLager,function(player)
	fadeElementInterior(player,6,98,294.29998779297,-105.09999847412,1001.5,180)
end)

-- [[ KEYPAD ANKLICKEN ]] --

addEventHandler("onElementClicked",Matsraub.keypad,function(button,state,player)
	if(button == "left" and state == "down")then
		if(getElementData(player,"MatsraubKey") == true)then
			Matsraub.state = true
			infobox(player,loc(player,"Fraktionen_172"),"info")
			setElementData(player,"MatsraubKey",nil)
			createBreakingNews("Fraktionen_173")
		else infobox(player,loc(player,"Fraktionen_174"),"error")end
	end
end)

-- [[ WENN PED STIRBT ]] --

function Matsraub.pedWasted(_,player)
	if(isEvil(player))then
		if(getStateFactionMemberOnline() >= 0)then
			if(isAktionPause(player))then
				if(isAktionAktiv(player))then
					local x,y,z = getElementPosition(Matsraub.ped)
					setTimer(function()
						Matsraub.key = createObject(1581,x,y,z,0,0,0)
						setElementData(Matsraub.key,"Matsraub",true)
						setElementInterior(Matsraub.key,6)
						setElementDimension(Matsraub.key,98)

						Matsraub.refreshTimer = setTimer(function()
							Matsraub.refresh()
						end,1800000,1)
					end,500,1)
				else Matsraub.createPed()end
			else Matsraub.createPed()end
		else
			Matsraub.createPed()
			infobox(player,loc(player,"Fraktionen_175"),"error")
		end
	else Matsraub.createPed()end
end

-- [[ KEYCARD EINSAMMELN ]] --

function Matsraub.keyClick(player)
	infobox(player,loc(player,"Fraktionen_176"),"info")
	setElementData(player,"MatsraubKey",true)
	Matsraub.start()
end

-- [[ KISTEN ERSTELLEN ]] --

function Matsraub.start()
	changeAktionAktiv()
	for i,v in pairs(Matsraub["Chests"])do
		Matsraub.chest[i] = createObject(3014,v[1],v[2],v[3],0,0,0)
		setElementInterior(Matsraub.chest[i],6)
		setElementData(Matsraub.chest[i],"Matsraub",true)
		setElementDimension(Matsraub.chest[i],98)
	end
end

-- [[ PED ERSTELLEN ]] --

function Matsraub.createPed()
	if(isElement(Matsraub.ped))then destroyElement(Matsraub.ped)end
	Matsraub.ped = createPed(302,288.10000610352,-111.5,1001.5,0)
	setElementData(Matsraub.ped,"RobPed",true)
	setElementInterior(Matsraub.ped,6)
	setElementDimension(Matsraub.ped,98)
	addEventHandler("onPedWasted",Matsraub.ped,Matsraub.pedWasted)
end
Matsraub.createPed()

-- [[ KISTE EINSAMMELN ]] --

function Matsraub.click(player)
	if(isEvil(player))then
		infobox(player,loc(player,"Fraktionen_177"),"info")
		setElementData(player,"Matsraub",true)
		local fac = getElementData(player,"Fraktion")
		Matsraub.vehicles[Matsraub.sanchez] = createVehicle(468,-283.5,2690.6000976563 + Matsraub.sanchez * 2,62.400001525879,0,0,270)
		setVehicleColor(Matsraub.vehicles[Matsraub.sanchez],Fraktionssystem["Fraktion"][fac][1],Fraktionssystem["Fraktion"][fac][2],Fraktionssystem["Fraktion"][fac][3])
		setElementData(Matsraub.vehicles[Matsraub.sanchez],"Matsraub",true)
		
		addEventHandler("onVehicleEnter",Matsraub.vehicles[Matsraub.sanchez],function(player)
			if(getPedOccupiedVehicleSeat(player) == 0)then
				if(not(isEvil(player)))then
					exitVehicle(player)
					infobox(player,loc(player,"Fraktionen_178"),"error")
				else
					if(not(getElementData(player,"Matsraub")) == true)then
						exitVehicle(player)
						infobox(player,loc(player,"Fraktionen_179"),"error")
					else
						triggerClientEvent(player,"Matsraub.createMarker",player,"create")
					end
				end
			end
		end)
		
		addEventHandler("onVehicleExit",Matsraub.vehicles[Matsraub.sanchez],function(player)
			triggerClientEvent(player,"Matsraub.createMarker",player)
		end)
		
		addEventHandler("onVehicleExplode",Matsraub.vehicles[Matsraub.sanchez],function()
			destroyElement(source)
		end)
		
		Matsraub.sanchez = Matsraub.sanchez + 1
	end
end

-- [[ ABGABE ]] --

addEvent("Matsraub.abgabe",true)
addEventHandler("Matsraub.abgabe",root,function()
	if(isEvil(client) and getElementData(client,"Matsraub") == true)then
		setElementData(client,"Matsraub",false)
		triggerClientEvent(client,"Matsraub.createMarker",client)
		destroyElement(getPedOccupiedVehicle(client))
		local fac = getElementData(client,"Fraktion")
		addToLager(fac,"Materialien",750,"fraktionslager")
		infobox(client,loc(client,"Fraktionen_180"),"info")
		Matsraub.sanchez = Matsraub.sanchez - 1
		if(Matsraub.sanchez == 0)then Matsraub.refresh() end
	end
end)

-- [[ MATSRAUB REFRESHEN ]] --

function Matsraub.refresh()
	Matsraub.createPed()
	Matsraub.state = false
	Matsraub.sanchez = 0
	for i = 1,#Matsraub["Chests"] do
		if(isElement(Matsraub.vehicles[i]))then
			destroyElement(Matsraub.vehicles[i])
		end
	end
	for _,v in pairs(getElementsByType("player"))do
		triggerClientEvent(v,"Matsraub.createMarker",v)
		setElementData(v,"Matsraub",false)
	end
	for i = 1,#Matsraub["Chests"] do
		if(isElement(Matsraub.chest[i]))then
			destroyElement(Matsraub.chest[i])
		end
	end
	if(isElement(Matsraub.key))then
		desrtoyElement(Matsraub.key)
	end
	if(isTimer(Matsraub.refreshTimer))then
		killTimer(Matsraub.refreshTimer)
	end
	changeAktionAktiv()
	changeAktionPause()
end

-- [[ WAS PASSIERT, WENN SPIELER STIRBT ]] --

addEventHandler("onPlayerWasted",root,function()
	triggerClientEvent(source,"Matsraub.createMarker",source)
	setElementData(source,"Matsraub",false)
end)