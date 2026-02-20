-- [[ DAS FENSTER ]] --

addEvent("Drogentransporter.createWindow",true)
addEventHandler("Drogentransporter.createWindow",root,function()
	if(isWindowOpen())then
        GUIEditor.window[1] = guiCreateWindow(456, 306, 412, 198,loc("Fraktionen_8"), false)

		GUIEditor.label[1] = guiCreateLabel(10, 27, 392, 85, loc("Fraktionen_9"):format(Drogentransporter.preis,Drogentransporter.costs), false, GUIEditor.window[1])
        GUIEditor.label[2] = guiCreateLabel(10, 122, 96, 28, loc("Fraktionen_10"), false, GUIEditor.window[1])
        GUIEditor.edit[1] = guiCreateEdit(116, 122, 286, 28, "", false, GUIEditor.window[1])
        GUIEditor.button[1] = guiCreateButton(9, 160, 192, 28, loc("Fraktionen_11"), false, GUIEditor.window[1])
        GUIEditor.button[2] = guiCreateButton(210, 160, 192, 28, loc("Fraktionen_12"), false, GUIEditor.window[1])
		setWindowDatas(2)
		
		addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
			local menge = guiGetText(GUIEditor.edit[1])
			if(#menge >= 1 and tonumber(menge))then
				triggerServerEvent("Drogentransporter.beladen",localPlayer,menge,"Kaufen")
			end
		end,false)
		
		addEventHandler("onClientGUIClick",GUIEditor.button[2],function()
			local menge = guiGetText(GUIEditor.edit[1])
			if(#menge >= 1 and tonumber(menge))then
				triggerServerEvent("Drogentransporter.beladen",localPlayer,menge,"Verkaufen")
			end
		end,false)
	end
end)

-- [[ ABGABEMARKER ERSTELLEN / LÖSCHEN ]] --

addEvent("Drogentransporter.marker",true)
addEventHandler("Drogentransporter.marker",root,function(type)
	if(isElement(Drogentransporter.marker))then destroyElement(Drogentransporter.marker)end
	if(isElement(Drogentransporter.blip))then destroyElement(Drogentransporter.blip)end
	
	if(type == "create")then
		local faction = getElementData(localPlayer,"Fraktion")
		local x,y,z = Fraktionssystem["Abgabemarker"][faction][1],Fraktionssystem["Abgabemarker"][faction][2],Fraktionssystem["Abgabemarker"][faction][3]
		Drogentransporter.marker = createMarker(x,y,z,"checkpoint",3,255,0,0)
		Drogentransporter.blip = createBlip(x,y,z,0,2,255,0,0)
		
		addEventHandler("onClientMarkerHit",Drogentransporter.marker,function(player)
			if(player == localPlayer)then
				triggerServerEvent("Drogentransporter.abgabe",localPlayer)
			end
		end)
	end
end)