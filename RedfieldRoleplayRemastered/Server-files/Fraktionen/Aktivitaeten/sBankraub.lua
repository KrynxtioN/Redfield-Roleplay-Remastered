-- [[ ELEMENTE ERSTELLEN ]] --

Bankraub.fenceLeft = createObject(983,372.70001220703,166.60000610352,1007.0999755859,90,90,0)
Bankraub.fenceRight = createObject(983,371.39999389648,166.60000610352,1007.0999755859,90,90,0)
Bankraub.keypad = createObject(2886,370.89999389648,166.69999694824,1008.9000244141,0,0,180)

setElementInterior(Bankraub.fenceLeft,3)
setElementInterior(Bankraub.fenceRight,3)
setElementInterior(Bankraub.keypad,3)
setElementDimension(Bankraub.fenceLeft,98)
setElementDimension(Bankraub.fenceRight,98)
setElementDimension(Bankraub.keypad,98)

-- [[ KEYPAD ANKLICKEN ]] --

addEventHandler("onElementClicked",Bankraub.keypad,function(button,state,player)
	if(button == "left" and state == "down")then
		if(getElementData(player,"BankraubKey") == true)then
			Bankraub.tresorid = math.random(1,4)
			createBreakingNews("Fraktionen_106")
			moveObject(Bankraub.fenceRight,4000,370.5,166.60000610352,1007.0999755859)
			moveObject(Bankraub.fenceLeft,5000,373.90001220703,166.60000610352,1007.0999755859)
			
			for i = 1,4 do
				if(isElement(Bankraub.tresor[i]))then
					destroyElement(Bankraub.tresor[i])
				end
			end
			
			for i,v in ipairs(Bankraub["Tresore"])do
				Bankraub.tresor[i] = createObject(v[1],v[2],v[3],v[4],v[5],v[6],v[7])
				setElementInterior(Bankraub.tresor[i],3)
				setElementDimension(Bankraub.tresor[i],98)
				setElementData(Bankraub.tresor[i],"BankraubTresorStufe",true)
				setElementData(Bankraub.tresor[i],"BankraubTresorID",i)
				addEventHandler("onElementClicked",Bankraub.tresor[i],Bankraub.clickTresor)
			end
		else infobox(player,loc(player,"Fraktionen_107"),"error")end
	end
end)

-- [[ TRESOR ANKLICKEN ]] --

function Bankraub.clickTresor(button,state,player)
	if(button == "left" and state == "down")then
		if(getElementData(source,"BankraubTresorStufe") == true)then
			setElementModel(source,2003)
			setElementData(source,"BankraubTresorStufe",false)
			if(getElementData(source,"BankraubTresorID") == Bankraub.tresorid)then
				infobox(player,loc(player,"Fraktionen_108"),"info")
				setElementData(player,"BankraubPlan",true)
				setElementFrozen(Bankraub.vehicle,false)
			else
				local money = math.random(750,1250)
				infobox(player,loc(player,"Fraktionen_109"):format(money),"info")
				setElementData(player,"Geld",getElementData(player,"Geld")+money)
			end
		end
	end
end

-- [[ PED ERSTELLEN ]] --

function Bankraub.createPed()
	if(isElement(Bankraub.ped))then destroyElement(Bankraub.ped)end
	if(isElement(Bankraub.card))then destroyElement(Bankraub.card)end
	
	Bankraub.ped = createPed(235,351.63650512695,206.07650756836,1008.3828125,90)
	setElementInterior(Bankraub.ped,3)
	setElementDimension(Bankraub.ped,98)
	setElementData(Bankraub.ped,"RobPed",true)
	
	addEventHandler("onPedWasted",Bankraub.ped,function(_,attacker)
		if(isEvil(attacker) and Bankraub.state == true and getElementData(attacker,"Fraktion") == Bankraub.id and Bankraub.phase == 2)then
			local x,y,z = getElementPosition(source)
			setTimer(function()
				Bankraub.card = createObject(1581,x,y,z,0,0,math.random(0,360))
				setElementInterior(Bankraub.card,3)
				setElementDimension(Bankraub.card,98)
				setElementData(Bankraub.card,"Bankraub",true)
			end,500,1)
		else Bankraub.createPed()end
	end)
end
Bankraub.createPed()

-- [[ RAUB STARTEN ]] --

