-- [[ DAS FENSTER ]] --

addEvent("Ammunation.openWindow",true)
addEventHandler("Ammunation.openWindow",root,function()
	if(isWindowOpen())then
		GUIEditor.window[1] = guiCreateWindow(496, 288, 411, 255, loc("Shops_100"), false)

        GUIEditor.gridlist[1] = guiCreateGridList(9, 25, 392, 179, false, GUIEditor.window[1])
        waffe = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Shops_101"), 0.4)
        preis = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Shops_102"), 0.2)
        munition = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Shops_103"), 0.2)
        lager = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Shops_104"), 0.2)
        GUIEditor.button[1] = guiCreateButton(126, 215, 158, 30, loc("Shops_105"), false, GUIEditor.window[1])
		setWindowDatas()
		triggerServerEvent("Ammunation.getDatas",localPlayer,localPlayer)
		
		addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
			local clicked = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),1)
			if(clicked ~= "")then
				triggerServerEvent("Ammunation.buy",localPlayer,clicked)
			end
		end,false)
	end
end)

-- [[ LISTE AKTUALISIEREN ]] --

addEvent("Ammunation.setDatas",true)
addEventHandler("Ammunation.setDatas",root,function(weapons)
	guiGridListClear(GUIEditor.gridlist[1])
	if(#weapons >= 1)then
		for _,v in pairs(weapons)do
			local row = guiGridListAddRow(GUIEditor.gridlist[1])
			guiGridListSetItemText(GUIEditor.gridlist[1],row,waffe,v[1],false,false)
			guiGridListSetItemText(GUIEditor.gridlist[1],row,preis,"$"..v[2],false,false)
			guiGridListSetItemText(GUIEditor.gridlist[1],row,munition,v[3],false,false)
			guiGridListSetItemText(GUIEditor.gridlist[1],row,lager,v[4],false,false)
		end
	end
end)