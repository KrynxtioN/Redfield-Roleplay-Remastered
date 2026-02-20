-- [[ DAS FENSTER ]] --

addEvent("Questsystem.openPedWindow",true)
addEventHandler("Questsystem.openPedWindow",root,function(Name,Belohnung,Menge,Aufgabe1)
	if(isWindowOpen())then
        GUIEditor.window[1] = guiCreateWindow(455, 276, 414, 220, loc("Errungenschaften_36"), false)

        GUIEditor.label[1] = guiCreateLabel(10, 29, 394, 33, loc("Errungenschaften_37"):format(Name,Belohnung,Menge), false, GUIEditor.window[1])
        GUIEditor.label[2] = guiCreateLabel(10, 72, 394, 16, "_______________________________________________________________________", false, GUIEditor.window[1])
        GUIEditor.button[1] = guiCreateButton(10, 177, 394, 33, loc("Errungenschaften_38"), false, GUIEditor.window[1])
        GUIEditor.label[3] = guiCreateLabel(10, 98, 394, 69, loc("Errungenschaften_39"):format(Aufgabe1), false, GUIEditor.window[1])
		setWindowDatas(3)
		
		addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
			triggerServerEvent("Questsystem.accept",localPlayer)
		end,false)
	end
end)

-- [[ ALLE QUESTS IM ÜBERBLICK ]] --

bindKey("f6","down",function()
	if(isWindowOpen())then
        GUIEditor.window[1] = guiCreateWindow(404, 245, 566, 360, loc("Errungenschaften_40"), false)

        GUIEditor.gridlist[1] = guiCreateGridList(10, 27, 278, 323, false, GUIEditor.window[1])
        name = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Errungenschaften_41"), 0.5)
        stufe = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Errungenschaften_42"), 0.5)
		id = guiGridListAddColumn(GUIEditor.gridlist[1],loc("Errungenschaften_43"),0.3)
        GUIEditor.label[1] = guiCreateLabel(298, 27, 258, 288, loc("Errungenschaften_44"), false, GUIEditor.window[1])
        GUIEditor.button[1] = guiCreateButton(298, 325, 258, 25, loc("Errungenschaften_45"), false, GUIEditor.window[1])
		setWindowDatas(1)
		triggerServerEvent("Questsystem.getDatas",localPlayer,localPlayer)
		
		addEventHandler("onClientGUIClick",GUIEditor.gridlist[1],function()
			local clicked = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),3)
			if(clicked ~= "")then
				triggerServerEvent("Questsystem.getText",localPlayer,clicked)
			end
		end,false)
		
		addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
			local clicked = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),3)
			if(clicked ~= "")then
				triggerServerEvent("Questsystem.belohnung",localPlayer,clicked)
			end
		end,false)
	end
end)

addEvent("Questsystem.setDatas",true)
addEventHandler("Questsystem.setDatas",root,function(quests)
	guiGridListClear(GUIEditor.gridlist[1])
	if(#quests >= 1)then
		for _,v in pairs(quests)do
			local row = guiGridListAddRow(GUIEditor.gridlist[1])
			guiGridListSetItemText(GUIEditor.gridlist[1],row,name,v[1],false,false)
			guiGridListSetItemText(GUIEditor.gridlist[1],row,stufe,v[2],false,false)
			guiGridListSetItemText(GUIEditor.gridlist[1],row,id,v[3],false,false)
		end
	end
end)

addEvent("Questsystem.setText",true)
addEventHandler("Questsystem.setText",root,function(text)
	guiSetText(GUIEditor.label[1],text)
end)