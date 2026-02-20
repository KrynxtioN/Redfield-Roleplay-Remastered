-- [[ DAS FENSTER ]] --

addEvent("Marktplatz.openWindow",true)
addEventHandler("Marktplatz.openWindow",root,function(typ)
	if(isWindowOpen())then
		GUIEditor.window[1] = guiCreateWindow(385, 143, 532, 348, typ, false)

        GUIEditor.gridlist[1] = guiCreateGridList(10, 27, 512, 275, false, GUIEditor.window[1])
        id = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Shops_64"), 0.1)
        item = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Shops_65"), 0.2)
        menge = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Shops_66"), 0.2)
        preis = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Shops_67"), 0.2)
        ersteller = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Shops_68"), 0.2)
        GUIEditor.button[1] = guiCreateButton(10, 312, 164, 26, loc("Shops_69"), false, GUIEditor.window[1])
        GUIEditor.button[2] = guiCreateButton(184, 312, 164, 26, loc("Shops_70"), false, GUIEditor.window[1])
        GUIEditor.button[3] = guiCreateButton(358, 312, 164, 26, loc("Shops_71"), false, GUIEditor.window[1])
		setWindowDatas()
		triggerServerEvent("Marktplatz.getAngebote",localPlayer)
		
		addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
			local clicked = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),1)
			if(clicked ~= "")then
				triggerServerEvent("Marktplatz.buy",localPlayer,clicked)
				triggerServerEvent("Marktplatz.getAngebote",localPlayer)
			end
		end,false)
		
		addEventHandler("onClientGUIClick",GUIEditor.button[2],function()
			Marktplatz.createAngebot()
		end,false)
		
		addEventHandler("onClientGUIClick",GUIEditor.button[3],function()
			local clicked = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),1)
			if(clicked ~= "")then
				triggerServerEvent("Marktplatz.delete",localPlayer,clicked)
				triggerServerEvent("Marktplatz.getAngebote",localPlayer)
			end
		end,false)
    end
end)

-- [[ EIN ANGEBOT ERSTELLEN ]] --

function Marktplatz.createAngebot()
	if(getDistanceBetweenPoints3D(2717.3803710938,-1422.5891113281,16.25,getElementPosition(localPlayer)) <= 5)then typ = loc("Shops_77") else typ = loc("Shops_76") end
	destroyElement(GUIEditor.window[1])
	
    GUIEditor.window[1] = guiCreateWindow(464, 252, 475, 309, typ, false)

    GUIEditor.gridlist[1] = guiCreateGridList(10, 26, 230, 273, false, GUIEditor.window[1])
    item = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Shops_72"), 0.9)
    GUIEditor.label[1] = guiCreateLabel(250, 26, 215, 27, loc("Shops_73"), false, GUIEditor.window[1])
    GUIEditor.label[2] = guiCreateLabel(250, 100, 215, 27, loc("Shops_74"), false, GUIEditor.window[1])
    GUIEditor.edit[1] = guiCreateEdit(250, 63, 215, 27, "", false, GUIEditor.window[1])
    GUIEditor.edit[2] = guiCreateEdit(250, 137, 215, 27, "", false, GUIEditor.window[1])
    GUIEditor.button[1] = guiCreateButton(250, 272, 215, 27, loc("Shops_75"), false, GUIEditor.window[1])
	setWindowDatas(2,_,true)
	
	for _,v in pairs(Marktplatz[typ])do
		if(getElementData(localPlayer,v) >= 1)then
			local row = guiGridListAddRow(GUIEditor.gridlist[1])
			guiGridListSetItemText(GUIEditor.gridlist[1],row,item,v,false,false)
		end
	end
	
	addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
		local clicked = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),1)
		local menge = guiGetText(GUIEditor.edit[1])
		local preis = guiGetText(GUIEditor.edit[2])
		if(clicked ~= "" and #menge >= 1 and tonumber(menge) and #preis >= 1 and tonumber(preis))then
			triggerServerEvent("Marktplatz.createAngebot",localPlayer,clicked,menge,preis)
		end
	end,false)
end

-- [[ DIE ANGEBOTE LADEN ]] --

addEvent("Marktplatz.loadAngebote",true)
addEventHandler("Marktplatz.loadAngebote",root,function(angebote)
	guiGridListClear(GUIEditor.gridlist[1])
	if(#angebote >= 1)then
		for i,v in pairs(angebote)do
			local row = guiGridListAddRow(GUIEditor.gridlist[1])
			guiGridListSetItemText(GUIEditor.gridlist[1],row,id,v[1],false,false)
			guiGridListSetItemText(GUIEditor.gridlist[1],row,item,v[2],false,false)
			guiGridListSetItemText(GUIEditor.gridlist[1],row,menge,v[3],false,false)
			guiGridListSetItemText(GUIEditor.gridlist[1],row,preis,"$"..v[4],false,false)
			guiGridListSetItemText(GUIEditor.gridlist[1],row,ersteller,v[5],false,false)
		end
	end
end)