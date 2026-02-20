-- [[ KAUFFENSTER ]] --

addEvent("Wohnwagen.buyWindow",true)
addEventHandler("Wohnwagen.buyWindow",root,function()
	if(isWindowOpen())then
        GUIEditor.window[1] = guiCreateWindow(503, 289, 316, 140, loc("Fahrzeugsystem_31"), false)

        GUIEditor.label[1] = guiCreateLabel(10, 29, 297, 64, loc("Fahrzeugsystem_32"), false, GUIEditor.window[1])
        GUIEditor.button[1] = guiCreateButton(10, 103, 297, 27, loc("Fahrzeugsystem_33"), false, GUIEditor.window[1])
		setWindowDatas(1)
		
		addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
			triggerServerEvent("Wohnwagen.buy",localPlayer)
		end,false)
    end
end)

-- [[ WOHNWAGEMNEÜ ]] --

addEvent("Wohnwagen.openWindow",true)
addEventHandler("Wohnwagen.openWindow",root,function(besitzer)
	if(isWindowOpen())then
        GUIEditor.window[1] = guiCreateWindow(503, 186, 286, 132, loc("Fahrzeugsystem_34"), false)
		
        GUIEditor.button[1] = guiCreateButton(10, 52, 127, 30, loc("Fahrzeugsystem_35"), false, GUIEditor.window[1])
        GUIEditor.button[2] = guiCreateButton(149, 52, 127, 30, loc("Fahrzeugsystem_36"), false, GUIEditor.window[1])
        GUIEditor.button[3] = guiCreateButton(10, 92, 266, 30, loc("Fahrzeugsystem_37"), false, GUIEditor.window[1])
        GUIEditor.label[1] = guiCreateLabel(10, 26, 266, 16, loc("Fahrzeugsystem_38").." "..besitzer, false, GUIEditor.window[1])
		setWindowDatas(1)
		
		addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
			triggerServerEvent("Wohnwagen.betreten",localPlayer)
		end,false)
		
		addEventHandler("onClientGUIClick",GUIEditor.button[2],function()
			triggerServerEvent("Wohnwagen.lock",localPlayer)
		end,false)
		
		addEventHandler("onClientGUIClick",GUIEditor.button[3],function()
			triggerServerEvent("Wohnwagen.sell",localPlayer)
		end,false)
	end
end)

-- [[ WOHNWAGENVERWALTUNG ]] --

addEvent("Wohnwagen.verwaltung",true)
addEventHandler("Wohnwagen.verwaltung",root,function()
	if(isWindowOpen())then
        GUIEditor.window[1] = guiCreateWindow(435, 286, 210, 107, loc("Fahrzeugsystem_39"), false)

        GUIEditor.button[1] = guiCreateButton(10, 68, 190, 29, loc("Fahrzeugsystem_40"), false, GUIEditor.window[1])
        GUIEditor.button[2] = guiCreateButton(10, 29, 190, 29, loc("Fahrzeugsystem_41"), false, GUIEditor.window[1])
		setWindowDatas()
		
		addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
			triggerServerEvent("Wohnwagen.verlassen",localPlayer)
		end,false)
		
		addEventHandler("onClientGUIClick",GUIEditor.button[2],function()
			triggerServerEvent("Wohnwagen.changeSpawn",localPlayer)
		end,false)
	end
end)