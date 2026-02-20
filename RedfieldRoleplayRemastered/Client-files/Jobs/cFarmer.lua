-- [[ STARTEN (LEVEL 1) ]] --

addEvent("Farmer.level1",true)
addEventHandler("Farmer.level1",root,function()
	infobox(loc("Jobs_1"),"info")
end)

-- [[ ABGABEMARKER ERSTELLEN / LÖSCHEN ]] --

addEvent("Farmer.createMarker",true)
addEventHandler("Farmer.createMarker",root,function(type)
	if(isElement(Farmer.marker))then destroyElement(Farmer.marker)end
	if(isElement(Farmer.blip))then destroyElement(Farmer.blip)end
	if(type)then
		Farmer.marker = createMarker(-1065.4000244141,-1296.3000488281,128.19999694824,"cylinder",3,255,0,0)
		Farmer.blip = createBlip(-1065.4000244141,-1296.3000488281,128.19999694824,0,2,255,0,0)
		
		addEventHandler("onClientMarkerHit",Farmer.marker,function(player)
			if(player == localPlayer)then
				triggerServerEvent("Farmer.abgabe",localPlayer)
			end
		end)
	end
end)