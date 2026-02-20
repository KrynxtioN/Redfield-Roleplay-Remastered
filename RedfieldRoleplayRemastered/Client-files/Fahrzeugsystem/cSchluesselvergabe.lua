-- [[ DIE SCHLÜSSELVERWALTUNG ]] --

function Schluesselvergabe.openWindow()
	destroyElement(GUIEditor.window[1])
	GUIEditor.window[1] = guiCreateWindow(449, 304, 364, 264, loc("Fahrzeugsystem_21"), false,"nocross")

    GUIEditor.gridlist[1] = guiCreateGridList(10, 26, 344, 160, false, GUIEditor.window[1])
    spieler = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Fahrzeugsystem_22"), 0.9)
    GUIEditor.label[1] = guiCreateLabel(10, 196, 148, 24, loc("Fahrzeugsystem_23"), false, GUIEditor.window[1])
    GUIEditor.edit[1] = guiCreateEdit(10, 230, 148, 25, "", false, GUIEditor.window[1])
    GUIEditor.button[1] = guiCreateButton(168, 196, 186, 25, loc("Fahrzeugsystem_24"), false, GUIEditor.window[1])
    GUIEditor.button[2] = guiCreateButton(168, 230, 186, 25, loc("Fahrzeugsystem_25"), false, GUIEditor.window[1])
	setWindowDatas(1,_,true)
	
	addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
		local edit = guiGetText(GUIEditor.edit[1])
		if(#edit >= 1)then
			triggerServerEvent("Schluesselvergabe.giveTake",localPlayer,edit,"Schlüssel vergeben")
		end
	end,false)
	
	addEventHandler("onClientGUIClick",GUIEditor.button[2],function()
		local clicked = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),1)
		if(clicked ~= "")then
			triggerServerEvent("Schluesselvergabe.giveTake",localPlayer,clicked,"Schlüssel abnehmen")
		end
	end,false)
end

-- [[ DIE SCHLÜSSEL-DATAS SETZEN ]] --

addEvent("Schluesselvergabe.setKeys",true)
addEventHandler("Schluesselvergabe.setKeys",root,function(datas)
	guiGridListClear(GUIEditor.gridlist[1])
	if(#datas >= 1)then
		for _,v in pairs(datas)do
			local row = guiGridListAddRow(GUIEditor.gridlist[1])
			guiGridListSetItemText(GUIEditor.gridlist[1],row,spieler,v[1],false,false)
		end
	end
end)