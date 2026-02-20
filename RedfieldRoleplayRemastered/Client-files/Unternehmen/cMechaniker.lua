-- [[ DUTYPICKUP ]] --

Mechaniker.pickup = createPickup(-2050.7790527344,172.93997192383,28.8359375,3,1239,50)

-- [[ VERWALTUNGSFENSTER ]] --

addEventHandler("onClientPickupHit",Mechaniker.pickup,function(player)
	if(getElementData(localPlayer,"Unternehmen") == 1 and getElementData(localPlayer,"UDuty") == true)then
		if(isWindowOpen())then
			GUIEditor.window[1] = guiCreateWindow(334, 256, 354, 261, loc("Unternehmen_21"), false)

			GUIEditor.gridlist[1] = guiCreateGridList(10, 28, 334, 106, false, GUIEditor.window[1])
			id = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Unternehmen_22"), 0.3)
			fahrzeug = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Unternehmen_23"), 0.3)
			besitzer = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Unternehmen_24"), 0.3)
			GUIEditor.button[1] = guiCreateButton(10, 144, 334, 29, loc("Unternehmen_25"), false, GUIEditor.window[1])
			GUIEditor.button[2] = guiCreateButton(10, 183, 334, 29, loc("Unternehmen_26"), false, GUIEditor.window[1])
			GUIEditor.button[3] = guiCreateButton(10, 222, 334, 29, loc("Unternehmen_27"), false, GUIEditor.window[1])
			setWindowDatas()
			
			triggerServerEvent("Mechaniker.getVehicleInMarker",localPlayer)
			
			addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
				local clicked = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),1)
				if(clicked ~= "")then
					triggerServerEvent("Mechaniker.deleteExplos",localPlayer,clicked)
				end
			end,false)
			
			addEventHandler("onClientGUIClick",GUIEditor.button[2],function()
				local clicked = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),1)
				if(clicked ~= "")then
					triggerServerEvent("Mechaniker.sportmotor",localPlayer,clicked)
				end
			end,false)
			
			addEventHandler("onClientGUIClick",GUIEditor.button[3],function()
				triggerServerEvent("Mechaniker.getVehicleInMarker",localPlayer)
			end,false)
		end
	end
end)

-- [[ REPAIRKITS KAUFEN ]] --

addEvent("Mechaniker.buyRepairkits",true)
addEventHandler("Mechaniker.buyRepairkits",root,function()
	if(isWindowOpen())then
        GUIEditor.window[1] = guiCreateWindow(494, 289, 345, 164, loc("Unternehmen_28"), false)

        GUIEditor.label[1] = guiCreateLabel(10, 26, 325, 50, loc("Unternehmen_29"), false, GUIEditor.window[1])
        GUIEditor.label[2] = guiCreateLabel(10, 86, 146, 28, loc("Unternehmen_30"), false, GUIEditor.window[1])
        GUIEditor.edit[1] = guiCreateEdit(166, 86, 169, 28, "", false, GUIEditor.window[1])
        GUIEditor.button[1] = guiCreateButton(10, 124, 325, 30, loc("Unternehmen_31"), false, GUIEditor.window[1])
		setWindowDatas(2)
		
		addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
			local edit = guiGetText(GUIEditor.edit[1])
			if(#edit >= 1 and tonumber(edit))then
				triggerServerEvent("Mechaniker.buyRepairkits",localPlayer,edit)
			end
		end,false)
	end
end)

-- [[ DER ABSCHLEPPHOF ]] --

addEvent("Mechaniker.abschlepphof",true)
addEventHandler("Mechaniker.abschlepphof",root,function(vehicles)
	if(isWindowOpen())then
        GUIEditor.window[1] = guiCreateWindow(476, 274, 529, 337, loc("Unternehmen_32"), false)

        GUIEditor.label[1] = guiCreateLabel(10, 28, 509, 52, loc("Unternehmen_33"), false, GUIEditor.window[1])
        GUIEditor.tabpanel[1] = guiCreateTabPanel(10, 90, 509, 200, false, GUIEditor.window[1])

        GUIEditor.tab[1] = guiCreateTab(loc("Unternehmen_34"), GUIEditor.tabpanel[1])
		GUIEditor.gridlist[1] = guiCreateGridList(10, 10, 489, 155, false, GUIEditor.tab[1])
		id = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Unternehmen_35"), 0.2)
		fahrzeug = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Unternehmen_36"), 0.2)
		typ = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Unternehmen_37"), 0.2)
		
        GUIEditor.button[1] = guiCreateButton(10, 300, 509, 27, loc("Unternehmen_38"), false, GUIEditor.window[1])
		setWindowDatas(1)
		
		for _,v in pairs(vehicles)do
			if(v[3] == getPlayerName(client))then v[3] = "Privatfahrzeug" end
			local row = guiGridListAddRow(GUIEditor.gridlist[1])
			guiGridListSetItemText(GUIEditor.gridlist[1],row,id,v[1],false,false)
			guiGridListSetItemText(GUIEditor.gridlist[1],row,fahrzeug,getVehicleNameFromModel(v[2]),false,false)
			guiGridListSetItemText(GUIEditor.gridlist[1],row,typ,v[3],false,false)
		end
		
		addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
			local clicked = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),1)
			if(clicked ~= "")then
				triggerServerEvent("Mechaniker.freikaufen",localPlayer,clicked)
			end
		end,false)
    end
end)

-- [[ ABSCHLEPPMARKER ERSTELLEN / LÖSCHEN ]] --

addEvent("Mechaniker.abschleppen",true)
addEventHandler("Mechaniker.abschleppen",root,function(type)
	if(isElement(Mechaniker.abschleppen))then destroyElement(Mechaniker.abschleppen)end
	if(type)then
		Mechaniker.abschleppen = createMarker(-2027,132.30000305176,27.60000038147,"cylinder",5,200,0,0,125)
		
		addEventHandler("onClientMarkerHit",Mechaniker.abschleppen,function(player)
			if(player == localPlayer)then
				triggerServerEvent("Mechaniker.abschleppen",localPlayer)
			end
		end)
	end
end)

addEventHandler("onClientPlayerWasted",root,function(player)
	if(player == localPlayer)then
		if(isElement(Mechaniker.abschleppen))then
			destroyElement(Mechaniker.abschleppen)
		end
	end
end)

-- [[ ABSCHLEPP-DATAS SETZEN ]] --

addEvent("Mechaniker.setVehicleMarkerDatas",true)
addEventHandler("Mechaniker.setVehicleMarkerDatas",root,function(vehicles)
	guiGridListClear(GUIEditor.gridlist[1])
	for _,v in pairs(vehicles)do
		local row = guiGridListAddRow(GUIEditor.gridlist[1])
		guiGridListSetItemText(GUIEditor.gridlist[1],row,id,v[1],false,false)
		guiGridListSetItemText(GUIEditor.gridlist[1],row,fahrzeug,getVehicleNameFromModel(v[2]),false,false)
		guiGridListSetItemText(GUIEditor.gridlist[1],row,besitzer,v[3],false,false)
	end
end)