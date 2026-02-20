-- [[ FUNKTION ZUM ROTIEREN DES PEDS ]] --

function CJSkinshop.rotate()
	setPedRotation(CJSkinshop.ped,getPedRotation(CJSkinshop.ped)+1)
end

-- [[ DAS FENSTER ]] --

addEvent("CJSkinshop.openWindow",true)
addEventHandler("CJSkinshop.openWindow",root,function()
	if(isWindowOpen())then
		setElementAlpha(localPlayer,0)
		setElementData(localPlayer,"CJShopType",CJSkinshop["Informationen"]["Type"][getElementInterior(localPlayer)])
		local ShopType = getElementData(localPlayer,"CJShopType")

        GUIEditor.window[1] = guiCreateWindow(10, 280, 457, 341, loc("CJ_8"), false)
		
        GUIEditor.gridlist[1] = guiCreateGridList(10, 26, 121, 305, false, GUIEditor.window[1])
		local kategorie = guiGridListAddColumn(GUIEditor.gridlist[1], loc("CJ_9"), 0.9)
        GUIEditor.gridlist[2] = guiCreateGridList(141, 26, 306, 242, false, GUIEditor.window[1])
        artikel = guiGridListAddColumn(GUIEditor.gridlist[2], loc("CJ_10"), 0.4)
        preis = guiGridListAddColumn(GUIEditor.gridlist[2], loc("CJ_11"), 0.2)
        lagerbestand = guiGridListAddColumn(GUIEditor.gridlist[2], loc("CJ_12"), 0.9)
        model = guiGridListAddColumn(GUIEditor.gridlist[2], loc("CJ_13"), 0.4)
        id = guiGridListAddColumn(GUIEditor.gridlist[2], loc("CJ_14"), 0.4)
        GUIEditor.label[1] = guiCreateLabel(141, 278, 306, 53, loc("CJ_15"), false, GUIEditor.window[1])
		setWindowDatas(1,_,_,true)
		
		for _,v in pairs(CJSkinshop["Informationen"][ShopType][1])do
			local row = guiGridListAddRow(GUIEditor.gridlist[1])
			guiGridListSetItemText(GUIEditor.gridlist[1],row,kategorie,v,false,false)
		end
		
		addEventHandler("onClientGUIClick",GUIEditor.gridlist[1],function()
			local ID = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),1)
			if(not(ID == ""))then
				triggerServerEvent("CJSkinshop.getDatas",localPlayer,ID)
			end
		end,false)
		
		addEventHandler("onClientGUIClick",GUIEditor.gridlist[2],function()
			local Produkt = guiGridListGetItemText(GUIEditor.gridlist[2],guiGridListGetSelectedItem(GUIEditor.gridlist[2]),1)
			local Model = guiGridListGetItemText(GUIEditor.gridlist[2],guiGridListGetSelectedItem(GUIEditor.gridlist[2]),4)
			local ID = guiGridListGetItemText(GUIEditor.gridlist[2],guiGridListGetSelectedItem(GUIEditor.gridlist[2]),5)
			if(not(Produkt == ""))then
				addPedClothes(CJSkinshop.ped,Produkt,Model,ID)
			end
		end,false)
		
		addEventHandler("onClientGUIDoubleClick",GUIEditor.gridlist[2],function()
			local Produkt = guiGridListGetItemText(GUIEditor.gridlist[2],guiGridListGetSelectedItem(GUIEditor.gridlist[2]),1)
			local Model = guiGridListGetItemText(GUIEditor.gridlist[2],guiGridListGetSelectedItem(GUIEditor.gridlist[2]),4)
			local ID = guiGridListGetItemText(GUIEditor.gridlist[2],guiGridListGetSelectedItem(GUIEditor.gridlist[2]),5)
			if(not(Produkt == ""))then
				triggerServerEvent("CJSkinshop.add",localPlayer,Produkt,Model,ID)
			end
		end,false)
		
		CJSkinshop.ped = createPed(0,CJSkinshop["Informationen"][ShopType][2][1],CJSkinshop["Informationen"][ShopType][2][2],CJSkinshop["Informationen"][ShopType][2][3],CJSkinshop["Informationen"][ShopType][2][4])
		addPedClothes(CJSkinshop.ped,"player_torso","torso",0)
		setElementInterior(CJSkinshop.ped,getElementInterior(localPlayer))
		setElementDimension(CJSkinshop.ped,getElementDimension(localPlayer))
		addEventHandler("onClientRender",root,CJSkinshop.rotate)
		setCameraMatrix(CJSkinshop["Informationen"][ShopType][3][1],CJSkinshop["Informationen"][ShopType][3][2],CJSkinshop["Informationen"][ShopType][3][3],CJSkinshop["Informationen"][ShopType][3][4],CJSkinshop["Informationen"][ShopType][3][5],CJSkinshop["Informationen"][ShopType][3][6])
	end
end)

-- [[ DIE DATEN REFRESHEN ]] --

addEvent("CJSkinshop.setDatas",true)
addEventHandler("CJSkinshop.setDatas",root,function(datas)
	guiGridListClear(GUIEditor.gridlist[2])
	if(#datas >= 1)then
		for _,v in pairs(datas)do
			local row = guiGridListAddRow(GUIEditor.gridlist[2])
			guiGridListSetItemText(GUIEditor.gridlist[2],row,artikel,v[1],false,false)
			guiGridListSetItemText(GUIEditor.gridlist[2],row,preis,"$"..v[4],false,false)
			guiGridListSetItemText(GUIEditor.gridlist[2],row,lagerbestand,v[5],false,false)
			guiGridListSetItemText(GUIEditor.gridlist[2],row,model,v[2],false,false)
			guiGridListSetItemText(GUIEditor.gridlist[2],row,id,v[3],false,false)
		end
	end
end)