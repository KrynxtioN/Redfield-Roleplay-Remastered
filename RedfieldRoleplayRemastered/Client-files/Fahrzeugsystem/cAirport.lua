-- [[ DAS FENSTER ]] --

addEvent("Airport.openWindow",true)
addEventHandler("Airport.openWindow",root,function()
	if(isWindowOpen())then
        GUIEditor.window[1] = guiCreateWindow(485, 204, 281, 216, loc("Fahrzeugsystem_52"), false)

        GUIEditor.label[1] = guiCreateLabel(0.04, 0.13, 0.93, 0.22, loc("Fahrzeugsystem_53"), true, GUIEditor.window[1])
        GUIEditor.gridlist[1] = guiCreateGridList(10, 86, 261, 80, false, GUIEditor.window[1])
        ziel = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Fahrzeugsystem_54"), 0.9)
        GUIEditor.button[1] = guiCreateButton(10, 176, 261, 30, loc("Fahrzeugsystem_55"), false, GUIEditor.window[1])
		setWindowDatas(1)
		
		for _,v in pairs(Airport["Ziele"][getElementDimension(localPlayer)])do
			local row = guiGridListAddRow(GUIEditor.gridlist[1])
			guiGridListSetItemText(GUIEditor.gridlist[1],row,ziel,v,false,false)
		end
		
		addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
			local clicked = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),1)
			if(clicked ~= "")then
				triggerServerEvent("Airport.fliegen",localPlayer,clicked)
			else infobox(loc("Fahrzeugsystem_56"),"error")end
		end,false)
	end
end)