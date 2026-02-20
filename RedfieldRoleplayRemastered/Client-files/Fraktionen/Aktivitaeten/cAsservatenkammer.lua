-- [[ KEYPAD ]] --

addEvent("Asservatenkammer.openKeypad",true)
addEventHandler("Asservatenkammer.openKeypad",root,function()
	if(isWindowOpen())then
        GUIEditor.window[1] = guiCreateWindow(415, 263, 297, 109, loc("Fraktionen_23"), false)

        GUIEditor.label[1] = guiCreateLabel(10, 28, 85, 32, loc("Fraktionen_24"), false, GUIEditor.window[1])
        GUIEditor.edit[1] = guiCreateEdit(105, 28, 182, 32, "", false, GUIEditor.window[1])
        GUIEditor.button[1] = guiCreateButton(10, 70, 277, 29, loc("Fraktionen_25"), false, GUIEditor.window[1])
		setWindowDatas(1)
		
		addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
			local code = guiGetText(GUIEditor.edit[1])
			if(#code >= 1 and isOnlyNumbers(code))then
				triggerServerEvent("Asservatenkammer.openDoor",localPlayer,code)
			end
		end,false)
    end
end)