-- [[ DAS FENSTER ]] --

bindKey("F2","down",function()
	if(isWindowOpen())then
        GUIEditor.window[1] = guiCreateWindow(571, 259, 278, 314, loc("Systeme_95"), false)

        GUIEditor.label[1] = guiCreateLabel(10, 28, 258, 49, loc("Systeme_96"), false, GUIEditor.window[1])
        GUIEditor.gridlist[1] = guiCreateGridList(10, 87, 258, 217, false, GUIEditor.window[1])
        animation = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Systeme_97"), 0.9)
		setWindowDatas(1)
		
		for _,v in pairs(Animationen["Names"])do
			local row = guiGridListAddRow(GUIEditor.gridlist[1])
			guiGridListSetItemText(GUIEditor.gridlist[1],row,animation,v,false,false)
		end

		addEventHandler("onClientGUIDoubleClick",GUIEditor.gridlist[1],function()
			local clicked = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),1)
			if(clicked ~= "")then
				triggerServerEvent("Animationen.server",localPlayer,clicked)
			end
		end,false)
	end
end)