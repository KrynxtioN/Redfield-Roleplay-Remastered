-- [[ BONUS-ANZEIGE ]] --

function Pilot.dxDraw()
	if(isWindowOpen())then
		if(not(isPlayerMapVisible(localPlayer)))then
			dxDrawRectangle(1086*(x/1440), 290*(y/900), 344*(x/1440), 53*(y/900), tocolor(17, 17, 17, 200), false)
			dxDrawRectangle(1086*(x/1440), 290*(y/900), 344*(x/1440), 10*(y/900), tocolor(17, 17, 17, 255), false)
			dxDrawText(loc("Jobs_28"):format(getElementData(localPlayer,"PilotenZeitbonus")), 1149*(x/1440), 300*(y/900), 1420*(x/1440), 343*(y/900), tocolor(255, 255, 255, 255), 1.00*(x/1440), NewFont, "center", "center", false, false, false, false, false)
			dxDrawImage(1096*(x/1440), 300*(y/900), 43*(x/1440), 43*(y/900), "Files/Images/HUD/Info.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
		end
	end
end

-- [[ STARTEN (LEVEL 1) ]] --

addEvent("Pilot.level1",true)
addEventHandler("Pilot.level1",root,function()
	triggerServerEvent("Pilot.start",localPlayer)
end)

-- [[ ABGABEMARKER ERSTELLEN / LÖSCHEN ]] --

addEvent("Pilot.marker",true)
addEventHandler("Pilot.marker",root,function(typ)
	if(isElement(Pilot.marker))then
		removeEventHandler("onClientRender",root,Pilot.dxDraw)
		destroyElement(Pilot.marker)
	end
	if(isElement(Pilot.blip))then destroyElement(Pilot.blip)end
	if(isTimer(Pilot.timer))then killTimer(Pilot.timer)end
	
	if(typ)then
		local number = math.random(1,#Pilot)
		Pilot.marker = createMarker(Pilot[number][1],Pilot[number][2],Pilot[number][3],"ring",7,255,0,0)
		Pilot.blip = createBlip(Pilot[number][1],Pilot[number][2],Pilot[number][3],0,2,255,0,0)
		setElementDimension(Pilot.marker,getElementDimension(localPlayer))
		setElementDimension(Pilot.blip,getElementDimension(localPlayer))
		infobox(loc("Jobs_29"):format(Pilot[number][4]),"info")
		setElementData(localPlayer,"PilotenZeitbonus",Pilot[number][5])
		addEventHandler("onClientRender",root,Pilot.dxDraw)
		
		Pilot.timer = setTimer(function()
			setElementData(localPlayer,"PilotenZeitbonus",getElementData(localPlayer,"PilotenZeitbonus")-1)
		end,1000,Pilot[number][5])
		
		addEventHandler("onClientMarkerHit",Pilot.marker,function(player)
			if(player == localPlayer)then
				triggerServerEvent("Pilot.finish",localPlayer,getElementData(localPlayer,"PilotenZeitbonus"))
			end
		end)
	end
end)