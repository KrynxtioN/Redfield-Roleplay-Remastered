-- [[ DAS FENSTER ]] --

addEvent("Warenhaus.openWindow",true)
addEventHandler("Warenhaus.openWindow",root,function()
	if(isWindowOpen())then
		GUIEditor.window[1] = guiCreateWindow(514, 393, 281, 152, loc("Fraktionen_20"), false)

        GUIEditor.button[1] = guiCreateButton(10, 110, 261, 32, loc("Fraktionen_21"), false, GUIEditor.window[1])
        GUIEditor.label[1] = guiCreateLabel(10, 27, 261, 73, loc("Fraktionen_22"), false, GUIEditor.window[1])
		setWindowDatas(1)
		
		addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
			triggerServerEvent("Warenhaus.start",localPlayer)
		end,false)
	end
end)

-- [[ ABGABEMARKER ERSTELLEN / LÖSCHEN ]] --

addEvent("Warenhaus.createMarker",true)
addEventHandler("Warenhaus.createMarker",root,function(type)
	if(isElement(Warenhaus.marker))then destroyElement(Warenhaus.marker)end
	if(isElement(Warenhaus.blip))then destroyElement(Warenhaus.blip)end
	
	if(type)then
		local faction = getElementData(localPlayer,"Fraktion")
		local x,y,z = Fraktionssystem["Abgabemarker"][faction][1],Fraktionssystem["Abgabemarker"][faction][2],Fraktionssystem["Abgabemarker"][faction][3]
		Warenhaus.marker = createMarker(x,y,z,"checkpoint",3,255,0,0)
		Warenhaus.blip = createBlip(x,y,z,0,2,255,0,0)
		
		addEventHandler("onClientMarkerHit",Warenhaus.marker,function(player)
			if(player == localPlayer)then
				triggerServerEvent("Warenhaus.abgabe",localPlayer)
			end
		end)
	end
end)