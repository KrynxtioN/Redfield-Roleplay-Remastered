-- [[ DAS FENSTER ]] --

addEvent("Tankstellen.openWindow",true)
addEventHandler("Tankstellen.openWindow",root,function(benzin,preis)
	if(isWindowOpen())then
		setElementData(localPlayer,"Tankstelle",true)
        GUIEditor.window[1] = guiCreateWindow(262, 209, 368, 176, loc("Fahrzeugsystem_26"), false)

        GUIEditor.label[1] = guiCreateLabel(10, 27, 348, 31, loc("Fahrzeugsystem_27"):format(benzin,preis), false, GUIEditor.window[1])
        GUIEditor.button[1] = guiCreateButton(10, 141, 348, 25, loc("Fahrzeugsystem_28"), false, GUIEditor.window[1])
        GUIEditor.button[2] = guiCreateButton(10, 106, 348, 25, loc("Fahrzeugsystem_29"), false, GUIEditor.window[1])
        GUIEditor.label[2] = guiCreateLabel(10, 68, 131, 28, loc("Fahrzeugsystem_30"), false, GUIEditor.window[1])
        GUIEditor.edit[1] = guiCreateEdit(151, 68, 207, 28, "", false, GUIEditor.window[1])
		setWindowDatas(2)
		
		addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
			triggerServerEvent("Tankstellen.server",localPlayer,"Volltanken")
		end,false)
		
		addEventHandler("onClientGUIClick",GUIEditor.button[2],function()
			local liter = guiGetText(GUIEditor.edit[1])
			if(#liter >= 1 and isOnlyNumbers(liter) and #liter <= 100)then
				triggerServerEvent("Tankstellen.server",localPlayer,"Tanken",liter)
			end
		end,false)
    end
end)