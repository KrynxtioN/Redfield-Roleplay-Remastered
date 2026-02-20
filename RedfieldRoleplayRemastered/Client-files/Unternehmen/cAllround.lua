-- [[ DAS FENSTER ]] --

addEvent("Unternehmen.openDuty",true)
addEventHandler("Unternehmen.openDuty",root,function()
	if(isWindowOpen())then
        GUIEditor.window[1] = guiCreateWindow(505, 359, 207, 69, loc("Unternehmen_1"), false)

        GUIEditor.button[1] = guiCreateButton(10, 24, 187, 35, loc("Unternehmen_2"), false, GUIEditor.window[1])
		setWindowDatas()
	
		if(getElementData(localPlayer,"UDuty") == true)then
			guiSetText(GUIEditor.button[1],loc("Unternehmen_3"))
		end
		
		addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
			triggerServerEvent("Unternehmen.duty",localPlayer)
		end,false)
	end
end)