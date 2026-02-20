-- [[ DAS FENSTER ]] --

addEvent("Haussystem.openWindow",true)
addEventHandler("Haussystem.openWindow",root,function(datas)
	if(isWindowOpen())then
        GUIEditor.window[1] = guiCreateWindow(433, 403, 342, 170, loc("Haussystem_1"):format(getElementData(localPlayer,"HouseID")), false)
        GUIEditor.label[1] = guiCreateLabel(10, 27, 322, 51, loc("Haussystem_2"):format(datas[2],datas[1],datas[3],datas[4]), false, GUIEditor.window[1])
        GUIEditor.button[1] = guiCreateButton(10, 129, 157, 31, loc("Haussystem_3"), false, GUIEditor.window[1])
        GUIEditor.button[2] = guiCreateButton(176, 129, 156, 31, loc("Haussystem_4"), false, GUIEditor.window[1])
        GUIEditor.button[3] = guiCreateButton(10, 88, 157, 31, loc("Haussystem_5"), false, GUIEditor.window[1])
        GUIEditor.button[4] = guiCreateButton(176, 88, 156, 31, loc("Haussystem_6"), false, GUIEditor.window[1])
		setWindowDatas(1)
		
		if(datas[2] ~= "Niemand")then
			if(datas[2] == getPlayerName(localPlayer))then
				guiSetText(GUIEditor.button[3],"Verkaufen")
			else
				guiSetText(GUIEditor.button[3],"-")
			end
		end
		
		addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
			triggerServerEvent("Haussystem.lock",localPlayer)
		end,false)
		
		addEventHandler("onClientGUIClick",GUIEditor.button[2],function()
			triggerServerEvent("Haussystem.in",localPlayer)
		end,false)
		
		addEventHandler("onClientGUIClick",GUIEditor.button[3],function()
			if(guiGetText(GUIEditor.button[3]) ~= "-")then
				triggerServerEvent("Haussystem.server",localPlayer,guiGetText(GUIEditor.button[3]))
			end
		end,false)
		
		addEventHandler("onClientGUIClick",GUIEditor.button[4],function()
			triggerServerEvent("Haussystem.mieten",localPlayer)
		end,false)
    end
end)

-- [[ DIE HAUSVERWALTUNG ]] --

addEvent("Haussystem.verwaltung",true)
addEventHandler("Haussystem.verwaltung",root,function(datas,mieter)
	if(isWindowOpen())then
        GUIEditor.window[1] = guiCreateWindow(505, 179, 692, 286, loc("Haussystem_7"), false)

        GUIEditor.label[1] = guiCreateLabel(10, 27, 189, 23, loc("Haussystem_8"), false, GUIEditor.window[1])
        GUIEditor.gridlist[1] = guiCreateGridList(10, 60, 189, 216, false, GUIEditor.window[1])
        spieler = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Haussystem_9"), 0.9)

        GUIEditor.label[2] = guiCreateLabel(209, 27, 220, 23, loc("Haussystem_10"):format(datas[1],datas[2]), false, GUIEditor.window[1])
        GUIEditor.label[3] = guiCreateLabel(209, 60, 97, 31, loc("Haussystem_11"), false, GUIEditor.window[1])
        GUIEditor.button[1] = guiCreateButton(209, 101, 220, 27, loc("Haussystem_12"), false, GUIEditor.window[1])
        GUIEditor.edit[1] = guiCreateEdit(316, 60, 113, 31, "", false, GUIEditor.window[1])
        GUIEditor.button[2] = guiCreateButton(209, 138, 220, 27, loc("Haussystem_13"), false, GUIEditor.window[1])
        GUIEditor.button[3] = guiCreateButton(209, 175, 220, 27, loc("Haussystem_14"), false, GUIEditor.window[1])
        GUIEditor.button[4] = guiCreateButton(209, 249, 220, 27, loc("Haussystem_15"), false, GUIEditor.window[1])
        GUIEditor.button[5] = guiCreateButton(209, 212, 220, 27, loc("Haussystem_16"), false, GUIEditor.window[1])
        GUIEditor.memo[1] = guiCreateMemo(439, 60, 243, 179, datas[3], false, GUIEditor.window[1])
        guiMemoSetReadOnly(GUIEditor.memo[1], true)
        GUIEditor.label[4] = guiCreateLabel(439, 27, 243, 23, loc("Haussystem_17"), false, GUIEditor.window[1])
        GUIEditor.button[6] = guiCreateButton(439, 249, 243, 27, loc("Haussystem_18"), false, GUIEditor.window[1])
		
		setWindowDatas(4)
		
		if(#mieter >= 1)then
			for i,v in pairs(mieter)do
				local row = guiGridListAddRow(GUIEditor.gridlist[1])
				guiGridListSetItemText(GUIEditor.gridlist[1],row,spieler,v,false,false)
			end
		end
		
		addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
			local miete = guiGetText(GUIEditor.edit[1])
			if(#miete >= 1 and tonumber(miete))then
				triggerServerEvent("Haussystem.changeMiete",localPlayer,miete)
			end
		end,false)
		
		addEventHandler("onClientGUIClick",GUIEditor.button[2],function()
			triggerServerEvent("Haussystem.update",localPlayer)
		end,false)
		
		addEventHandler("onClientGUIClick",GUIEditor.button[3],function()
			local clicked = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),1)
			if(clicked ~= "")then
				triggerServerEvent("Haussystem.kickMieter",localPlayer,clicked)
			end
		end,false)
		
		addEventHandler("onClientGUIClick",GUIEditor.button[4],function()
			triggerServerEvent("Haussystem.spawnInHouse",localPlayer)
		end,false)
		
		addEventHandler("onClientGUIClick",GUIEditor.button[5],function()
			triggerServerEvent("Waffenbox.openWindow",localPlayer,localPlayer,false)
		end,false)
		
		addEventHandler("onClientGUIClick",GUIEditor.button[6],function()
			if(datas[4] == getPlayerName(localPlayer))then
				if(guiGetText(GUIEditor.button[6]) == "Haushaltsregeln bearbeiten")then
					guiMemoSetReadOnly(GUIEditor.memo[1],false)
					guiSetText(GUIEditor.button[6],loc("Haussystem_19"))
				else
					guiMemoSetReadOnly(GUIEditor.memo[1],true)
					guiSetText(GUIEditor.button[6],loc("Haussystem_20"))
					triggerServerEvent("Haussystem.saveText",localPlayer,guiGetText(GUIEditor.memo[1]))
				end
			else infobox(loc("Haussystem_21"),"error")end
		end,false)
	end
end)

-- [[ MIETE AKTUALISIEREN ]] --

addEvent("refreshHouseMiete",true)
addEventHandler("refreshHouseMiete",root,function(level,miete)
	guiSetText(GUIEditor.label[2],loc("Haussystem_22"):format(level,miete))
end)