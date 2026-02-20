-- [[ ABGABEMARKER ERSTELLEN / LÖSCHEN ]] --

addEvent("Matsraub.createMarker",true)
addEventHandler("Matsraub.createMarker",root,function(type)
	if(isElement(Matsraub.marker))then destroyElement(Matsraub.marker)end
	if(isElement(Matsraub.blip))then destroyElement(Matsraub.blip)end
	
	if(type)then
		local fac = getElementData(localPlayer,"Fraktion")
		local x,y,z = Fraktionssystem["Abgabemarker"][fac][1],Fraktionssystem["Abgabemarker"][fac][2],Fraktionssystem["Abgabemarker"][fac][3]
		Matsraub.marker = createMarker(x,y,z,"checkpoint",3,255,0,0,150)
		Matsraub.blip = createBlip(x,y,z,0,2,255,0,0)
		
		addEventHandler("onClientMarkerHit",Matsraub.marker,function(player)
			if(player == localPlayer)then
				triggerServerEvent("Matsraub.abgabe",localPlayer)
			end
		end)
	end
end)