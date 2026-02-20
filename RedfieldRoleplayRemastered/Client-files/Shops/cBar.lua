-- [[ DAS FENSTER ]] --

addEvent("Bar.openWindow",true)
addEventHandler("Bar.openWindow",root,function()
	if(isWindowOpen())then
        GUIEditor.window[1] = guiCreateWindow(498, 238, 323, 306, loc("Shops_106"), false)

        GUIEditor.gridlist[1] = guiCreateGridList(10, 27, 303, 231, false, GUIEditor.window[1])
        drink = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Shops_107"), 0.3)
        preis = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Shops_108"), 0.3)
        lager = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Shops_109"), 0.3)
        GUIEditor.button[1] = guiCreateButton(10, 268, 303, 28, loc("Shops_110"), false, GUIEditor.window[1])
		setWindowDatas()
		triggerServerEvent("Bar.getDatas",localPlayer,localPlayer)
		
		addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
			local clicked = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),1)
			if(clicked ~= "")then
				triggerServerEvent("Bar.buyDrink",localPlayer,clicked)
			end
		end,false)
	end
end)

-- [[ LISTE AKTUALISIEREN ]] --

addEvent("Bar.setDatas",true)
addEventHandler("Bar.setDatas",root,function(datas)
	guiGridListClear(GUIEditor.gridlist[1])
	if(#datas >= 1)then
		for i,v in pairs(datas)do
			local row = guiGridListAddRow(GUIEditor.gridlist[1])
			guiGridListSetItemText(GUIEditor.gridlist[1],row,drink,v[1],false,false)
			guiGridListSetItemText(GUIEditor.gridlist[1],row,preis,"$"..v[3],false,false)
			guiGridListSetItemText(GUIEditor.gridlist[1],row,lager,v[2],false,false)
		end
	end
end)