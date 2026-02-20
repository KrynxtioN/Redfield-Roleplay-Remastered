-- [[ STARTEN (LEVEL 1) ]] --

addEvent("Muellmann.level1",true)
addEventHandler("Muellmann.level1",root,function()
	triggerServerEvent("Muellmann.level1",localPlayer)
end)

addEvent("Muellmann.level2",true)
addEventHandler("Muellmann.level2",root,function()
	triggerServerEvent("Muellmann.level2",localPlayer)
	addEventHandler("onClientRender",root,Muellmann.dxDrawTonnen)
end)

-- [[ ABGABEMARKER UND TONNEN ERSTELLEN / LÖSCHEN ]] --

addEvent("Muellmann.createMarker",true)
addEventHandler("Muellmann.createMarker",root,function(type)
	for i = 1,#Muellmann["Tonnen"] do
		if(isElement(Muellmann.tonne[i]))then destroyElement(Muellmann.tonne[i])end
		if(isElement(Muellmann.tonnenblip[i]))then destroyElement(Muellmann.tonnenblip[i])end
		if(isElement(Muellmann.tonnenmarker[i]))then destroyElement(Muellmann.tonnenmarker[i])end
	end
	if(isTimer(Muellmann.trashTimer[localPlayer]))then killTimer(Muellmann.trashTimer[localPlayer])end
	if(isElement(Muellmann.abgabe))then
		destroyElement(Muellmann.abgabe)
		Muellmann.kleine_tonnen = 0
		Muellmann.grosse_tonnen = 0
	end
	
	if(type)then
		for i,v in pairs(Muellmann["Tonnen"])do
			Muellmann.tonne[i] = createObject(v[7],v[1],v[2],v[3],v[4],v[5],v[6])
			Muellmann.tonnenblip[i] = createBlip(v[1],v[2],v[3],0,1,255,0,0)
			Muellmann.tonnenmarker[i] = createMarker(v[1],v[2],v[3],"cylinder",5,255,0,0,0)
			setElementData(Muellmann.tonnenmarker[i],"TonnenID",i)
			setElementData(Muellmann.tonnenmarker[i],"TonnenType",v[8])
			
			addEventHandler("onClientMarkerHit",Muellmann.tonnenmarker[i],function(player)
				if(player == localPlayer)then
					local ID = getElementData(source,"TonnenID")
					local TonnenType = getElementData(source,"TonnenType")
					if(TonnenType == 1)then Muellmann.kleine_tonnen = Muellmann.kleine_tonnen + 1 end
					if(TonnenType == 0)then Muellmann.grosse_tonnen = Muellmann.grosse_tonnen + 1 end
					destroyElement(Muellmann.tonne[ID])
					destroyElement(Muellmann.tonnenblip[ID])
					destroyElement(Muellmann.tonnenmarker[ID])
					setElementFrozen(getPedOccupiedVehicle(localPlayer),true)
					Muellmann.trashTimer[localPlayer] = setTimer(function()
						setElementFrozen(getPedOccupiedVehicle(localPlayer),false)
					end,5000,1)
				end
			end)
		end
		
		Muellmann.abgabe = createMarker(-1892.7803955078,-1670.6734619141,23.015625-1,"cylinder",5,200,200,0,100)
			
		addEventHandler("onClientMarkerHit",Muellmann.abgabe,function(player)
			if(player == localPlayer)then
				if(isPedInVehicle(localPlayer))then
					if(Muellmann.kleine_tonnen >= 1 or Muellmann.grosse_tonnen >= 1)then
						local money = Muellmann.kleine_tonnen * 20 + Muellmann.grosse_tonnen * 40
						triggerServerEvent("giveJobMoney",localPlayer,localPlayer,money)
						Muellmann.kleine_tonnen = 0
						Muellmann.grosse_tonnen = 0
						setElementData(localPlayer,"MuellmannPunkte",getElementData(localPlayer,"MuellmannPunkte")+money/100*0.5)
					else infobox(loc("Jobs_27"),"error")end
				end
			end
		end)
	end
end)

-- [[ DRECK ZUM EINSAMMELN (ZU FUß) ]] --

function Muellmann.dreckZumEinsammeln(type)
	if(isElement(Muellmann.dreckPickup))then destroyElement(Muellmann.dreckPickup)end
	if(isElement(Muellmann.blip))then destroyElement(Muellmann.blip)end
	if(type)then
		local rnd = math.random(1,#Muellmann["Dreck"]["Positions"])
		local x,y,z = Muellmann["Dreck"]["Positions"][rnd][1],Muellmann["Dreck"]["Positions"][rnd][2],Muellmann["Dreck"]["Positions"][rnd][3]
		Muellmann.dreckPickup = createPickup(x,y,z,3,Muellmann["Dreck"]["Models"][math.random(1,#Muellmann["Dreck"]["Models"])],50)
		Muellmann.blip = createBlip(x,y,z,0,2,255,0,0)
		addEventHandler("onClientPickupHit",Muellmann.dreckPickup,function(player)
			if(player == localPlayer)then
				if(not(isPedInVehicle(player)))then
					destroyElement(source)
					destroyElement(Muellmann.blip)
					Muellmann.dreckZumEinsammeln("create")
					setElementData(localPlayer,"MuellmannPunkte",getElementData(localPlayer,"MuellmannPunkte")+1)
					triggerServerEvent("giveJobMoney",localPlayer,localPlayer,25)
				end
			end
		end)
	end
end
addEvent("Muellmann.createDreckZumEinsammeln",true)
addEventHandler("Muellmann.createDreckZumEinsammeln",root,Muellmann.dreckZumEinsammeln)

-- [[ TONNEN ANZEIGE ]] --

function Muellmann.dxDrawTonnen()
	if(isWindowOpen())then
		
	end
end