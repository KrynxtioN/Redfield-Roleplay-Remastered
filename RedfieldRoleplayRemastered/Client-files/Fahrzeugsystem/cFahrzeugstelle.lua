-- [[ DAS FENSTER ]] --

addEvent("Fahrzeugstelle.openWindow",true)
addEventHandler("Fahrzeugstelle.openWindow",root,function()
	if(isWindowOpen())then
        GUIEditor.window[1] = guiCreateWindow(344, 234, 616, 317, loc("Fahrzeugsystem_71"), false)

        GUIEditor.tabpanel[1] = guiCreateTabPanel(10, 24, 596, 203, false, GUIEditor.window[1])

        GUIEditor.tab[1] = guiCreateTab(loc("Fahrzeugsystem_72"), GUIEditor.tabpanel[1])

        GUIEditor.gridlist[1] = guiCreateGridList(10, 10, 576, 158, false, GUIEditor.tab[1])
        PrivatID = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Fahrzeugsystem_73"), 0.5)
        Privatfahrzeug = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Fahrzeugsystem_74"), 0.5)

        GUIEditor.tab[2] = guiCreateTab(loc("Fahrzeugsystem_75"), GUIEditor.tabpanel[1])

        GUIEditor.gridlist[2] = guiCreateGridList(10, 10, 576, 158, false, GUIEditor.tab[2])
        FirmaID = guiGridListAddColumn(GUIEditor.gridlist[2], loc("Fahrzeugsystem_76"), 0.5)
        FirmaFahrzeug = guiGridListAddColumn(GUIEditor.gridlist[2], loc("Fahrzeugsystem_77"), 0.5)

        GUIEditor.tab[3] = guiCreateTab(loc("Fahrzeugsystem_78"), GUIEditor.tabpanel[1])

        GUIEditor.gridlist[3] = guiCreateGridList(10, 10, 576, 158, false, GUIEditor.tab[3])
        FraktionID = guiGridListAddColumn(GUIEditor.gridlist[3], loc("Fahrzeugsystem_79"), 0.5)
        Fraktionsfahrzeug = guiGridListAddColumn(GUIEditor.gridlist[3], loc("Fahrzeugsystem_80"), 0.5)
		
		if(getElementData(localPlayer,"Firma") == 0)then guiSetEnabled(GUIEditor.tab[2],false)end
		if(getElementData(localPlayer,"Fraktion") == 0)then guiSetEnabled(GUIEditor.tab[3],false)end

        GUIEditor.button[1] = guiCreateButton(10, 237, 192, 30, loc("Fahrzeugsystem_81"), false, GUIEditor.window[1])
        GUIEditor.button[2] = guiCreateButton(10, 277, 192, 30, loc("Fahrzeugsystem_82"), false, GUIEditor.window[1])
        GUIEditor.button[3] = guiCreateButton(212, 237, 192, 30, loc("Fahrzeugsystem_83"), false, GUIEditor.window[1])
        GUIEditor.button[4] = guiCreateButton(212, 277, 192, 30, loc("Fahrzeugsystem_84"), false, GUIEditor.window[1])
        GUIEditor.button[5] = guiCreateButton(414, 237, 192, 30, loc("Fahrzeugsystem_85"), false, GUIEditor.window[1])
        GUIEditor.button[6] = guiCreateButton(414, 277, 192, 30, loc("Fahrzeugsystem_86"), false, GUIEditor.window[1])
		setWindowDatas()
		triggerServerEvent("Fahrzeugstelle.getDatas",localPlayer,localPlayer)
		
		addEventHandler("onClientGUIClick",GUIEditor.button[3],function()
			local clicked = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),1)
			if(clicked ~= "")then
				triggerServerEvent("Fahrzeugstelle.putVehicleInFirma",localPlayer,clicked,guiGetText(source))
			end
		end,false)
		
		addEventHandler("onClientGUIClick",GUIEditor.button[4],function()
			local clicked = guiGridListGetItemText(GUIEditor.gridlist[2],guiGridListGetSelectedItem(GUIEditor.gridlist[2]),1)
			if(clicked ~= "")then
				triggerServerEvent("Fahrzeugstelle.putVehicleInFirma",localPlayer,clicked,guiGetText(source))
			end
		end,false)
	end
end)

-- [[ DIE FAHRZEUG-DATAS SETZEN ]] --

addEvent("Fahrzeugstelle.setDatas",true)
addEventHandler("Fahrzeugstelle.setDatas",root,function(privat,firma,fraktion)
	for i = 1,3 do guiGridListClear(GUIEditor.gridlist[i])end

	for _,v in pairs(privat)do
		local row = guiGridListAddRow(GUIEditor.gridlist[1])
		guiGridListSetItemText(GUIEditor.gridlist[1],row,PrivatID,v[1],false,false)
		guiGridListSetItemText(GUIEditor.gridlist[1],row,Privatfahrzeug,v[2],false,false)
	end
	
	for _,v in pairs(firma)do
		local row = guiGridListAddRow(GUIEditor.gridlist[2])
		guiGridListSetItemText(GUIEditor.gridlist[2],row,FirmaID,v[1],false,false)
		guiGridListSetItemText(GUIEditor.gridlist[2],row,FirmaFahrzeug,v[2],false,false)
	end
	
	for _,v in pairs(fraktion)do
		local row = guiGridListAddRow(GUIEditor.gridlist[3])
		guiGridListSetItemText(GUIEditor.gridlist[3],row,FraktionID,v[1],false,false)
		guiGridListSetItemText(GUIEditor.gridlist[3],row,Fraktionsfahrzeug,v[2],false,false)
	end
end)