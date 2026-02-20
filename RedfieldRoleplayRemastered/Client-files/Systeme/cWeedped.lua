-- [[ DAS FENSTER ]] --

addEvent("Weedped.openWindow",true)
addEventHandler("Weedped.openWindow",root,function(preis)
	if(isWindowOpen())then
		GUIEditor.window[1] = guiCreateWindow(396, 146, 293, 150, loc("Systeme_195"), false)

		GUIEditor.label[1] = guiCreateLabel(10, 28, 273, 43, loc("Systeme_196"):format(preis), false, GUIEditor.window[1])
		GUIEditor.label[2] = guiCreateLabel(10, 81, 117, 25, loc("Systeme_197"), false, GUIEditor.window[1])
		GUIEditor.edit[1] = guiCreateEdit(137, 81, 146, 25, "", false, GUIEditor.window[1])
		GUIEditor.button[1] = guiCreateButton(10, 116, 273, 24, loc("Systeme_198"), false, GUIEditor.window[1])
		setWindowDatas(2)
			
		addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
			local edit = guiGetText(GUIEditor.edit[1])
			if(#edit >= 1 and tonumber(edit))then
				triggerServerEvent("Weedped.sell",localPlayer,edit)
			end
		end,false)
	end
end)