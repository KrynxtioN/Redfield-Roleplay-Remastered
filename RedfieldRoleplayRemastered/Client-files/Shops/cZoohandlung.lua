-- [[ DAS FENSTER ]] --

addEvent("Zoohandlung.openWindow",true)
addEventHandler("Zoohandlung.openWindow",root,function()
	if(isWindowOpen())then
        GUIEditor.window[1] = guiCreateWindow(530, 268, 369, 360, loc("Shops_93"), false)

        GUIEditor.gridlist[1] = guiCreateGridList(10, 27, 349, 238, false, GUIEditor.window[1])
        tier = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Shops_94"), 0.3)
        preis = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Shops_95"), 0.3)
        lagerbestand = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Shops_96"), 0.3)
        GUIEditor.label[1] = guiCreateLabel(10, 275, 162, 30, loc("Shops_97"), false, GUIEditor.window[1])
        GUIEditor.edit[1] = guiCreateEdit(182, 275, 177, 30, "", false, GUIEditor.window[1])
        GUIEditor.button[1] = guiCreateButton(10, 315, 349, 35, loc("Shops_98"), false, GUIEditor.window[1])
		setWindowDatas(1)
		triggerServerEvent("Zoohandlung.getDatas",localPlayer,localPlayer)
		
		addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
			local clicked = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),1)
			local edit = guiGetText(GUIEditor.edit[1])
			if(clicked ~= "")then
				triggerServerEvent("Zoohandlung.buy",localPlayer,clicked,edit)
			else infobox(loc("Shops_99"),"error")end
		end,false)
    end
end)

-- [[ LISTE AKTUALISIEREN ]] --

addEvent("Zoohandlung.setDatas",true)
addEventHandler("Zoohandlung.setDatas",root,function(datas)
	guiGridListClear(GUIEditor.gridlist[1])
	if(#datas >= 1)then
		for _,v in pairs(datas)do
			local row = guiGridListAddRow(GUIEditor.gridlist[1])
			guiGridListSetItemText(GUIEditor.gridlist[1],row,tier,v[1],false,false)
			guiGridListSetItemText(GUIEditor.gridlist[1],row,preis,"$"..v[3],false,false)
			guiGridListSetItemText(GUIEditor.gridlist[1],row,lagerbestand,v[2],false,false)
		end
	end
end)