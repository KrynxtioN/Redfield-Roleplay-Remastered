-- [[ DAS FENSTER ]] --

addEvent("Topliste.openWindow",true)
addEventHandler("Topliste.openWindow",root,function()
	if(isWindowOpen())then
        GUIEditor.window[1] = guiCreateWindow(303, 186, 506, 276, loc("Systeme_192"), false)
        GUIEditor.gridlist[1] = guiCreateGridList(10, 25, 188, 241, false, GUIEditor.window[1])
        category = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Systeme_193"), 0.9)
        GUIEditor.label[1] = guiCreateLabel(208, 25, 288, 241, loc("Systeme_194"), false, GUIEditor.window[1])
		setWindowDatas(1)

		for _,v in pairs(Topliste)do
			local row = guiGridListAddRow(GUIEditor.gridlist[1])
			guiGridListSetItemText(GUIEditor.gridlist[1],row,category,v,false,false)
		end
		
		addEventHandler("onClientGUIClick",GUIEditor.gridlist[1],function()
			local clicked = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),1)
			if(clicked ~= "")then
				triggerServerEvent("Topliste.getDatas",localPlayer,clicked)
			end
		end,false)
	end
end)

-- [[ DIE TOPLIST-DATAS SETZEN ]] --

addEvent("Topliste.setDatas",true)
addEventHandler("Topliste.setDatas",root,function(currentTop)
	if(#currentTop >= 1)then
		local text = ""
		for i = 1,#currentTop do
			text = text.." \n"..i..". "..currentTop[i][1].." ("..currentTop[i][2]..")"
		end
		guiSetText(GUIEditor.label[1],text)
	end
end)