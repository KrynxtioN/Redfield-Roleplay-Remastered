-- [[ DAS FENSTER ]] --

addEvent("Hotel.openWindow",true)
addEventHandler("Hotel.openWindow",root,function(preis)
	if(isWindowOpen())then
        GUIEditor.window[1] = guiCreateWindow(388, 265, 338, 146, loc("Haussystem_23"), false)

        GUIEditor.label[1] = guiCreateLabel(10, 28, 318, 38, loc("Haussystem_24"):format(preis), false, GUIEditor.window[1])
        GUIEditor.button[1] = guiCreateButton(10, 76, 155, 25, loc("Haussystem_25"), false, GUIEditor.window[1])
        GUIEditor.button[2] = guiCreateButton(173, 76, 155, 25, loc("Haussystem_26"), false, GUIEditor.window[1])
        GUIEditor.button[3] = guiCreateButton(10, 111, 318, 25, loc("Haussystem_27"), false, GUIEditor.window[1])
		setWindowDatas(1)
		
		for i = 1,2 do
			addEventHandler("onClientGUIClick",GUIEditor.button[i],function()
				triggerServerEvent("Hotel.server",localPlayer,guiGetText(source))
			end,false)
		end
		
		addEventHandler("onClientGUIClick",GUIEditor.button[3],function()
			triggerServerEvent("Hotel.setSpawnpoint",localPlayer)
		end,false)
	end
end)