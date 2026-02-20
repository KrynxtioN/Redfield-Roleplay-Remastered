-- [[ TÜR ERSTELLEN / SPRENGEN ]] --

function Casinoraub.createDoorObject()
	if(isElement(Casinoraub.doorElement))then destroyElement(Casinoraub.doorElement)end
	if(Casinoraub.doorState == 0)then
		Casinoraub.doorElement = createObject(2634,2144.2026367188,1627.0601806641,994.26763916016,0,0,180)
		
		addEventHandler("onElementClicked",Casinoraub.doorElement,function(button,state,player)
			if(not(isTimer(Casinoraub.bombExplode)))then
				if(button == "left" and state == "down")then
					if(getElementData(player,"elementClicked") ~= true)then
						local x,y,z = getElementPosition(source)
						if(getDistanceBetweenPoints3D(x,y,z,getElementPosition(player)) <= 5)then
							if(getElementData(player,"Bomben") >= 1)then
								if(isAktionPause(player))then
									if(isAktionAktiv(player))then
										changeAktionAktiv()
										setElementData(player,"Bomben",getElementData(player,"Bomben")-1)
										createBreakingNews("Fraktionen_128")
										infobox(player,loc(player,"Fraktionen_129"),"info")
										
										Casinoraub.bombExplode = setTimer(function()
											Casinoraub.doorState = 1
											Casinoraub.createDoorObject()
											Casinoraub.createMoneyBags("create")
										end,300000,1)
									end
								end
							else infobox(player,loc(player,"Fraktionen_130"),"error")end
						end
					end
				end
			end
		end)
	else
		Casinoraub.doorElement = createObject(2634,2144.2253417969,1625.6791992188,992.99731445313,79.746948242188,1.4046630859375,180)
	end
	setElementDimension(Casinoraub.doorElement,10)
	setElementInterior(Casinoraub.doorElement,1)
end
Casinoraub.createDoorObject()

-- [[ GELDSÄCKE ERSTELLEN ]] --

function Casinoraub.createMoneyBags(type)
	for i = 1,#Casinoraub["Geldsaecke"] do
		if(isElement(Casinoraub.moneyBag[i]))then
			destroyElement(Casinoraub.moneyBag[i])
		end
	end
	
	if(type)then
		Casinoraub.saecke = #Casinoraub["Geldsaecke"]
	
		for i,v in ipairs(Casinoraub["Geldsaecke"])do
			Casinoraub.moneyBag[i] = createObject(1550,v[1],v[2],v[3],v[4],v[5],v[6])
			setElementDimension(Casinoraub.moneyBag[i],10)
			setElementInterior(Casinoraub.moneyBag[i],1)
		end
		
		Casinoraub.robMarker = createMarker(2141.8706054688,1642.0537109375,992.11218261719,"cylinder",2,255,0,0,150)
		setElementDimension(Casinoraub.robMarker,10)
		setElementInterior(Casinoraub.robMarker,1)
		
		Casinoraub.refresTimer = setTimer(function()
			if(isElement(Casinoraub.robMarker))then destroyElement(Casinoraub.robMarker)end
			Casinoraub.createMoneyBags()
			for _,v in pairs(getElementsByType("player"))do
				Casinoraub.killTimer(v)
			end
			Casinoraub.doorState = 0
			Casinoraub.createDoorObject()
		end,1800000,1)
		
		addEventHandler("onMarkerHit",Casinoraub.robMarker,function(player)
			if(isEvil(player))then
				if(isElement(Casinoraub.moneyBag[Casinoraub.saecke]))then destroyElement(Casinoraub.moneyBag[Casinoraub.saecke])end
				Casinoraub.saecke = Casinoraub.saecke - 1
				Casinoraub.playerMoneyBag[player] = createObject(1550,0,0,0,0,0,0)
				setElementDoubleSided(Casinoraub.playerMoneyBag[player],true)
				setTimer(function(player)
					if(isElement(player))then
						attachElements(Casinoraub.playerMoneyBag[player],player,0,-0.2,0.3,0,0,180)
					end
				end,50,1,player)
				setElementCollisionsEnabled(Casinoraub.playerMoneyBag[player],false)
				setElementData(player,"MoneybagMoneyForDepot",4500)
				refreshCasinoraubMoneybag(player)
				infobox(player,loc(player,"Fraktionen_131"),"info")
				outputLog("[Casinoraub]: "..getPlayerName(player).." hat einen Geldsack eingesammelt.","Fraktionen")
			elseif(isStateFaction(player))then
				if(Casinoraub.save == false)then
					toggleAllControls(player,false)
					setElementFrozen(player,true)
					setPedAnimation(player,"BOMBER","BOM_Plant_Loop")
					Casinoraub.save = true
					infobox(player,loc(player,"Fraktionen_132"),"info")
					Casinoraub.saveTimer[player] = setTimer(function(player)
						Casinoraub.save = false
						Casinoraub.createMoneyBags()
						infobox(player,loc(player,"Fraktionen_133"),"info")
						toggleAllControls(player,true)
						setElementFrozen(player,false)
						setPedAnimation(player)
						if(isElement(Casinoraub.robMarker))then destroyElement(Casinoraub.robMarker)end
						Casinoraub.saecke = 0
						outputLog("[Casinoraub]: "..getPlayerName(player).." hat einen Geldsack sichergestellt.","Fraktionen")
					end,25000,1,player)
				end
			end
			if(Casinoraub.saecke == 0)then
				destroyElement(Casinoraub.robMarker)
				for _,v in pairs(getElementsByType("player"))do
					Casinoraub.killTimer(v)
				end
				changeAktionAktiv()
				changeAktionPause()
				Casinoraub.doorState = 0
				if(isTimer(Casinoraub.refreshTimer))then killTimer(Casinoraub.refreshTimer)end
				setTimer(function()
					Casinoraub.createDoorObject()
				end,300000,1)
			end
		end)
	end
end

-- [[ GELDSACK IN INTERIOR / DIMENSION SETZEN ]] --

function refreshCasinoraubMoneybag(player)
	if(isElement(Casinoraub.playerMoneyBag[player]))then
		setElementInterior(Casinoraub.playerMoneyBag[player],getElementInterior(player))
		setElementDimension(Casinoraub.playerMoneyBag[player],getElementDimension(player))
	end
end

-- [[ WAS PASSIERT, WENN SPIELER STIRBT / QUITTET ]] --

function Casinoraub.killTimer(player)
	if(isTimer(Casinoraub.saveTimer[player]))then
		killTimer(Casinoraub.saveTimer[player])
		Casinoraub.save = false
		toggleAllControls(player,true)
		setElementFrozen(player,false)
		setPedAnimation(player)
	end
	if(isElement(Casinoraub.playerMoneyBag[player]))then
		destroyElement(Casinoraub.playerMoneyBag[player])
		setElementData(player,"MoneybagMoneyForDepot",0)
	end
end

addEventHandler("onPlayerQuit",root,function() Casinoraub.killTimer(source) end)
addEventHandler("onPlayerWasted",root,function() Casinoraub.killTimer(source) end)