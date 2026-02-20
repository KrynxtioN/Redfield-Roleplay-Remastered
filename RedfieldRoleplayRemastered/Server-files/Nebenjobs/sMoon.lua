-- [[ ELEMENTE ERSTELLEN ]] --

Moon.rocket = createObject(1243,349.29220581055,3110.5046386719,7.813600063324,0,180,0)
setElementFrozen(Moon.rocket,true)
setElementDoubleSided(Moon.rocket,true)

function Moon.createMarker()
	if(isElement(Moon.miningMarker))then destroyElement(Moon.miningMarker)end
	local rnd = math.random(1,#Moon["Mining"])
	if(rnd ~= Moon.lastMarker)then
		Moon.lastMarker = rnd
		local x,y,z = Moon["Mining"][rnd][1],Moon["Mining"][rnd][2],Moon["Mining"][rnd][3] - 0.9
		Moon.miningMarker = createMarker(x,y,z,"cylinder",1,255,255,255,150)
		
		addEventHandler("onMarkerHit",Moon.miningMarker,function(player)
			if(not(isPedInVehicle(player)) and isPedOnGround(player))then
				if(getElementDimension(player) == getElementDimension(source))then
					setPedRotation(player,Moon["Mining"][rnd][4])
					Moon.farming(player)
				end
			end
		end)
		
		if(Moon.playerOnMoon ~= nil)then
			local target = getPlayerFromName(Moon.playerOnMoon)
			if(isElement(target) and getElementData(target,"loggedin") == 1)then
				triggerClientEvent(target,"Moon.createBlip",target,"create",x,y,z)
			end
		end
	else Moon.createMarker()end
end
Moon.createMarker()

if(#Moon["Objects"] >= 1)then
	for i,v in pairs(Moon["Objects"])do
		local object = createObject(v[1],v[2],v[3],v[4],v[5],v[6],v[7])
		table.insert(Moon.objects,{object})
	end
end

function Moon.createRocketMarker(ID)
	local x,y,z = Moon["Marker"][ID][1],Moon["Marker"][ID][2],Moon["Marker"][ID][3]
	Moon.rocketMarker = createMarker(x,y,z,"cylinder",1,0,250,250,150)
	
	addEventHandler("onMarkerHit",Moon.rocketMarker,function(player)
		if(getElementDimension(player) == getElementDimension(source))then
			triggerClientEvent(player,"Moon.openWindow",player,ID)
		end
	end)
end
Moon.createRocketMarker(1)

-- [[ TEXTUREN LADEN ]] --

function Moon.addTextures(player)
	triggerClientEvent(player,"Moon.addTextures",player,Moon.objects)
end

-- [[ RAKETE STARTEN ]] --

addEvent("Moon.startRocket",true)
addEventHandler("Moon.startRocket",root,function(type)
	if(type == "Zum Mond fliegen")then
		if(getElementData(client,"Schutzmechanismus") >= 1 and getElementData(client,"Raketentreibstoff") >= 1)then
			if(isElement(Moon.rocketMarker))then
				setElementData(client,"Schutzmechanismus",getElementData(client,"Schutzmechanismus") - 1)
				setElementData(client,"Raketentreibstoff",getElementData(client,"Raketentreibstoff") - 1)
				setTimer(function(client)
					if(isElement(client))then
						attachElements(client,Moon.rocket,0,-4,3)
						setElementAlpha(client,0)
						setPlayerStatus(client,4)
					end
				end,50,1,client)
				destroyElement(Moon.rocketMarker)
				Moon.playerOnMoon = getPlayerName(client)
				triggerClientEvent(client,"setWindowDatas",client)
				setElementData(client,"InRakete",true)
				triggerClientEvent(client,"Moon.raketenStart",client,"create")
				
				moveObject(Moon.rocket,60000,349.29220581055,3110.5046386719,1158.2946777344)
				setTimer(function(client)
					fadeCamera(client,false)
					infobox(client,loc(client,"Nebenjobs_29"),"info")
				end,40000,1,client)
				setTimer(function(client)
					if(isElement(client))then
						detachElements(client,Moon.rocket)
						setElementPosition(client,354.45678710938,3110.5642089844,1152.8920898438)
						setPedRotation(client,270)
						Moon.createRocketMarker(2)
						setElementAlpha(client,255)
						setElementData(client,"InRakete",false)
						setPedGravity(client,0.004)
						triggerClientEvent(client,"Moon.activateFeeling",client,"create")
						setElementModel(client,9)
						triggerClientEvent(client,"Moon.raketenStart",client)
						fadeCamera(client,true)
						local x,y,z = getElementPosition(Moon.miningMarker)
						triggerClientEvent(client,"Moon.createBlip",client,"create",x,y,z)
					else
						moveObject(Moon.rocket,60000,349.29220581055,3110.5046386719,7.813600063324)
						setTimer(function()
							Moon.createRocketMarker(1)
						end,60000,1)
					end
				end,60000,1,client)
			else infobox(client,loc(client,"Nebenjobs_30"),"error")end
		else infobox(client,loc(client,"Nebenjobs_31"),"error")end
	else
		fadeCamera(client,false)
		triggerClientEvent(client,"setWindowDatas",client)
		destroyElement(Moon.rocketMarker)
		
		setTimer(function()
			Moon.createRocketMarker(1)
			Moon.playerOnMoon = nil
		end,62000,1)
		
		setTimer(function(client)
			if(isElement(client))then
				setTimer(function(client)
					if(isElement(client))then
						attachElements(client,Moon.rocket,0,-4,3)
						setElementAlpha(client,0)
					end
				end,50,1,client)
			
				setElementData(client,"InRakete",true)
				triggerClientEvent(client,"Moon.activateFeeling",client,"destroy")
				triggerClientEvent(client,"Moon.raketenStart",client,"create")
				infobox(client,loc(client,"Nebenjobs_32"),"info")
				triggerClientEvent(client,"Moon.createBlip",client)
				setTimer(function(client)
					if(isElement(client))then
						detachElements(client,Moon.rocket)
						setElementPosition(client,348.85388183594,3106.1140136719,1.0490655899048)
						setPedRotation(client,0)
						setElementAlpha(client,255)
						setElementData(client,"InRakete",false)
						setPedGravity(client,0.008)
						setElementModel(client,getElementData(client,"Skin"))
						triggerClientEvent(client,"Moon.raketenStart",client)
						fadeCamera(client,true)
						setElementData(client,"Energie",100)
					end
				end,60000,1,client)
			end
			moveObject(Moon.rocket,60000,349.29220581055,3110.5046386719,7.813600063324)
		end,2000,1,client)
	end
end)

-- [[ MONDSTEINE SAMMELN ]] --

function Moon.farming(player)
	if(getElementData(player,"Spitzhacke") >= 1)then
		destroyElement(Moon.miningMarker)
		giveWeapon(player,5,1,true)
		setElementFrozen(player,true)
		toggleAllControls(player,false)
		setPedAnimation(player,"baseball","Bat_4")
		triggerClientEvent(player,"Moon.sound",player,"create")
		Moon.farmingTimer = setTimer(function(player)
			setElementFrozen(player,false)
			toggleAllControls(player,true)
			setPedAnimation(player)
			if(math.random(1,3) == 2)then
				setElementData(player,"Mondsteine",getElementData(player,"Mondsteine")+1)
				infobox(player,loc(player,"Nebenjobs_33"),"info")
			else
				if(math.random(1,15) == 5)then
					setElementData(player,"Spitzhacke",getElementData(player,"Spitzhacke")-1)
					infobox(player,loc(player,"Nebenjobs_34"),"error")
				else
					infobox(player,loc(player,"Nebenjobs_35"),"error")
				end
			end
			Moon.createMarker()
			takeWeapon(player,5)
		end,15000,1,player)
	else infobox(player,loc(player,"Nebenjobs_36"),"error")end
end

-- [[ WAS PASSIERT, WENN SPIELER STIRBT / QUITTET ]] --

function Moon.playerDiedOrQuit(player)
	if(Moon.playerOnMoon == getPlayerName(player))then
		if(isTimer(Moon.farmingTimer[player]))then killTimer(Moon.farmingTimer[player])end
		Moon.playerOnMoon = nil
		if(isElement(Moon.rocketBackMarker))then destroyElement(Moon.rocketBackMarker)end
		moveObject(Moon.rocket,60000,349.29220581055,3110.5046386719,7.813600063324)
		setTimer(function()
			Moon.createRocketMarker()
		end,60000,1)
		setElementData(player,"InRakete",false)
		setPedGravity(player,0.008)
		triggerClientEvent(player,"Moon.activateFeeling",player,"destroy")
		triggerClientEvent(player,"Moon.sound",player)
		triggerClientEvent(player,"Moon.createBlip",player)
	end
end

addEventHandler("onPlayerWasted",root,function() Moon.playerDiedOrQuit(source) end)
addEventHandler("onPlayerQuit",root,function() Moon.playerDiedOrQuit(source) end)