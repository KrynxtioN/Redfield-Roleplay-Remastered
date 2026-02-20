-- [[ DAS FENSTER ]] --

addEvent("Business.openWindow",true)
addEventHandler("Business.openWindow",root,function(besitzer,preis,name,business)
	if(isWindowOpen())then
		if(getElementData(localPlayer,"Unternehmen") == 4 and getElementData(localPlayer,"UDuty") == true and getElementData(localPlayer,"TruckerBestellungName") and getElementData(localPlayer,"TruckerBestellungName") == business)then
			GUIEditor.window[1] = guiCreateWindow(505, 359, 207, 69, loc("Shops_26"), false)

			GUIEditor.button[1] = guiCreateButton(10, 24, 187, 35, loc("Shops_27"), false, GUIEditor.window[1])
			setWindowDatas()
			
			addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
				triggerServerEvent("Trucker.lieferungAbgabe",localPlayer)
			end,false)
		else
			if(besitzer == "Niemand")then
				GUIEditor.window[1] = guiCreateWindow(429, 221, 315, 142, loc("Shops_28"), false)

				GUIEditor.label[1] = guiCreateLabel(10, 31, 295, 64, loc("Shops_29"):format(name,preis), false, GUIEditor.window[1])
				GUIEditor.button[1] = guiCreateButton(89, 105, 138, 27, loc("Shops_30"), false, GUIEditor.window[1])
				setWindowDatas(1)
				
				addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
					triggerServerEvent("Business.buy",localPlayer,"Kaufen")
				end,false)
			else
				if(besitzer == getPlayerName(localPlayer))then
					Business.verwaltung()
				else infobox(loc("Shops_31"):format(name,besitzer),"info")end
			end
		end
    end
end)

-- [[ FENSTER DER BUSINESSVERWALTUNG ]] --

