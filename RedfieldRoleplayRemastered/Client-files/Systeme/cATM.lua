-- [[ PINEINGABE ]] --

addEvent("ATM.openWindow",true)
addEventHandler("ATM.openWindow",root,function()
	if(isWindowOpen())then
		if(getElementData(localPlayer,"Bankpin") ~= 0)then
			GUIEditor.window[1] = guiCreateWindow(391, 349, 303, 136, loc("Systeme_98"), false)

			GUIEditor.label[1] = guiCreateLabel(10, 28, 284, 25, loc("Systeme_99"), false, GUIEditor.window[1])
			GUIEditor.edit[1] = guiCreateEdit(9, 63, 285, 28, "", false, GUIEditor.window[1])
			GUIEditor.button[1] = guiCreateButton(9, 101, 285, 25, loc("Systeme_100"), false, GUIEditor.window[1])
			setWindowDatas(1)
			
			addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
				local edit = guiGetText(GUIEditor.edit[1])
				if(#edit >= 1 and isOnlyNumbers(edit))then
					if(getElementData(localPlayer,"Bankpin") == tonumber(edit))then
						triggerServerEvent("ATM.openWindow",localPlayer,localPlayer)
					else infobox(loc("Systeme_101"),"error")end
				end
			end,false)
		else infobox(loc("Systeme_102"),"error")end
	end
end)

-- [[ DAS FENSTER ]] --

addEvent("ATM.openAfterPin",true)
addEventHandler("ATM.openAfterPin",root,function(zahlungen)
	destroyElement(GUIEditor.window[1])
	
	GUIEditor.window[1] = guiCreateWindow(396, 353, 421, 273, loc("Systeme_103"), false)

    GUIEditor.label[1] = guiCreateLabel(10, 29, 401, 29, loc("Systeme_104"):format(getElementData(localPlayer,"Bankgeld")), false, GUIEditor.window[1])
    GUIEditor.tabpanel[1] = guiCreateTabPanel(10, 68, 401, 195, false, GUIEditor.window[1])

    GUIEditor.tab[1] = guiCreateTab(loc("Systeme_105"), GUIEditor.tabpanel[1])
		
    GUIEditor.label[2] = guiCreateLabel(10, 10, 96, 29, loc("Systeme_106"), false, GUIEditor.tab[1])
    GUIEditor.edit[1] = guiCreateEdit(116, 10, 275, 29, "", false, GUIEditor.tab[1])
    GUIEditor.button[1] = guiCreateButton(10, 132, 186, 29, loc("Systeme_107"), false, GUIEditor.tab[1])
    GUIEditor.button[2] = guiCreateButton(206, 132, 186, 29, loc("Systeme_108"), false, GUIEditor.tab[1])

    GUIEditor.tab[2] = guiCreateTab(loc("Systeme_109"), GUIEditor.tabpanel[1])
		
    GUIEditor.label[3] = guiCreateLabel(10, 10, 96, 29, loc("Systeme_110"), false, GUIEditor.tab[2])
    GUIEditor.edit[2] = guiCreateEdit(116, 10, 275, 29, "", false, GUIEditor.tab[2])
    GUIEditor.button[3] = guiCreateButton(10, 132, 381, 29, loc("Systeme_111"), false, GUIEditor.tab[2])
    GUIEditor.edit[3] = guiCreateEdit(116, 49, 275, 29, "", false, GUIEditor.tab[2])
    GUIEditor.label[4] = guiCreateLabel(10, 49, 96, 29, loc("Systeme_112"), false, GUIEditor.tab[2])
		
    GUIEditor.tab[3] = guiCreateTab(loc("Systeme_113"), GUIEditor.tabpanel[1])

    GUIEditor.gridlist[1] = guiCreateGridList(10, 10, 381, 151, false, GUIEditor.tab[3])
    summe = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Systeme_114"), 0.5)
    name = guiGridListAddColumn(GUIEditor.gridlist[1], "", 0.5) 
		
	setWindowDatas(4,_,true)
		
	if(#zahlungen >= 1)then
		for _,v in pairs(zahlungen)do
			local row = guiGridListAddRow(GUIEditor.gridlist[1])
			guiGridListSetItemText(GUIEditor.gridlist[1],row,summe,v[2]..""..v[1],false,false)
			guiGridListSetItemText(GUIEditor.gridlist[1],row,name,v[3],false,false)
		end
	end
		
	addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
		local edit = guiGetText(GUIEditor.edit[1])
		if(#edit >= 1 and isOnlyNumbers(edit))then
			triggerServerEvent("ATM.server",localPlayer,edit,"einzahlen")
		else infobox(loc("Systeme_115"),"error")end
	end,false)
		
	addEventHandler("onClientGUIClick",GUIEditor.button[2],function()
		local edit = guiGetText(GUIEditor.edit[1])
		if(#edit >= 1 and isOnlyNumbers(edit))then
			triggerServerEvent("ATM.server",localPlayer,edit,"auszahlen")
		else infobox(loc("Systeme_116"),"error")end
	end,false)
		
	addEventHandler("onClientGUIClick",GUIEditor.button[3],function()
		local edit = guiGetText(GUIEditor.edit[2])
		local target = guiGetText(GUIEditor.edit[3])
		if(#edit >= 1 and isOnlyNumbers(edit) and #target >= 1)then
			triggerServerEvent("ATM.ueberweisen",localPlayer,edit,target)
		else infobox(loc("Systeme_117"),"error")end
	end,false)
end)

-- [[ DIE GELDANZEIGE REFRESHEN ]] --

addEvent("ATM.refresh",true)
addEventHandler("ATM.refresh",root,function()
	guiSetText(GUIEditor.label[1],loc("Systeme_118"):format(getElementData(localPlayer,"Bankgeld")))
end)

-- [[ KONTO ERSTELLEN ]] --

addEvent("ATM.createKonto",true)
addEventHandler("ATM.createKonto",root,function()
	if(isWindowOpen())then
        GUIEditor.window[1] = guiCreateWindow(399, 360, 300, 132, loc("Systeme_119"), false)

        GUIEditor.label[1] = guiCreateLabel(10, 26, 281, 63, loc("Systeme_120"), false, GUIEditor.window[1])
        GUIEditor.button[1] = guiCreateButton(10, 95, 281, 27, loc("Systeme_121"), false, GUIEditor.window[1])
		setWindowDatas(1)
		
		addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
			if(getElementData(localPlayer,"Bankpin") == 0)then
				local pin = math.random(1111,9999)
				setElementData(localPlayer,"Bankpin",pin)
				infobox(loc("Systeme_122"):format(pin),"info")
			else infobox(loc("Systeme_123"),"error")end
		end,false)
	end
end)