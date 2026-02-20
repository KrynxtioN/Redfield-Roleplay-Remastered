-- [[ ABGABEMARKER ERSTELLEN / LÖSCHEN ]] --

addEvent("Pizzalieferant.createMarker",true)
addEventHandler("Pizzalieferant.createMarker",root,function(type)
	if(isElement(Pizzalieferant.marker))then destroyElement(Pizzalieferant.marker)end
	if(isElement(Pizzalieferant.blip))then destroyElement(Pizzalieferant.blip)end
	if(type == "create")then
		local rnd = math.random(1,#Pizzalieferant["Marker"])
		local x,y,z = Pizzalieferant["Marker"][rnd][1],Pizzalieferant["Marker"][rnd][2],Pizzalieferant["Marker"][rnd][3]
		Pizzalieferant.marker = createMarker(x,y,z - 0.9,"cylinder",2,255,0,0)
		Pizzalieferant.blip = createBlip(x,y,z,0,2,255,0,0)
		
		addEventHandler("onClientMarkerHit",Pizzalieferant.marker,function(player)
			if(player == localPlayer)then
				triggerServerEvent("Pizzalieferant.server",localPlayer)
			end
		end)
	end
end)