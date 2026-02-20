-- [[ DAS FAHRZEUGPANEL ]] --

addEvent("Vehicles.openFahrzeugpanel",true)
addEventHandler("Vehicles.openFahrzeugpanel",root,function(owner,id,lastdriver)
	if(isWindowOpen())then
        GUIEditor.window[1] = guiCreateWindow(520, 370, 338, 108, loc("Fahrzeugsystem_57"), false)

        GUIEditor.button[1] = guiCreateButton(10, 26, 154, 32, loc("Fahrzeugsystem_58"), false, GUIEditor.window[1])
        GUIEditor.button[2] = guiCreateButton(174, 26, 154, 32, loc("Fahrzeugsystem_59"), false, GUIEditor.window[1])
        GUIEditor.button[3] = guiCreateButton(10, 66, 154, 32, loc("Fahrzeugsystem_60"), false, GUIEditor.window[1])
        GUIEditor.button[4] = guiCreateButton(174, 66, 154, 32, loc("Fahrzeugsystem_61"), false, GUIEditor.window[1])
		setWindowDatas()
		
		addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
			triggerServerEvent("Vehicles.lock",localPlayer,id)
		end,false)
		
		addEventHandler("onClientGUIClick",GUIEditor.button[2],function()
			triggerServerEvent("Vehicles.respawn",localPlayer,id)
		end,false)
		
		addEventHandler("onClientGUIClick",GUIEditor.button[3],function()
			setElementData(localPlayer,"VehicleID",id)
			destroyElement(GUIEditor.window[1])
			GUIEditor.window[1] = guiCreateWindow(336, 305, 372, 249, loc("Fahrzeugsystem_62"), false)

			GUIEditor.gridlist[1] = guiCreateGridList(10, 30, 352, 139, false, GUIEditor.window[1])
			item = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Fahrzeugsystem_63"), 0.5)
			menge = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Fahrzeugsystem_64"), 0.5)
			GUIEditor.label[1] = guiCreateLabel(10, 179, 92, 25, loc("Fahrzeugsystem_65"), false, GUIEditor.window[1])
			GUIEditor.edit[1] = guiCreateEdit(112, 179, 250, 25, "", false, GUIEditor.window[1])
			GUIEditor.button[1] = guiCreateButton(10, 214, 172, 25, loc("Fahrzeugsystem_66"), false, GUIEditor.window[1])
			GUIEditor.button[2] = guiCreateButton(190, 214, 172, 25, loc("Fahrzeugsystem_67"), false, GUIEditor.window[1])    
			setWindowDatas(1,_,true)
			triggerServerEvent("getKofferraumDatas",localPlayer,localPlayer)
			
			addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
				local clicked = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),1)
				local edit = guiGetText(GUIEditor.edit[1])
				if(clicked ~= "" and #edit >= 1 and isOnlyNumbers(edit))then
					triggerServerEvent("Kofferraum.einlagern",localPlayer,clicked,edit)
				end
			end,false)
			
			addEventHandler("onClientGUIClick",GUIEditor.button[2],function()
				local clicked = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),1)
				local edit = guiGetText(GUIEditor.edit[1])
				if(clicked ~= "" and #edit >= 1 and isOnlyNumbers(edit))then
					triggerServerEvent("Kofferraum.auslagern",localPlayer,clicked,edit)
				end
			end,false)
		end,false)
		
		addEventHandler("onClientGUIClick",GUIEditor.button[4],function()
			infobox(loc("Fahrzeugsystem_68"):format(owner,lastdriver),"info")
		end,false)
	end
end)

addEvent("setKofferraumDatas",true)
addEventHandler("setKofferraumDatas",root,function(tbl)
	guiGridListClear(GUIEditor.gridlist[1])
	if(#tbl >= 1)then
		for _,v in pairs(tbl)do
			local row = guiGridListAddRow(GUIEditor.gridlist[1])
			guiGridListSetItemText(GUIEditor.gridlist[1],row,item,v[1],false,false)
			guiGridListSetItemText(GUIEditor.gridlist[1],row,menge,v[2],false,false)
		end
	end
end)

-- [[ FENSTER ZUM KAUFEN VON FIRMENFAHRZEUGEN ]] --

addEvent("buyFirmenfahrzeug",true)
addEventHandler("buyFirmenfahrzeug",root,function(firma,preis,model)
	if(isWindowOpen())then
        GUIEditor.window[1] = guiCreateWindow(376, 318, 307, 143, loc("Fahrzeugsystem_69"), false)
        GUIEditor.label[1] = guiCreateLabel(10, 25, 287, 71, loc("Fahrzeugsystem_70"):format(firma,getVehicleNameFromModel(model),preis), false, GUIEditor.window[1])
        GUIEditor.button[1] = guiCreateButton(10, 106, 287, 27, "Kaufen", false, GUIEditor.window[1])
		setWindowDatas(1)

		addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
			triggerServerEvent("buyFirmenfahrzeug",localPlayer)
		end,false)
    end
end)