addEvent("Bankraub.start",true)
addEventHandler("Bankraub.start",root,function()
	if(isEvil(client))then
		if(getStateFactionMemberOnline() >= 2)then
			if(isAktionPause(client))then
				if(isAktionAktiv(client))then
					changeAktionAktiv()
					Bankraub.phase = 1
					Bankraub.state = true
					Bankraub.id = getElementData(client,"Fraktion")
					Bankraub.vehicle = createVehicle(428,2646.6999511719,787,5.5999999046326,0,0,0)
					setVehicleColor(Bankraub.vehicle,0,0,0)
					infobox(client,loc(client,"Fraktionen_110"),"info")
					triggerClientEvent(client,"setWindowDatas",client)
					
					Bankraub.refreshTimer = setTimer(function()
						Bankraub.refresh()
					end,1800000,1)
					
					addEventHandler("onVehicleEnter",Bankraub.vehicle,function(player)
						if(getPedOccupiedVehicleSeat(player) == 0)then
							if(isEvil(player))then
								triggerClientEvent(player,"Bankraub.createMarker",player,"create",Bankraub.phase)
							else
								exitVehicle(player)
								infobox(player,loc(player,"Fraktionen_111"),"error")
							end
						end
					end)
					
					addEventHandler("onVehicleExit",Bankraub.vehicle,function(player)
						triggerClientEvent(player,"Bankraub.createMarker",player)
					end)
					
					addEventHandler("onVehicleExplode",Bankraub.vehicle,function(player)
						Bankraub.refresh()
						createBreakingNews("Fraktionen_112")
					end)
				end
			end
		end
	end
end)

-- [[ REFRESHEN ]] --

function Bankraub.refresh()
	if(isTimer(Bankraub.refreshTimer))then killTimer(Bankraub.refreshTimer)end
	if(isElement(Bankraub.ped))then destroyElement(Bankraub.ped)end
	if(isElement(Bankraub.card))then destroyElement(Bankraub.card)end
	changeAktionAktiv()
	changeAktionPause()
	for _,v in pairs(Bankraub.tresor)do destroyElement(v)end
	if(isElement(Bankraub.vehicle))then destroyElement(Bankraub.vehicle)end
	moveObject(Bankraub.fenceLeft,4000,372.70001220703,166.60000610352,1007.0999755859)
	moveObject(Bankraub.fenceRight,5000,371.39999389648,166.60000610352,1007.0999755859)
	for _,v in pairs(getElementsByType("player"))do
		triggerClientEvent(v,"Bankraub.createMarker",v)
		setElementData(v,"BankraubPlan",nil)
		setElementData(v,"BankraubKey",nil)
		setElementData(v,"BankraubPlan",nil)
	end
	Bankraub.state = false
	Bankraub.id = nil
	Bankraub.tresor = {}
	Bankraub.tresorid = nil
	Bankraub.phase = 0
end

-- [[ PLÄNE ABGEBEN ]] --

addEvent("Bankraub.planAbgeben",true)
addEventHandler("Bankraub.planAbgeben",root,function()
	if(getElementData(client,"BankraubPlan") == true)then
		if(Bankraub.phase == 3)then
			infobox(client,loc(client,"Fraktionen_113"):format(getAktionsMoney(25000,"Gang")),"info")
			addToLager(getElementData(client,"Fraktion"),"Geld",getAktionsMoney(25000,"Gang"),"fraktionslager")
			Bankraub.refresh()
			createBreakingNews("Fraktionen_114")
		else infobox(client,loc(client,"Fraktionen_115"),"error")end
	end
end)

-- [[ NÄCHSTE PHASE ]] --


addEvent("Bankraub.nextPhase",true)
addEventHandler("Bankraub.nextPhase",root,function()
	Bankraub.phase = Bankraub.phase + 1
	setElementFrozen(Bankraub.vehicle,true)
	if(Bankraub.phase == 2)then infobox(client,loc(client,"Fraktionen_116"),"info")end
	if(Bankraub.phase == 3)then infobox(client,loc(client,"Fraktionen_117"),"info")end
	exitVehicle(client)
end)

-- [[ WAS PASSIERT, WENN SPIELER STIRBT / QUITTET ]] --

function Bankraub.abgebrochen(player)
	if(getElementData(player,"BankraubPlan") == true)then
		Bankraub.refresh()
		createBreakingNews("Fraktionen_118")
	end
	triggerClientEvent(player,"Bankraub.createMarker",player)
end

addEventHandler("onPlayerQuit",root,function() Bankraub.abgebrochen(source) end)
addEventHandler("onPlayerWasted",root,function() Bankraub.abgebrochen(source)end)