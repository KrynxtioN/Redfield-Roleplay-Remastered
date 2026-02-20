-- [[ DAS FENSTER ]] --

addEvent("Fraktionsfahrzeughaendler.openWindow",true)
addEventHandler("Fraktionsfahrzeughaendler.openWindow",root,function(model,preis)
	if(isWindowOpen())then
        GUIEditor.window[1] = guiCreateWindow(514, 393, 281, 152, loc("Fraktionen_59"), false)

        GUIEditor.button[1] = guiCreateButton(10, 110, 261, 32, loc("Fraktionen_60"), false, GUIEditor.window[1])
        GUIEditor.label[1] = guiCreateLabel(10, 27, 261, 73, loc("Fraktionen_61"):format(getVehicleNameFromModel(model),preis), false, GUIEditor.window[1])
		setWindowDatas(1)
		
		addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
			triggerServerEvent("Fraktionsfahrzeughaendler.buy",localPlayer,model,preis)
		end,false)
	end
end)