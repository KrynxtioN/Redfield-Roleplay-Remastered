-- [[ DAS FENSTER ]] --

local ID = 1
local Type = "Normal"

function Postfach.openWindow()
	if(isElement(GUIEditor.window[1]))then destroyElement(GUIEditor.window[1])end
    GUIEditor.window[1] = guiCreateWindow(430, 220, 555, 345, loc("Systeme_73"), false)
    GUIEditor.tabpanel[1] = guiCreateTabPanel(10, 24, 535, 311, false, GUIEditor.window[1])

    GUIEditor.tab[1] = guiCreateTab(loc("Systeme_74"), GUIEditor.tabpanel[1])
	if(getElementData(localPlayer,"Adminlevel") >= 1)then
		GUIEditor.tab[2] = guiCreateTab("Ticketsystem", GUIEditor.tabpanel[1])
	end
		
    GUIEditor.gridlist[1] = guiCreateGridList(10, 10, 254, 267, false, GUIEditor.tab[ID])
    id = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Systeme_75"), 0.2)
    absender = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Systeme_76"), 0.3)
    betreff = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Systeme_77"), 0.5)
    GUIEditor.button[1] = guiCreateButton(274, 247, 251, 30, loc("Systeme_78"), false, GUIEditor.tab[ID])
    GUIEditor.button[2] = guiCreateButton(274, 207, 251, 30, loc("Systeme_79"), false, GUIEditor.tab[ID])
    GUIEditor.memo[1] = guiCreateMemo(274, 10, 251, 187, loc("Systeme_80"), false,GUIEditor.tab[ID])
    guiMemoSetReadOnly(GUIEditor.memo[1], true)
	triggerServerEvent("Postfach.getDatas",localPlayer,localPlayer,_,Type)
	guiSetSelectedTab(GUIEditor.tabpanel[1],GUIEditor.tab[ID])
	setWindowDatas(_,_,true)
		
	addEventHandler("onClientGUIClick",GUIEditor.tabpanel[1],function()
		if(guiGetSelectedTab(GUIEditor.tabpanel[1]) == GUIEditor.tab[1])then
			ID = 1
			Type = "Normal"
		else
			ID = 2
			Type = "Ticket"
		end
		Postfach.openWindow()
	end,false)
		
	addEventHandler("onClientGUIClick",GUIEditor.gridlist[1],function()
		local clicked = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),1)
		if(clicked ~= "")then
			triggerServerEvent("Postfach.getDatas",localPlayer,localPlayer,clicked)
		end
	end,false)
		
	addEventHandler("onClientGUIDoubleClick",GUIEditor.button[1],function()
		local clicked = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),1)
		if(clicked ~= "")then
			triggerServerEvent("Postfach.deleteMessage",localPlayer,clicked,Type)
		end
	end,false)
		
	addEventHandler("onClientGUIClick",GUIEditor.button[2],function()
		destroyElement(GUIEditor.window[1])
        GUIEditor.window[1] = guiCreateWindow(430, 220, 555, 345, loc("Systeme_81"), false)

        GUIEditor.label[1] = guiCreateLabel(10, 27, 193, 25, loc("Systeme_82"), false, GUIEditor.window[1])
        GUIEditor.edit[1] = guiCreateEdit(213, 27, 332, 25, "", false, GUIEditor.window[1])
        GUIEditor.label[2] = guiCreateLabel(10, 62, 193, 25, loc("Systeme_83"), false, GUIEditor.window[1])
        GUIEditor.edit[2] = guiCreateEdit(213, 62, 332, 25, "", false, GUIEditor.window[1])
        GUIEditor.memo[1] = guiCreateMemo(10, 97, 535, 198, loc("Systeme_84"), false, GUIEditor.window[1])
        GUIEditor.button[1] = guiCreateButton(10, 305, 263, 30, loc("Systeme_85"), false, GUIEditor.window[1])
        GUIEditor.button[2] = guiCreateButton(282, 305, 263, 30, loc("Systeme_86"), false, GUIEditor.window[1])
		setWindowDatas(2,_,true)
		
		
		addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
			local empfaenger = guiGetText(GUIEditor.edit[1])
			local betreff = guiGetText(GUIEditor.edit[2])
			local text = guiGetText(GUIEditor.memo[1])
			if(#empfaenger >= 1 and #betreff >= 1 and #text >= 1)then
				triggerServerEvent("Postfach.sendMessage",localPlayer,empfaenger,betreff,text,0)
			else infobox(loc("Systeme_87"),"error")end
		end,false)
		
		addEventHandler("onClientGUIClick",GUIEditor.button[2],function()
			local empfaenger = guiGetText(GUIEditor.edit[1])
			local betreff = guiGetText(GUIEditor.edit[2])
			local text = guiGetText(GUIEditor.memo[1])
			if(#empfaenger >= 1 and #betreff >= 1 and #text >= 1)then
				triggerServerEvent("Postfach.sendMessage",localPlayer,empfaenger,betreff,text,1)
			else infobox(loc("Systeme_88"),"error")end
		end,false)
	end,false)
end

bindKey("f9","down",function()
	if(isWindowOpen())then
		Postfach.openWindow()
	end
end)

-- [[ DAS POSTFACH REFRESHEN ]] --

addEvent("Postfach.refresh",true)
addEventHandler("Postfach.refresh",root,function(tbl,text,refresh)
	if(tbl)then
		guiGridListClear(GUIEditor.gridlist[1])
		for _,v in pairs(tbl)do
			local row = guiGridListAddRow(GUIEditor.gridlist[1])
			guiGridListSetItemText(GUIEditor.gridlist[1],row,id,v[1],false,false)
			guiGridListSetItemText(GUIEditor.gridlist[1],row,absender,v[2],false,false)
			guiGridListSetItemText(GUIEditor.gridlist[1],row,betreff,v[3],false,false)
			guiGridListSetItemColor(GUIEditor.gridlist[1],row,id,Color[v[4]][1],Color[v[4]][2],Color[v[4]][3])
			guiGridListSetItemColor(GUIEditor.gridlist[1],row,absender,Color[v[4]][1],Color[v[4]][2],Color[v[4]][3])
			guiGridListSetItemColor(GUIEditor.gridlist[1],row,betreff,Color[v[4]][1],Color[v[4]][2],Color[v[4]][3])
		end
	else
		guiSetText(GUIEditor.memo[1],text)
	end
end)