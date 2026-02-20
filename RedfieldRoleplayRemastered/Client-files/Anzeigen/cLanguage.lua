Languages = {"DE"}

function openLanguageWindow()
	if(isWindowOpen())then
		outputChatBox(getElementData(localPlayer,"Language"))
        GUIEditor.window[1] = guiCreateWindow(467, 180, 314, 247, loc("Anzeigen_10"), false)

        GUIEditor.gridlist[1] = guiCreateGridList(10, 27, 294, 174, false, GUIEditor.window[1])
        local ID = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Anzeigen_11"), 0.3)
        local sprache = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Anzeigen_12"), 0.6)
        GUIEditor.button[1] = guiCreateButton(10, 211, 294, 26, loc("Anzeigen_13"), false, GUIEditor.window[1])
		setWindowDatas()
		
		for i,v in ipairs(Languages)do
			local row = guiGridListAddRow(GUIEditor.gridlist[1])
			guiGridListSetItemText(GUIEditor.gridlist[1],row,ID,i,false,false)
			guiGridListSetItemText(GUIEditor.gridlist[1],row,sprache,v,false,false)
		end
		
		addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
			local clicked = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),1)
			if(clicked ~= "")then
				setElementData(localPlayer,"Language",clicked)
				infobox(loc("Anzeigen_14"),"info")
			else infobox(loc("Anzeigen_15"),"error")end
		end,false)
    end
end
addCommandHandler("language",openLanguageWindow)