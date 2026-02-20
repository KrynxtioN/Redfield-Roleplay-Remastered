-- [[ DAS FENSTER ]] --

addEvent("Staatswaffentransporter.openWindow",true)
addEventHandler("Staatswaffentransporter.openWindow",root,function()
	if(isWindowOpen())then
		GUIEditor.window[1] = guiCreateWindow(505, 359, 207, 69, loc("Fraktionen_18"), false)

        GUIEditor.button[1] = guiCreateButton(10, 24, 187, 35, loc("Fraktionen_19"), false, GUIEditor.window[1])
		setWindowDatas()
		
		addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
			triggerServerEvent("Staatswaffentransporter.start",localPlayer)
		end,false)
	end
end)

-- [[ ABGABEMARKER ERSTELLEN / LÖSCHEN ]] --

addEvent("Staatswaffentransporter.marker",true)
addEventHandler("Staatswaffentransporter.marker",root,function(type)
	if(isElement(Staatswaffentransporter.marker))then destroyElement(Staatswaffentransporter.marker)end
	if(isElement(Staatswaffentransporter.blip))then destroyElement(Staatswaffentransporter.blip)end
	if(type)then
		Staatswaffentransporter.marker = createMarker(-1606.4000244141,732.79998779297,-6.1999998092651,"cylinder",3,255,0,0,150)
		Staatswaffentransporter.blip = createBlip(-1606.4000244141,732.79998779297,-6.1999998092651,0,2,255,0,0)
		
		addEventHandler("onClientMarkerHit",Staatswaffentransporter.marker,function(player)
			if(player == localPlayer)then
				triggerServerEvent("Staatswaffentransporter.abgabe",localPlayer)
			end
		end)
	end
end)