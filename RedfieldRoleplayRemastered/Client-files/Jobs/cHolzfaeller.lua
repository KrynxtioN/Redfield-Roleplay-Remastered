-- [[ JOB STARTEN (LEVEL 1) ]] --

addEvent("Holzfaeller.level1",true)
addEventHandler("Holzfaeller.level1",root,function()
	triggerServerEvent("Holzfaeller.level1",localPlayer)
end)

-- [[ JOBINFO ]] --

function Holzfaeller.dxDraw()
	if(isWindowOpen() and not(isPlayerMapVisible(localPlayer)))then
		dxDrawText(loc("Jobs_23"), 0*(x/1440), 115*(y/900), 1440*(x/1440), 900*(y/900), tocolor(255, 255, 255, 255), 2.00*(x/1440), "default", "center", "center", false, true, false, false, false)
	end
end

-- [[ ABGABEMARKER ERSTELLEN / LÖSCHEN ]] --

addEvent("Holzfaeller.createMarker",true)
addEventHandler("Holzfaeller.createMarker",root,function(type)
	if(isElement(Holzfaeller.holzAbgabe))then destroyElement(Holzfaeller.holzAbgabe)end
	if(isElement(Holzfaeller.sawMarker))then destroyElement(Holzfaeller.sawMarker)end
	if(isElement(Holzfaeller.wald1))then destroyElement(Holzfaeller.wald1)end
	if(isElement(Holzfaeller.wald2))then destroyElement(Holzfaeller.wald2)end
	if(isElement(Holzfaeller.wald3))then destroyElement(Holzfaeller.wald3)end
	
	if(type)then
		Job.info = true
		addEventHandler("onClientRender",root,Holzfaeller.dxDraw)
		bindKey("k","down",function()
			removeEventHandler("onClientRender",root,Holzfaeller.dxDraw)
			unbindKey("k","down")
			Job.info = false
		end)
		Holzfaeller.wald1 = createBlip(-654.68725585938,-662.52996826172,43.529571533203,0,2,255,0,0)
		Holzfaeller.wald2 = createBlip(-2590.8999023438,-2233.1999511719,24.299999237061,0,2,255,0,0)
		Holzfaeller.wald3 = createBlip(-1860.5,-2628.3999023438,54.799999237061,0,2,255,0,0)
		Holzfaeller.holzAbgabe = createMarker(-2027.8552246094,-2335.2182617188,30.625-1,"cylinder",4,0,255,0)
		Holzfaeller.sawMarker  = createMarker(-2012.6279296875,-2350.1589355469,30.625-1,"cylinder",1,0,0,200)
		
		addEventHandler("onClientMarkerHit",Holzfaeller.holzAbgabe,function(player)
			if(player == localPlayer)then
				triggerServerEvent("Holzfaeller.holzAbgabe",localPlayer)
			end
		end)
		
		addEventHandler("onClientMarkerHit",Holzfaeller.sawMarker,function(player)
			if(player == localPlayer)then
				triggerServerEvent("Holzfaeller.cutWood",localPlayer)
			end
		end)
	end
end)

-- [[ PED DAMAGE ]] --

addEventHandler("onClientPedDamage",root,function(attacker,weapon)
	if(getElementData(source,"baum") == true)then
		cancelEvent()
		if(weapon == 9)then
			triggerServerEvent("Holzfaeller.baumDamage",localPlayer,source,attacker)
		end
	end
end)