function Business.verwaltung()
	GUIEditor.window[1] = guiCreateWindow(353, 292, 604, 340, loc("Shops_32"), false)

	GUIEditor.tabpanel[1] = guiCreateTabPanel(10, 24, 584, 306, false, GUIEditor.window[1])

	GUIEditor.tab[1] = guiCreateTab(loc("Shops_33"), GUIEditor.tabpanel[1])

	GUIEditor.label[1] = guiCreateLabel(10, 10, 564, 25, loc("Shops_34"), false, GUIEditor.tab[1])
	GUIEditor.label[2] = guiCreateLabel(10, 45, 129, 26, loc("Shops_35"), false, GUIEditor.tab[1])
	GUIEditor.button[1] = guiCreateButton(10, 81, 277, 29, loc("Shops_36"), false, GUIEditor.tab[1])
	GUIEditor.edit[1] = guiCreateEdit(149, 45, 425, 26, "", false, GUIEditor.tab[1])
	GUIEditor.button[2] = guiCreateButton(297, 81, 277, 29, loc("Shops_37"), false, GUIEditor.tab[1])
	GUIEditor.button[6] = guiCreateButton(10, 121, 277, 29, loc("Shops_38"), false, GUIEditor.tab[1])

	GUIEditor.tab[2] = guiCreateTab(loc("Shops_39"), GUIEditor.tabpanel[1])

	GUIEditor.gridlist[1] = guiCreateGridList(10, 10, 395, 262, false, GUIEditor.tab[2])
	artikel = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Shops_40"), 0.3)
	preis = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Shops_41"), 0.2)
	lagerbestand = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Shops_42"), 0.2)
	bestellkosten = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Shops_43"), 0.2)
	GUIEditor.label[3] = guiCreateLabel(415, 10, 61, 25, loc("Shops_44"), false, GUIEditor.tab[2])
	GUIEditor.edit[2] = guiCreateEdit(486, 10, 88, 25, "", false, GUIEditor.tab[2])
	GUIEditor.button[3] = guiCreateButton(415, 45, 159, 27, loc("Shops_45"), false, GUIEditor.tab[2])
	GUIEditor.label[4] = guiCreateLabel(415, 82, 61, 25, loc("Shops_46"), false, GUIEditor.tab[2])
	GUIEditor.edit[3] = guiCreateEdit(486, 82, 88, 25, "", false, GUIEditor.tab[2])
	GUIEditor.button[4] = guiCreateButton(415, 117, 159, 27, loc("Shops_47"), false, GUIEditor.tab[2])
	GUIEditor.label[5] = guiCreateLabel(415, 154, 159, 47, loc("Shops_48"), false, GUIEditor.tab[2])

	GUIEditor.tab[3] = guiCreateTab(loc("Shops_49"), GUIEditor.tabpanel[1])

	GUIEditor.gridlist[2] = guiCreateGridList(10, 10, 564, 222, false, GUIEditor.tab[3])
	id = guiGridListAddColumn(GUIEditor.gridlist[2], loc("Shops_50"), 0.3)
	summe = guiGridListAddColumn(GUIEditor.gridlist[2], loc("Shops_51"), 0.3)
	grund = guiGridListAddColumn(GUIEditor.gridlist[2], loc("Shops_52"), 0.3)
	GUIEditor.button[5] = guiCreateButton(10, 242, 564, 30, loc("Shops_53"), false, GUIEditor.tab[3])
	
	setWindowDatas(5)
	triggerServerEvent("Business.getVerwaltungDatas",localPlayer,localPlayer)

	for i = 1,2 do
		addEventHandler("onClientGUIClick",GUIEditor.button[i],function()
			local summe = guiGetText(GUIEditor.edit[1])
			if(#summe >= 1 and tonumber(summe))then
				triggerServerEvent("Business.einAuszahlen",localPlayer,summe,guiGetText(source))
			end
		end,false)
	end
	
	addEventHandler("onClientGUIClick",GUIEditor.button[3],function()
		local summe = guiGetText(GUIEditor.edit[2])
		local clicked = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),1)
		if(#summe >= 1 and tonumber(summe) and clicked ~= "")then
			triggerServerEvent("Business.changePreis",localPlayer,clicked,summe)
		end
	end,false)
	
	addEventHandler("onClientGUIClick",GUIEditor.button[4],function()
		local menge = guiGetText(GUIEditor.edit[3])
		local clicked = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),1)
		if(#menge >= 1 and tonumber(menge) and clicked ~= "")then
			triggerServerEvent("Business.bestellen",localPlayer,clicked,menge)
		end
	end,false)
	
	addEventHandler("onClientGUIClick",GUIEditor.button[6],function()
		triggerServerEvent("Business.buy",localPlayer,"Verkaufen")
	end,false)
end
addEvent("Business.verwaltung",true)
addEventHandler("Business.verwaltung",root,Business.verwaltung)

-- [[ DIE BUSINESS-DATAS SETZEN ]] --

addEvent("Business.setVerwaltungDatas",true)
addEventHandler("Business.setVerwaltungDatas",root,function(name,kasse,lager,rechungen)
	guiGridListClear(GUIEditor.gridlist[1])
	guiGridListClear(GUIEditor.gridlist[2])
	guiSetText(GUIEditor.label[1],loc("Shops_54"):format(kasse))
	guiSetText(GUIEditor.window[1],loc("Shops_55"):format(name))
	
	if(#lager >= 1)then
		for _,v in pairs(lager)do
			local row = guiGridListAddRow(GUIEditor.gridlist[1])
			guiGridListSetItemText(GUIEditor.gridlist[1],row,artikel,v[1],false,false)
			guiGridListSetItemText(GUIEditor.gridlist[1],row,lagerbestand,v[2],false,false)
			guiGridListSetItemText(GUIEditor.gridlist[1],row,preis,"$"..v[3],false,false)
			guiGridListSetItemText(GUIEditor.gridlist[1],row,bestellkosten,"$"..v[4],false,false)
		end
	end
	
	if(#rechungen >= 1)then
		for _,v in pairs(rechnungen)do
			local row = guiGridListAddRow(GUIEditor.gridlist[2])
			guiGridListSetItemText(GUIEditor.gridlist[2],row,id,v[1],false,false)
			guiGridListSetItemText(GUIEditor.gridlist[2],row,summe,"$"..v[2],false,false)
			guiGridListSetItemText(GUIEditor.gridlist[2],row,grund,v[3],false,false)
		end
	end
end)