-- [[ DAS FENSTER ]] --

addEvent("Drogenschiff.openWindow",true)
addEventHandler("Drogenschiff.openWindow",root,function()
	if(isWindowOpen())then
        GUIEditor.window[1] = guiCreateWindow(474, 366, 345, 170, loc("Fraktionen_1"), false)

        GUIEditor.label[1] = guiCreateLabel(10, 26, 121, 31, loc("Fraktionen_2"), false, GUIEditor.window[1])
        GUIEditor.edit[1] = guiCreateEdit(141, 26, 194, 31, "", false, GUIEditor.window[1])
        GUIEditor.label[2] = guiCreateLabel(10, 67, 325, 57, loc("Fraktionen_3"):format(math.floor( (Drogenschiff.preis/100)*150 or (7/100)*150 )), false, GUIEditor.window[1])
        GUIEditor.button[1] = guiCreateButton(10, 134, 160, 26, loc("Fraktionen_4"), false, GUIEditor.window[1])
        GUIEditor.button[2] = guiCreateButton(175, 134, 160, 26, loc("Fraktionen_5"), false, GUIEditor.window[1])
		setWindowDatas(2)
		
		if(getDistanceBetweenPoints3D(2351.6687011719,545.11804199219,1.796875,getElementPosition(localPlayer)) <= 10)then
			guiSetText(GUIEditor.label[1], loc("Fraktionen_6"):format(math.floor((Drogenschiff.preis/100)*150 or (7/100)*150)))
			guiSetText(GUIEditor.button[1],loc("Fraktionen_7"))
		end
		
		addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
			local edit = guiGetText(GUIEditor.edit[1])
			if(#edit >= 1 and isOnlyNumbers(edit))then
				triggerServerEvent("Drogenschiff.buySell",localPlayer,edit,guiGetText(source))
			end
		end,false)
		
		addEventHandler("onClientGUIClick",GUIEditor.button[2],function()
			triggerServerEvent("Drogenschiff.abfahrt",localPlayer)
		end,false)
    end
end)