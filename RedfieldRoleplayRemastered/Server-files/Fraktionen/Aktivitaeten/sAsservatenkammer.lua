-- [[ KEYPAD ERSTELLEN ]] --

Asservatenkammer.keypad = createObject(2886,268.33178710938,107.76820373535,1009.1972045898,0,0,270)
setElementInterior(Asservatenkammer.keypad,10)
setElementData(Asservatenkammer.keypad,"Asservatenkammer",true)

-- [[ TÜR ERSTELLEN ]] --

function Asservatenkammer.createDoor()
	if(isElement(Asservatenkammer.door))then destroyElement(Asservatenkammer.door)end
	Asservatenkammer.door = createObject(2634,268.47821044922,109.08809661865,1009.103515625,0,0,90)
	setElementInterior(Asservatenkammer.door,10)
end
Asservatenkammer.createDoor()

-- [[ RAUB OBJEKTE ERSTELLEN ]] --

function Asservatenkammer.createRobObjects(type)
	Asservatenkammer.objectsID = 0
	for i = 1,#Asservatenkammer.objects do
		if(isElement(Asservatenkammer.objects[i]))then
			destroyElement(Asservatenkammer.objects[i])
		end
	end
	Asservatenkammer.objects = {}
	
	if(type)then
		for i,v in ipairs(Asservatenkammer["RobObjectPositions"])do
			Asservatenkammer.objects[i] = createObject(v[1],v[2],v[3],v[4],v[5],v[6],v[7])
			setElementInterior(Asservatenkammer.objects[i],10)
			setElementData(Asservatenkammer.objects[i],"Asservatenkammer",true)
			setElementData(Asservatenkammer.objects[i],"wirdAusgeraubt",false)
			Asservatenkammer.objectsID = Asservatenkammer.objectsID + 1
		end
	end
end

-- [[ PED ERSTELLEN ]] --

function Asservatenkammer.createPed()
	if(isElement(Asservatenkammer.ped))then destroyElement(Asservatenkammer.ped)end
	Asservatenkammer.ped = createPed(282,256.36019897461,119.20079803467,1008.8203125,270)
	setElementInterior(Asservatenkammer.ped,10)
	setElementData(Asservatenkammer.ped,"RobPed",true)
	
	addEventHandler("onPedWasted",Asservatenkammer.ped,function(_,player)
		if(isEvil(player))then
			if(getStateFactionMemberOnline() >= 2)then
				if(isAktionPause(player))then
					if(isAktionAktiv(player))then
						local x,y,z = getElementPosition(source)
						setTimer(function(player)
							changeAktionAktiv()
							Asservatenkammer.keyCard = createObject(1581,x,y,z,0,0,math.random(0,360))
							setElementData(Asservatenkammer.keyCard,"Asservatenkammer",true)
							setElementInterior(Asservatenkammer.keyCard,10)
							createBreakingNews("Fraktionen_100")
							outputLog("[Asservatenkammerraub]: "..getPlayerName(player).." hat den Beamten im SFPD ermordet.","Fraktionen")
							
							Asservatenkammer.refreshTimer = setTimer(function()
								Asservatenkammer.refresh()
							end,1800000,1)
						end,500,1,player)
					else Asservatenkammer.createPed() end
				else Asservatenkammer.createPed() end
			else
				infobox(player,loc(player,"Fraktionen_101"),"error")
				Asservatenkammer.createPed()
			end
		else Asservatenkammer.createPed() end
	end)
end
Asservatenkammer.createPed()

-- [[ TÜR ÖFFNEN ]] --

addEvent("Asservatenkammer.openDoor",true)
addEventHandler("Asservatenkammer.openDoor",root,function(code)
	local code = tonumber(code)
	if(Asservatenkammer.code ~= nil)then
		if(Asservatenkammer.code == code)then
			if(Asservatenkammer.doorState == false)then
				infobox(client,loc(player,"Fraktionen_102"),"info")
				Asservatenkammer.createRobObjects("create")
				moveObject(Asservatenkammer.door,3500,268.47821044922,109.08809661865,1009.103515625 - 5)
			else infobox(client,loc("Fraktionen_103"),"error")end
		else infobox(client,loc(player,"Fraktionen_104"),"error")end
	else infobox(client,loc(player,"Fraktionen_105"),"error")end
end)

-- [[ AKTION REFRESHEN ]] --

function Asservatenkammer.refresh()
	Asservatenkammer.createRobObjects()
	Asservatenkammer.createPed()
	Asservatenkammer.createDoor()
	Asservatenkammer.doorState = false
	Asservatenkammer.code = nil
	changeAktionAktiv()
	changeAktionPause()
	
	for _,v in pairs(getElementsByType("player"))do
		Asservatenkammer.stopRaub(v)
		setElementFrozen(v,false)
		toggleAllControls(v,true)
		setPedAnimation(v)
	end
end

-- [[ WAS PASSIERT, WENN DER SPIELER STIRBT / QUITTET ]] --

function Asservatenkammer.stopRaub(player)
	if(isTimer(Asservatenkammer.playerTimer[player]))then
		killTimer(Asservatenkammer.playerTimer[player])
	end
	setElementData(player,"AsservatenkammerRaubAus",nil)
	if(getElementData(player,"AsservatenkammerObject") ~= nil)then
		local object = getElementData(player,"AsservatenkammerObject")
		if(isElement(object))then
			setElementData(object,"wirdAusgeraubt",false)
		end
	end
	setElementData(player,"AsservatenkammerObject",nil)
end

addEventHandler("onPlayerQuit",root,function() Asservatenkammer.stopRaub(source) end)
addEventHandler("onPlayerWasted",root,function() Asservatenkammer.stopRaub(source) end)