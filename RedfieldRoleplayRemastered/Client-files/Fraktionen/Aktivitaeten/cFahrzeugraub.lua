-- [[ VERKAUFSPED ERSTELLEN ]] --

addEvent("Fahrzeugraub.ped",true)
addEventHandler("Fahrzeugraub.ped",root,function(ID)
	if(isElement(Fahrzeugraub.ped))then destroyElement(Fahrzeugraub.ped)end
	if(ID)then
		local tbl = Fahrzeugraub["PosPed"][ID]
		Fahrzeugraub.ped = createPed(tbl[1],tbl[2],tbl[3],tbl[4],tbl[5])
		addEventHandler("onClientPedDamage",Fahrzeugraub.ped,function() cancelEvent()end)
	end
end)

-- [[ STUFE 1 ]] --

addEvent("Fahrzeugraub.stufe1",true)
addEventHandler("Fahrzeugraub.stufe1",root,function(type)
	if(isElement(Fahrzeugraub.marker))then destroyElement(Fahrzeugraub.marker)end
	if(isElement(Fahrzeugraub.blip))then destroyElement(Fahrzeugraub.blip)end
	
	if(type == "create")then
		Fahrzeugraub.marker = createMarker(2609.6999511719,1451.3000488281,9.8000001907349,"cylinder",3,255,0,0,150)
		Fahrzeugraub.blip = createBlip(2609.6999511719,1451.3000488281,9.8000001907349,0,2,255,0,0)
		
		addEventHandler("onClientMarkerHit",Fahrzeugraub.marker,function(player)
			if(player == localPlayer)then
				triggerServerEvent("Fahrzeugraub.garage",localPlayer)
				destroyElement(source)
				triggerEvent("Fahrzeugraub.stufe1",localPlayer)
			end
		end)
	end
end)

-- [[ STUFE 2 ]] --

addEvent("Fahrzeugraub.stufe2",true)
addEventHandler("Fahrzeugraub.stufe2",root,function(ID)
	if(isElement(Fahrzeugraub.marker))then destroyElement(Fahrzeugraub.marker)end
	if(isElement(Fahrzeugraub.blip))then destroyElement(Fahrzeugraub.blip)end
	
	if(ID)then
		local tbl = Fahrzeugraub["PosPed"][ID]
		Fahrzeugraub.marker = createMarker(tbl[6],tbl[7],tbl[8],"cylinder",2,255,0,0,150)
		Fahrzeugraub.blip = createBlip(tbl[6],tbl[7],tbl[8],0,2,255,0,0)
		
		addEventHandler("onClientMarkerHit",Fahrzeugraub.marker,function(player)
			if(player == localPlayer)then
				triggerServerEvent("Fahrzeugraub.abgabe",localPlayer)
				destroyElement(source)
			end
		end)
	end
end)

-- [[ WAS PASSIERT, WENN DER SPIELER STIRBT ]] --

addEventHandler("onClientPedWasted",root,function(player)
	if(player == localPlayer)then
		if(isElement(Fahrzeugraub.marker))then destroyElement(Fahrzeugraub.marker)end
		if(isElement(Fahrzeugraub.blip))then destroyElement(Fahrzeugraub.blip)end
	end
end)