-- [[ DAS FENSTER ]] --

addEvent("Fraktionssystem.openDuty",true)
addEventHandler("Fraktionssystem.openDuty",root,function(rearms)
	if(isWindowOpen())then
        GUIEditor.window[1] = guiCreateWindow(517, 366, 285, 139, loc("Fraktionen_54"), false)

        GUIEditor.button[1] = guiCreateButton(9, 96, 267, 33, loc("Fraktionen_55"), false, GUIEditor.window[1])
        GUIEditor.button[2] = guiCreateButton(9, 53, 267, 33, loc("Fraktionen_56"), false, GUIEditor.window[1])
        GUIEditor.label[1] = guiCreateLabel(10, 26, 266, 17, loc("Fraktionen_57"):format(rearms), false, GUIEditor.window[1])    
		setWindowDatas(1)
		
		if(getElementData(localPlayer,"FDuty") == true)then
			guiSetText(GUIEditor.button[2],"Dienst verlassen")
		end
		
		addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
			triggerServerEvent("FDuty.rearm",localPlayer)
		end,false)
		
		addEventHandler("onClientGUIClick",GUIEditor.button[2],function()
			triggerServerEvent("FDuty.duty",localPlayer)
		end,false)
	end
end)

-- [[ DEN LAGERTEXT REFRESHEN ]] --

addEvent("FDuty.refresh",true)
addEventHandler("FDuty.refresh",root,function(rearms)
	guiSetText(GUIEditor.label[1],loc("Fraktionen_58"):format(rearms))
end)