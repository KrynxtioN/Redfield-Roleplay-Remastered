-- [[ DAS FENSTER ]] --

addEvent("Tankstellen.openShop",true)
addEventHandler("Tankstellen.openShop",root,function()
	if(isWindowOpen())then
        GUIEditor.window[1] = guiCreateWindow(512, 224, 316, 324, loc("Shops_88"), false)

        GUIEditor.gridlist[1] = guiCreateGridList(9, 25, 297, 249, false, GUIEditor.window[1])
        item = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Shops_89"), 0.4)
        preis = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Shops_90"), 0.2)
        lagerbestand = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Shops_91"), 0.3)
        GUIEditor.button[1] = guiCreateButton(9, 284, 297, 30, loc("Shops_92"), false, GUIEditor.window[1])
		setWindowDatas()
		triggerServerEvent("Tankstellen.getDatas",localPlayer,localPlayer)
		
		addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
			local clicked = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),1)
			if(clicked ~= "")then
				triggerServerEvent("Tankstellen.buyShop",localPlayer,clicked,menge)
			end
		end,false)
    end
end)

-- [[ LISTE AKTUALISIEREN ]] --

addEvent("Tankstellen.setDatas",true)
addEventHandler("Tankstellen.setDatas",root,function(datas)
	guiGridListClear(GUIEditor.gridlist[1])
	if(#datas >= 1)then
		for _,v in pairs(datas)do
			local row = guiGridListAddRow(GUIEditor.gridlist[1])
			guiGridListSetItemText(GUIEditor.gridlist[1],row,item,v[1],false,false)
			guiGridListSetItemText(GUIEditor.gridlist[1],row,preis,"$"..v[3],false,false)
			guiGridListSetItemText(GUIEditor.gridlist[1],row,lagerbestand,v[2],false,false)
		end
	end
end)