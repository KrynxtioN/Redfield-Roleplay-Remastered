-- [[ DAS FENSTER ]] --

addEvent("Personalien.openWindow",true)
addEventHandler("Personalien.openWindow",root,function()
	if(isWindowOpen())then
        GUIEditor.window[1] = guiCreateWindow(420, 240, 369, 104, loc("Systeme_70"), false)

        GUIEditor.button[1] = guiCreateButton(9, 30, 350, 27, loc("Systeme_71"), false, GUIEditor.window[1])
        GUIEditor.button[2] = guiCreateButton(9, 67, 350, 27, loc("Systeme_72"), false, GUIEditor.window[1])
		setWindowDatas()
		
		for i = 1,2 do
			addEventHandler("onClientGUIClick",GUIEditor.button[i],function()
				triggerServerEvent("Personalien.server",localPlayer,guiGetText(source))
			end,false)
		end
    end
end)
