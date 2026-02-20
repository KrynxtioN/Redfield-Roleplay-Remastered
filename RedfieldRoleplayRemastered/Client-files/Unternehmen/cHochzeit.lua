-- [[ DAS FENSTER ]] --

addEvent("Hochzeit.openWindow",true)
addEventHandler("Hochzeit.openWindow",root,function()
	if(isWindowOpen())then
        GUIEditor.window[1] = guiCreateWindow(372, 282, 435, 147, loc("Unternehmen_16"), false)

        GUIEditor.label[1] = guiCreateLabel(10, 31, 126, 29, loc("Unternehmen_17"), false, GUIEditor.window[1])
        GUIEditor.label[2] = guiCreateLabel(10, 70, 126, 29, loc("Unternehmen_18"), false, GUIEditor.window[1])
        GUIEditor.edit[1] = guiCreateEdit(146, 31, 279, 29, "", false, GUIEditor.window[1])
        GUIEditor.edit[2] = guiCreateEdit(146, 70, 279, 29, "", false, GUIEditor.window[1])
        GUIEditor.button[1] = guiCreateButton(10, 109, 204, 28, loc("Unternehmen_19"), false, GUIEditor.window[1])
        GUIEditor.button[2] = guiCreateButton(221, 109, 204, 28, loc("Unternehmen_20"), false, GUIEditor.window[1])
		setWindowDatas(2)
		
		for i = 1,2 do
			addEventHandler("onClientGUIClick",GUIEditor.button[i],function()
				local spieler1,spieler2 = guiGetText(GUIEditor.edit[1]),guiGetText(GUIEditor.edit[2])
				if(#spieler1 >= 1 and #spieler2 >= 1)then
					triggerServerEvent("Hochzeit.server",localPlayer,spieler1,spieler2,guiGetText(source))
				end
			end,false)
		end
	end
end)