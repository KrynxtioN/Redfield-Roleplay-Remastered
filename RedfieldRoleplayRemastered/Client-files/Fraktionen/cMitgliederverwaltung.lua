-- [[ DAS FENSTER ÖFFNEN ]] --

local ID = 1
local Type = "Fraktion"

bindKey("f5","down",function()
	if(isWindowOpen())then
		if(getElementData(localPlayer,"Fraktion") >= 1 or getElementData(localPlayer,"Unternehmen") >= 1 or getElementData(localPlayer,"Firma") >= 1)then
			Panel.createGui()
			setWindowDatas(1)
		end
	end
end)

-- [[ DAS FENSTER ]] --

function Panel.createGui()
	if(isElement(GUIEditor.window[1]))then destroyElement(GUIEditor.window[1])end
    GUIEditor.window[1] = guiCreateWindow(350, 202, 538, 311, loc("Fraktionen_82"), false)
	centerWindow(GUIEditor.window[1])

    GUIEditor.tabpanel[1] = guiCreateTabPanel(10, 24, 518, 277, false, GUIEditor.window[1])

    GUIEditor.tab[1] = guiCreateTab(loc("Fraktionen_83"), GUIEditor.tabpanel[1])
    GUIEditor.tab[2] = guiCreateTab(loc("Fraktionen_84"), GUIEditor.tabpanel[1])
    GUIEditor.tab[3] = guiCreateTab(loc("Fraktionen_85"), GUIEditor.tabpanel[1])
	
	if(getElementData(localPlayer,"Fraktion") == 0)then
		guiSetEnabled(GUIEditor.tab[1],false)
		if(getElementData(localPlayer,"Firma") >= 1)then
			ID = 3
			Type = "Firma"
		end
		if(getElementData(localPlayer,"Unternehmen") >= 1)then
			ID = 2
			Type = "Unternehmen"
		end
	end
	if(getElementData(localPlayer,"Unternehmen") == 0)then guiSetEnabled(GUIEditor.tab[2],false)end
	if(getElementData(localPlayer,"Firma") == 0)then guiSetEnabled(GUIEditor.tab[3],false)end
	
	guiSetSelectedTab(GUIEditor.tabpanel[1],GUIEditor.tab[ID])

    GUIEditor.gridlist[1] = guiCreateGridList(10, 10, 235, 232, false, GUIEditor.tab[ID])
    spieler = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Fraktionen_86"), 0.5)
    rang = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Fraktionen_87"), 0.2)
    warns = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Fraktionen_88"), 0.2)
    GUIEditor.button[1] = guiCreateButton(255, 10, 253, 25, loc("Fraktionen_89"), false, GUIEditor.tab[ID])
    GUIEditor.button[2] = guiCreateButton(255, 45, 253, 25, loc("Fraktionen_90"), false, GUIEditor.tab[ID])
    GUIEditor.label[1] = guiCreateLabel(255, 80, 253, 25, loc("Fraktionen_91"), false, GUIEditor.tab[ID])
    GUIEditor.edit[1] = guiCreateEdit(255, 115, 253, 25, "", false, GUIEditor.tab[ID])
    GUIEditor.button[3] = guiCreateButton(255, 150, 253, 25, loc("Fraktionen_92"), false, GUIEditor.tab[ID])
    GUIEditor.button[4] = guiCreateButton(255, 185, 253, 25, loc("Fraktionen_93"), false, GUIEditor.tab[ID])
    GUIEditor.button[5] = guiCreateButton(255, 218, 122, 24, loc("Fraktionen_94"), false, GUIEditor.tab[ID])
    GUIEditor.button[6] = guiCreateButton(387, 218, 122, 24, loc("Fraktionen_95"), false, GUIEditor.tab[ID])
	
	guiSetFont(GUIEditor.label[1],"default-bold-small")
	guiLabelSetHorizontalAlign(GUIEditor.label[1],"center",true)
	guiLabelSetVerticalAlign(GUIEditor.label[1],"center")
	
	triggerServerEvent("Panel.getMember",localPlayer,localPlayer,Type)
		
	addEventHandler("onClientGUIClick",GUIEditor.tabpanel[1],function()
		Type = guiGetText(guiGetSelectedTab(source))
		if(guiGetSelectedTab(source) == GUIEditor.tab[1])then ID = 1 end
		if(guiGetSelectedTab(source) == GUIEditor.tab[2])then ID = 2 end
		if(guiGetSelectedTab(source) == GUIEditor.tab[3])then ID = 3 end
		Panel.createGui()
	end,false)
	
	addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
		local clicked = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),1)
		if(clicked ~= "")then
			triggerServerEvent("Panel.changeRang",localPlayer,clicked,"Befördern",Type)
		end
	end,false)
	
	addEventHandler("onClientGUIClick",GUIEditor.button[2],function()
		local clicked = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),1)
		if(clicked ~= "")then
			triggerServerEvent("Panel.changeRang",localPlayer,clicked,"Degradieren",Type)
		end
	end,false)
	
	addEventHandler("onClientGUIClick",GUIEditor.button[3],function()
		local target = guiGetText(GUIEditor.edit[1])
		if(target ~= "")then
			triggerServerEvent("Panel.newMember",localPlayer,target,"Inviten",Type)
		else infobox(loc("Fraktionen_96"),"error")end
	end,false)
	
	addEventHandler("onClientGUIClick",GUIEditor.button[4],function()
		local clicked = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),1)
		if(clicked ~= "")then
			triggerServerEvent("Panel.newMember",localPlayer,clicked,"Uninviten",Type)
		end
	end,false)
	
	addEventHandler("onClientGUIClick",GUIEditor.button[5],function()
		local clicked = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),1)
		if(clicked ~= "")then
			triggerServerEvent("Panel.warns",localPlayer,clicked,"Warn geben",Type)
		end
	end,false)
	
	addEventHandler("onClientGUIClick",GUIEditor.button[6],function()
		local clicked = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),1)
		if(clicked ~= "")then
			triggerServerEvent("Panel.warns",localPlayer,clicked,"Warn löschen",Type)
		end
	end,false)
end

-- [[ DAS PANEL REFRESHEN ]] --

addEvent("Panel.refresh",true)
addEventHandler("Panel.refresh",root,function(member)
	guiGridListClear(GUIEditor.gridlist[1])
	if(member and #member >= 1)then
		for _,v in pairs(member)do
			local row = guiGridListAddRow(GUIEditor.gridlist[1])
			guiGridListSetItemText(GUIEditor.gridlist[1],row,spieler,v[1],false,false)
			guiGridListSetItemText(GUIEditor.gridlist[1],row,rang,v[2],false,false)
			guiGridListSetItemText(GUIEditor.gridlist[1],row,warns,v[3],false,false)
		end
	end
end)