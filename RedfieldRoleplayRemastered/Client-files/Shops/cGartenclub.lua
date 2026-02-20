-- [[ DAS FENSTER ]] --

addEvent("Gartenclub.openWindow",true)
addEventHandler("Gartenclub.openWindow",root,function()
	if(isWindowOpen())then
        GUIEditor.window[1] = guiCreateWindow(496, 312, 348, 307, loc("Shops_57"), false)

        GUIEditor.gridlist[1] = guiCreateGridList(10, 27, 328, 190, false, GUIEditor.window[1])
        artikel = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Shops_58"), 0.4)
        preis = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Shops_59"), 0.3)
        lagerbestand = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Shops_60"), 0.3)
        GUIEditor.label[1] = guiCreateLabel(10, 227, 125, 30, loc("Shops_61"), false, GUIEditor.window[1])
        GUIEditor.edit[1] = guiCreateEdit(145, 227, 193, 30, "", false, GUIEditor.window[1])
        GUIEditor.button[1] = guiCreateButton(10, 267, 328, 30, loc("Shops_62"), false, GUIEditor.window[1])
		setWindowDatas(1)
		triggerServerEvent("Gartenclub.getDatas",localPlayer,localPlayer)
		
		addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
			local clicked = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),1)
			if(clicked ~= "")then
				local menge = guiGetText(GUIEditor.edit[1])
				if(#menge >= 1 and tonumber(menge))then
					triggerServerEvent("Gartenclub.buy",localPlayer,clicked,menge)
				else infobox(loc("Shops_63"),"error")end
			end
		end,false)
	end
end)

-- [[ LISTE AKTUALISIEREN ]] --

addEvent("Gartenclub.setDatas",true)
addEventHandler("Gartenclub.setDatas",root,function(datas)
	guiGridListClear(GUIEditor.gridlist[1])
	if(#datas >= 1)then
		for i,v in pairs(datas)do
			local row = guiGridListAddRow(GUIEditor.gridlist[1])
			guiGridListSetItemText(GUIEditor.gridlist[1],row,artikel,v[1],false,false)
			guiGridListSetItemText(GUIEditor.gridlist[1],row,preis,"$"..v[3],false,false)
			guiGridListSetItemText(GUIEditor.gridlist[1],row,lagerbestand,v[2],false,false)
		end
	end
end)