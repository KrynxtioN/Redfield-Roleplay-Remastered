-- [[ DAS FENSTER ]] --

addEvent("Interaktion.openWindow",true)
addEventHandler("Interaktion.openWindow",root,function()
	if(isWindowOpen())then
        GUIEditor.window[1] = guiCreateWindow(491, 295, 328, 108, loc("Systeme_25"):format(getElementData(localPlayer,"InteraktionPlayer")), false)

        GUIEditor.button[1] = guiCreateButton(10, 28, 149, 30, loc("Systeme_26"), false, GUIEditor.window[1])
        GUIEditor.button[2] = guiCreateButton(169, 28, 149, 30, loc("Systeme_27"), false, GUIEditor.window[1])
        GUIEditor.button[3] = guiCreateButton(10, 68, 149, 30, loc("Systeme_28"), false, GUIEditor.window[1])
        GUIEditor.button[4] = guiCreateButton(169, 68, 149, 30, loc("Systeme_29"), false, GUIEditor.window[1])
		setWindowDatas()

		addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
			Interaktion.handeln()
		end,false)
		
		addEventHandler("onClientGUIClick",GUIEditor.button[2],function()
			Interaktion.bewerten()
		end,false)

		addEventHandler("onClientGUIClick",GUIEditor.button[3],function()
			Interaktion.fraktion()
		end,false)
		
		addEventHandler("onClientGUIClick",GUIEditor.button[4],function()
			triggerServerEvent("Interaktion.lizenzen",localPlayer)
		end,false)
	end
end)

-- [[ HANDELN ]] --

function Interaktion.handeln()
	destroyElement(GUIEditor.window[1])
    GUIEditor.window[1] = guiCreateWindow(523, 245, 453, 271, loc("Systeme_30"):format(getElementData(localPlayer,"InteraktionPlayer")), false)

    GUIEditor.gridlist[1] = guiCreateGridList(10, 27, 252, 234, false, GUIEditor.window[1])
    item = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Systeme_31"), 0.5)
    menge = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Systeme_32"), 0.5)
    GUIEditor.label[1] = guiCreateLabel(272, 27, 171, 27, loc("Systeme_33"), false, GUIEditor.window[1])
    GUIEditor.edit[1] = guiCreateEdit(272, 64, 171, 27, "", false, GUIEditor.window[1])
    GUIEditor.button[1] = guiCreateButton(272, 234, 171, 27, loc("Systeme_34"), false, GUIEditor.window[1])
	setWindowDatas(1,_,true)
	
	Interaktion.setPlayerItems()
		
	addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
		local clicked = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),1)
		local edit = guiGetText(GUIEditor.edit[1])
		if(#edit >= 1 and tonumber(edit) and clicked ~= "")then
			triggerServerEvent("Interaktion.handeln",localPlayer,clicked,edit)
			Interaktion.setPlayerItems()
		end
	end,false)
end

function Interaktion.setPlayerItems()
	guiGridListClear(GUIEditor.gridlist[1])
	for _,v in pairs(Interaktion["Items"])do
		if(tonumber(getElementData(localPlayer,v)) >= 1)then
			local row = guiGridListAddRow(GUIEditor.gridlist[1])
			guiGridListSetItemText(GUIEditor.gridlist[1],row,item,v,false,false)
			guiGridListSetItemText(GUIEditor.gridlist[1],row,menge,getElementData(localPlayer,v),false,false)
		end
	end
end

-- [[ EINEN ANDEREN SPIELER BEWERTEN ]] --

function Interaktion.bewerten()
	destroyElement(GUIEditor.window[1])
    GUIEditor.window[1] = guiCreateWindow(606, 338, 277, 142, loc("Systeme_35"):format(getElementData(localPlayer,"InteraktionPlayer")), false)

    GUIEditor.button[1] = guiCreateButton(10, 28, 257, 28, loc("Systeme_36"), false, GUIEditor.window[1])
    GUIEditor.button[2] = guiCreateButton(10, 66, 257, 28, loc("Systeme_37"), false, GUIEditor.window[1])
    GUIEditor.button[3] = guiCreateButton(10, 104, 257, 28, loc("Systeme_38"), false, GUIEditor.window[1])
	setWindowDatas(_,_,true)
		
	for i = 1,3 do
		addEventHandler("onClientGUIClick",GUIEditor.button[i],function()
			triggerServerEvent("Interaktion.bewerten",localPlayer,guiGetText(source))
		end,false)
	end
end

-- [[ FRAKTIONSFENSTER ]] --

function Interaktion.fraktion()
	local faction = getElementData(localPlayer,"Fraktion")
	if(faction == 1 or faction == 2 or faction == 3)then
		if(getElementData(localPlayer,"FDuty") == true)then
			destroyElement(GUIEditor.window[1])
			GUIEditor.window[1] = guiCreateWindow(491, 295, 328, 146, loc("Systeme_39"):format(getElementData(localPlayer,"InteraktionPlayer")), false)

			GUIEditor.button[1] = guiCreateButton(10, 28, 149, 30, loc("Systeme_40"), false, GUIEditor.window[1])
			GUIEditor.button[2] = guiCreateButton(169, 28, 149, 30, loc("Systeme_41"), false, GUIEditor.window[1])
			GUIEditor.button[3] = guiCreateButton(10, 68, 149, 30, loc("Systeme_42"), false, GUIEditor.window[1])
			GUIEditor.button[4] = guiCreateButton(169, 68, 149, 30, loc("Systeme_43"), false, GUIEditor.window[1])
			GUIEditor.label[1] = guiCreateLabel(10, 108, 149, 28, loc("Systeme_44"), false, GUIEditor.window[1])
			GUIEditor.edit[1] = guiCreateEdit(169, 108, 149, 28, "", false, GUIEditor.window[1])
			setWindowDatas(1,_,true)
			
			addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
				triggerServerEvent("Staatsfraktionen.entwaffnen",localPlayer)
			end,false)
			
			addEventHandler("onClientGUIClick",GUIEditor.button[2],function()
				triggerServerEvent("Staatsfraktionen.durchsuchen",localPlayer)
			end,false)
			
			addEventHandler("onClientGUIClick",GUIEditor.button[3],function()
				triggerServerEvent("Staatsfraktionen.takeillegal",localPlayer)
			end,false)
			
			addEventHandler("onClientGUIClick",GUIEditor.button[4],function()
				local panote = guiGetText(GUIEditor.edit[1])
				if(#panote >= 1 and tonumber(panote))then
					triggerServerEvent("Staatsfraktionen.policeAcademyNote",localPlayer,panote)
				end
			end,false)
		else infobox(loc("Systeme_45"),"error")end
	else infobox(loc("Systeme_46"),"error")end
end