-- [[ DAS FENSTER ]] --

addEvent("Schwarzpulvertransporter.openWindow",true)
addEventHandler("Schwarzpulvertransporter.openWindow",root,function()
	if(isWindowOpen())then
		GUIEditor.window[1] = guiCreateWindow(514, 393, 281, 152, loc("Fraktionen_15"), false)

        GUIEditor.button[1] = guiCreateButton(10, 110, 261, 32, loc("Fraktionen_16"), false, GUIEditor.window[1])
        GUIEditor.label[1] = guiCreateLabel(10, 27, 261, 73, loc("Fraktionen_17"), false, GUIEditor.window[1])
		setWindowDatas(1)
		
		addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
			triggerServerEvent("Schwarzpulvertransporter.start",localPlayer)
		end,false)
	end
end)

-- [[ ABGABEMARKER ERSTELLEN / LÖSCHEN ]] --

addEvent("Schwarzpulvertransporter.createMarker",true)
addEventHandler("Schwarzpulvertransporter.createMarker",root,function(type)
	if(isElement(Schwarzpulvertransporter.marker))then destroyElement(Schwarzpulvertransporter.marker)end
	if(isElement(Schwarzpulvertransporter.blip))then destroyElement(Schwarzpulvertransporter.blip)end
	
	if(type)then
		local faction = getElementData(localPlayer,"Fraktion")
		local x,y,z = Fraktionssystem["Abgabemarker"][faction][1],Fraktionssystem["Abgabemarker"][faction][2],Fraktionssystem["Abgabemarker"][faction][3]
		Schwarzpulvertransporter.marker = createMarker(x,y,z,"checkpoint",3,255,0,0)
		Schwarzpulvertransporter.blip = createBlip(x,y,z,0,2,255,0,0)
		
		addEventHandler("onClientMarkerHit",Schwarzpulvertransporter.marker,function(player)
			if(player == localPlayer)then
				triggerServerEvent("Schwarzpulvertransporter.abgabe",localPlayer)
			end
		end)
	end
end)