-- [[ DAS FENSTER ]] --

addEvent("openFraktionsDepot",true)
addEventHandler("openFraktionsDepot",root,function()
	if(isWindowOpen())then
        GUIEditor.window[1] = guiCreateWindow(467, 314, 473, 292, loc("Fraktionen_64"), false)

        GUIEditor.label[1] = guiCreateLabel(10, 27, 453, 25, " ", false, GUIEditor.window[1])
        GUIEditor.gridlist[1] = guiCreateGridList(10, 62, 245, 220, false, GUIEditor.window[1])
        item = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Fraktionen_65"), 0.5)
        menge = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Fraktionen_66"), 0.5)
        GUIEditor.label[2] = guiCreateLabel(265, 102, 198, 23, loc("Fraktionen_67"), false, GUIEditor.window[1])
        GUIEditor.edit[1] = guiCreateEdit(265, 135, 198, 30, "", false, GUIEditor.window[1])
        GUIEditor.button[1] = guiCreateButton(265, 253, 198, 29, loc("Fraktionen_68"), false, GUIEditor.window[1])
        GUIEditor.button[2] = guiCreateButton(265, 214, 198, 29, loc("Fraktionen_69"), false, GUIEditor.window[1])
        GUIEditor.button[3] = guiCreateButton(265, 175, 198, 29, loc("Fraktionen_70"), false, GUIEditor.window[1])
		setWindowDatas(2)
		
		triggerServerEvent("getFraktionsDepotDatas",localPlayer)
		
		for i = 2,3 do
			addEventHandler("onClientGUIClick",GUIEditor.button[i],function()
				local clicked = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),1)
				if(clicked ~= "")then
					local menge = guiGetText(GUIEditor.edit[1])
					if(#menge >= 1 and isOnlyNumbers(menge))then
						triggerServerEvent("Fraktionssystem.lager",localPlayer,getElementData(localPlayer,"DepotID"),clicked,menge,getElementData(localPlayer,"DepotType"),getElementData(localPlayer,"DepotDatabase"),guiGetText(source))
						triggerServerEvent("getFraktionsDepotDatas",localPlayer)
					else infobox(loc("Fraktionen_71"),"error")end
				end
			end,false)
		end
		
		addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
			local edit = guiGetText(GUIEditor.edit[1])
			if(#edit >= 1 and isOnlyNumbers(edit))then
				triggerServerEvent("Fraktionssystem.neededRangForDepot",localPlayer,getElementData(localPlayer,"DepotType"),edit,getElementData(localPlayer,"DepotDatabase"))
				triggerServerEvent("getFraktionsDepotDatas",localPlayer)
			end
		end,false)
    end
end)

-- [[ DIE DEPOT-DATAS SETZEN ]] --

addEvent("setFraktionsDepotDatas",true)
addEventHandler("setFraktionsDepotDatas",root,function(items,rang,depotdatabase)
	guiGridListClear(GUIEditor.gridlist[1])
	guiSetText(GUIEditor.label[1],loc("Fraktionen_72"):format(rang))
	if(#items >= 1)then
		for _,v in pairs(items)do
			if(v[1] == "Gras" or v[1] == "Materialien")then
				if(depotdatabase == "unternehmenlager")then
					return false
				end
			end
			local row = guiGridListAddRow(GUIEditor.gridlist[1])
			guiGridListSetItemText(GUIEditor.gridlist[1],row,item,v[1],false,false)
			guiGridListSetItemText(GUIEditor.gridlist[1],row,menge,v[2],false,false)
		end
	end
end)