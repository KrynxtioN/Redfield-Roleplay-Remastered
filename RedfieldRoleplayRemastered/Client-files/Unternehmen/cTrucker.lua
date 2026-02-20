-- [[ DAS FENSTER ]] --

addEvent("Trucker.openBestellungenWindow",true)
addEventHandler("Trucker.openBestellungenWindow",root,function(tbl)
	if(isWindowOpen())then
        GUIEditor.window[1] = guiCreateWindow(371, 246, 584, 366, loc("Unternehmen_39"), false)

        GUIEditor.gridlist[1] = guiCreateGridList(10, 28, 564, 292, false, GUIEditor.window[1])
        ID = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Unternehmen_40"), 0.2)
        Lieferort = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Unternehmen_41"), 0.2)
        Artikel = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Unternehmen_42"), 0.2)
        Menge = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Unternehmen_43"), 0.2)
        Gewinn = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Unternehmen_44"), 0.2)
        Lieferart = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Unternehmen_45"), 0.2)
        GUIEditor.button[1] = guiCreateButton(10, 331, 564, 25, loc("Unternehmen_46"), false, GUIEditor.window[1])
		setWindowDatas()
		
		if(#tbl >= 1)then
			for _,v in pairs(tbl)do
				local row = guiGridListAddRow(GUIEditor.gridlist[1])
				guiGridListSetItemText(GUIEditor.gridlist[1],row,ID,v[1],false,false)
				guiGridListSetItemText(GUIEditor.gridlist[1],row,Lieferort,v[2],false,false)
				guiGridListSetItemText(GUIEditor.gridlist[1],row,Artikel,v[3],false,false)
				guiGridListSetItemText(GUIEditor.gridlist[1],row,Menge,v[4],false,false)
				guiGridListSetItemText(GUIEditor.gridlist[1],row,Gewinn,"$"..v[5],false,false)
				guiGridListSetItemText(GUIEditor.gridlist[1],row,Lieferart,v[6],false,false)
			end
		end
		
		addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
			local clicked = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),1)
			local name = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),2)
			local artikel = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),3)
			local menge = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),4)
			local liefertyp = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),6)
			if(clicked ~= "")then
				triggerServerEvent("Trucker.lieferungBearbeiten",localPlayer,clicked,liefertyp,artikel,menge,name)
			end
		end,false)
	end
end)

-- [[ ABGABEBLIP ]] --

addEvent("Trucker.createBlip",true)
addEventHandler("Trucker.createBlip",root,function(type,x,y,z)
	if(isElement(Trucker.blip))then destroyElement(Trucker.blip)end
	if(type)then
		Trucker.blip = createBlip(x,y,z,53)
	end
end)