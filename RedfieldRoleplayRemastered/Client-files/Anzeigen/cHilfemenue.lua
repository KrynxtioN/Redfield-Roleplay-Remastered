-- [[ DAS FENSTER ]] --

bindKey("F1","down",function()
	if(isWindowOpen())then
        GUIEditor.window[1] = guiCreateWindow(375, 200, 611, 359, loc("Anzeigen_1"), false)

        GUIEditor.gridlist[1] = guiCreateGridList(10, 28, 208, 321, false, GUIEditor.window[1])
        kategorie = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Anzeigen_2"), 1.5)
        GUIEditor.memo[1] = guiCreateMemo(228, 28, 373, 321, loc("Anzeigen_3"), false, GUIEditor.window[1])
		guiMemoSetReadOnly(GUIEditor.memo[1],true)
		setWindowDatas()
		
		local Language = getElementData(localPlayer,"Language")
		if(not(Hilfemenue["Kategorien"][Language]))then Language = 1 end
		for _,v in pairs(Hilfemenue["Kategorien"][Language])do
			local row = guiGridListAddRow(GUIEditor.gridlist[1])
			guiGridListSetItemText(GUIEditor.gridlist[1],row,kategorie,v,false,false)
		end
		
		addEventHandler("onClientGUIClick",GUIEditor.gridlist[1],function()
			local clicked = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),1)
			if(clicked ~= "")then
				guiSetText(GUIEditor.memo[1],Hilfemenue["Texte"][Language][clicked])
			end
		end,false)
    end
end)