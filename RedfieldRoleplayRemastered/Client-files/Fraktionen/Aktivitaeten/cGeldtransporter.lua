-- [[ DAS FENSTER ]] --

addEvent("Geldtransporter.openWindow",true)
addEventHandler("Geldtransporter.openWindow",root,function()
	if(isWindowOpen())then
		GUIEditor.window[1] = guiCreateWindow(505, 359, 207, 69, loc("Fraktionen_13"), false)

        GUIEditor.button[1] = guiCreateButton(10, 24, 187, 35, loc("Fraktionen_14"), false, GUIEditor.window[1])
		setWindowDatas()
		
		addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
			triggerServerEvent("Geldtransporter.start",localPlayer)
		end,false)
	end
end)

-- [[ ABGABEMARKER ERSTELLEN / LÖSCHEN ]] --

addEvent("Geldtransporter.marker",true)
addEventHandler("Geldtransporter.marker",root,function(type)
	if(isElement(Geldtransporter.marker))then destroyElement(Geldtransporter.marker)end
	if(isElement(Geldtransporter.blip))then destroyElement(Geldtransporter.blip)end
	if(type)then
		Geldtransporter.marker = createMarker(-2078.4536132813,489.30078125,35.171875-1,"cylinder",3,0,200,0)
		Geldtransporter.blip = createBlip(-2078.4536132813,489.30078125,35.171875,0,2,255,0,0)
		
		addEventHandler("onClientMarkerHit",Geldtransporter.marker,function(player)
			if(player == localPlayer)then
				triggerServerEvent("Geldtransporter.abgabe",localPlayer)
			end
		end)
	end
end)