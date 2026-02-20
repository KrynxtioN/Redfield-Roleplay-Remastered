-- [[ MÖBEL-INVENTAR ]] --

addCommandHandler("moebel",function()
	if(isWindowOpen())then
        GUIEditor.window[1] = guiCreateWindow(10, 277, 336, 346, loc("Haussystem_32"), false,"nocross")

        GUIEditor.gridlist[1] = guiCreateGridList(10, 26, 316, 310, false, GUIEditor.window[1])
        moebelstueck = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Haussystem_33"), 0.7)
        model = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Haussystem_34"), 0.3)
        id = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Haussystem_35"), 0.3)
		setWindowDatas(_,_,_,"no")
		
		triggerServerEvent("Moebel.getPlayerMoebel",localPlayer)
		
		addEventHandler("onClientGUIClick",GUIEditor.gridlist[1],function()
			local clicked = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),2)
			if(clicked ~= "")then
				Moebel.createObject(clicked)
				setElementData(localPlayer,"ClickedMoebelID",guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),3))
				setElementData(localPlayer,"MoebelName",guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),1))
			end
		end,false)
    end
end)

-- [[ MÖBEL-DATAS SETZEN ]] --

addEvent("Moebel.setPlayerMoebel",true)
addEventHandler("Moebel.setPlayerMoebel",root,function(moebel)
	if(#moebel >= 1)then
		for _,v in pairs(moebel)do
			local row = guiGridListAddRow(GUIEditor.gridlist[1])
			guiGridListSetItemText(GUIEditor.gridlist[1],row,moebelstueck,v[2],false,false)
			guiGridListSetItemText(GUIEditor.gridlist[1],row,model,v[3],false,false)
			guiGridListSetItemText(GUIEditor.gridlist[1],row,id,v[1],false,false)
		end
	end
end)