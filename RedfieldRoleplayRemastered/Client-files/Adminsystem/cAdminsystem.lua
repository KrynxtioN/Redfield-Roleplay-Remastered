-- [[ FENSTER ]] --

addEvent("Adminsystem.openWindow",true)
addEventHandler("Adminsystem.openWindow",root,function(bretter)
	if(isWindowOpen())then
		GUIEditor.window[1] = guiCreateWindow(166, 96, 639, 388, loc("Adminsystem_1"), false)

		GUIEditor.tabpanel[1] = guiCreateTabPanel(10, 23, 619, 355, false, GUIEditor.window[1])

		GUIEditor.tab[1] = guiCreateTab(loc("Adminsystem_2"), GUIEditor.tabpanel[1])

		GUIEditor.gridlist[1] = guiCreateGridList(10, 10, 195, 311, false, GUIEditor.tab[1])
		spieler = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Adminsystem_3"), 0.9)
		GUIEditor.button[1] = guiCreateButton(417, 10, 192, 27, loc("Adminsystem_4"), false, GUIEditor.tab[1])
		GUIEditor.button[2] = guiCreateButton(215, 10, 192, 27, loc("Adminsystem_5"), false, GUIEditor.tab[1])
		GUIEditor.button[3] = guiCreateButton(215, 47, 192, 27, loc("Adminsystem_6"), false, GUIEditor.tab[1])
		GUIEditor.button[4] = guiCreateButton(417, 47, 192, 27, loc("Adminsystem_7"), false, GUIEditor.tab[1])
		GUIEditor.button[5] = guiCreateButton(215, 84, 192, 27, loc("Adminsystem_8"), false, GUIEditor.tab[1])
		GUIEditor.button[6] = guiCreateButton(417, 84, 192, 27, loc("Adminsystem_9"), false, GUIEditor.tab[1])
		GUIEditor.button[7] = guiCreateButton(215, 121, 192, 27, loc("Adminsystem_10"), false, GUIEditor.tab[1])
		GUIEditor.button[8] = guiCreateButton(417, 121, 192, 27, loc("Adminsystem_11"), false, GUIEditor.tab[1])
		GUIEditor.button[9] = guiCreateButton(215, 195, 192, 27, loc("Adminsystem_12"), false, GUIEditor.tab[1])
		GUIEditor.button[10] = guiCreateButton(417, 158, 192, 27, loc("Adminsystem_13"), false, GUIEditor.tab[1])
		GUIEditor.button[11] = guiCreateButton(215, 158, 192, 27, loc("Adminsystem_14"), false, GUIEditor.tab[1])
		GUIEditor.button[12] = guiCreateButton(417, 294, 192, 27, loc("Adminsystem_15"), false, GUIEditor.tab[1])
		GUIEditor.button[13] = guiCreateButton(417, 195, 192, 27, loc("Adminsystem_16"), false, GUIEditor.tab[1])
		GUIEditor.edit[1] = guiCreateEdit(215, 257, 192, 27, loc("Adminsystem_17"), false, GUIEditor.tab[1])
		GUIEditor.edit[2] = guiCreateEdit(215, 294, 192, 27, loc("Adminsystem_18"), false, GUIEditor.tab[1])
		GUIEditor.button[14] = guiCreateButton(417, 257, 192, 27, loc("Adminsystem_19"), false, GUIEditor.tab[1])
			
		GUIEditor.tab[2] = guiCreateTab(loc("Adminsystem_20"), GUIEditor.tabpanel[1])

		GUIEditor.gridlist[2] = guiCreateGridList(10, 10, 195, 311, false, GUIEditor.tab[2])
		event = guiGridListAddColumn(GUIEditor.gridlist[2], loc("Adminsystem_21"), 0.9)
		GUIEditor.button[15] = guiCreateButton(215, 10, 192, 27, loc("Adminsystem_22"), false, GUIEditor.tab[2])
		GUIEditor.button[16] = guiCreateButton(417, 10, 192, 27, loc("Adminsystem_23"), false, GUIEditor.tab[2])

		GUIEditor.tab[3] = guiCreateTab(loc("Adminsystem_24"), GUIEditor.tabpanel[1])

		GUIEditor.gridlist[3] = guiCreateGridList(10, 10, 195, 311, false, GUIEditor.tab[3])
		brettID = guiGridListAddColumn(GUIEditor.gridlist[3], loc("Adminsystem_25"), 0.2)
		brett = guiGridListAddColumn(GUIEditor.gridlist[3], loc("Adminsystem_26"), 0.6)
		GUIEditor.button[17] = guiCreateButton(215, 294, 192, 27, loc("Adminsystem_27"), false, GUIEditor.tab[3])
		GUIEditor.button[18] = guiCreateButton(417, 294, 192, 27, loc("Adminsystem_28"), false, GUIEditor.tab[3])
		GUIEditor.memo[1] = guiCreateMemo(215, 10, 394, 274, loc("Adminsystem_29"), false, GUIEditor.tab[3])
		guiMemoSetReadOnly(GUIEditor.memo[1], true)

		GUIEditor.tab[4] = guiCreateTab(loc("Adminsystem_30"), GUIEditor.tabpanel[1])

		GUIEditor.gridlist[4] = guiCreateGridList(10, 10, 195, 311, false, GUIEditor.tab[4])
		fahrzeuge = guiGridListAddColumn(GUIEditor.gridlist[4], loc("Adminsystem_31"), 0.9)
		GUIEditor.button[19] = guiCreateButton(215, 10, 192, 27, loc("Adminsystem_32"), false, GUIEditor.tab[4]) 
			
		GUIEditor.tab[5] = guiCreateTab(loc("Adminsystem_33"), GUIEditor.tabpanel[1])

		GUIEditor.gridlist[5] = guiCreateGridList(10, 10, 195, 311, false, GUIEditor.tab[5])
		logs = guiGridListAddColumn(GUIEditor.gridlist[5], loc("Adminsystem_34"), 0.9)
		GUIEditor.memo[2] = guiCreateMemo(215, 10, 394, 311, loc("Adminsystem_35"), false, GUIEditor.tab[5])
		guiMemoSetReadOnly(GUIEditor.memo[2], true)  
		setWindowDatas()

		-- [[ GRIDLISTS ]] --
		
		-- Spieler
		for _,v in pairs(getElementsByType("player"))do
			local row = guiGridListAddRow(GUIEditor.gridlist[1])
			guiGridListSetItemText(GUIEditor.gridlist[1],row,spieler,getPlayerName(v),false,false)
		end
		
		-- Events
		if(#Adminsystem["Events"] >= 1)then
			for _,v in pairs(Adminsystem["Events"])do
				local row = guiGridListAddRow(GUIEditor.gridlist[2])
				guiGridListSetItemText(GUIEditor.gridlist[2],row,event,v,false,false)
			end
		end
		
		-- Fahrzeuge
		if(#Adminsystem["Fahrzeuge"] >= 1)then
			for _,v in pairs(Adminsystem["Fahrzeuge"])do
				local row = guiGridListAddRow(GUIEditor.gridlist[4])
				guiGridListSetItemText(GUIEditor.gridlist[4],row,fahrzeuge,v,false,false)
			end
		end
			
		-- Logs
		if(#Adminsystem["Logs"] >= 1)then
			for _,v in pairs(Adminsystem["Logs"])do
				local row = guiGridListAddRow(GUIEditor.gridlist[5])
				guiGridListSetItemText(GUIEditor.gridlist[5],row,logs,v,false,false)
			end
		end
			
		-- Schwarze Bretter
		if(#bretter >= 1)then
			for _,v in pairs(bretter)do
				local row = guiGridListAddRow(GUIEditor.gridlist[3])
				guiGridListSetItemText(GUIEditor.gridlist[3],row,brettID,v[1],false,false)
				guiGridListSetItemText(GUIEditor.gridlist[3],row,brett,v[2],false,false)
			end
		end
			
		-- [[ FUKTIONEN ]] --
			
		-- Kicken
		addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
			local clicked = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),1)
			local edit = guiGetText(GUIEditor.edit[1])
			if(clicked ~= "" and #edit >= 1)then
				triggerServerEvent("Adminsystem.kicken",localPlayer,clicked,edit)
			else infobox(loc("Adminsystem_36"),"error")end
		end,false)
		
		-- Bannen
		addEventHandler("onClientGUIClick",GUIEditor.button[2],function()
			local clicked = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),1)
			local edit = guiGetText(GUIEditor.edit[1])
			local time = guiGetText(GUIEditor.edit[2])
			if(clicked ~= "" and #edit >= 1 and #time >= 1 and isOnlyNumbers(time))then
				triggerServerEvent("Adminsystem.bannen",localPlayer,clicked,edit,time)
			else infobox(loc("Adminsystem_37"),"error")end
		end,false)
		
		-- Zum Spieler teleportieren
		addEventHandler("onClientGUIClick",GUIEditor.button[3],function()
			local clicked = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),1)
			if(clicked ~= "")then
				triggerServerEvent("Adminsystem.teleportToPlayer",localPlayer,clicked)
			else infobox(loc("Adminsystem_38"),"error")end
		end,false)
		
		-- Spieler zu dir teleportieren
		addEventHandler("onClientGUIClick",GUIEditor.button[4],function()
			local clicked = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),1)
			if(clicked ~= "")then
				triggerServerEvent("Adminsystem.teleportPlayerToYou",localPlayer,clicked)
			else infobox(loc("Adminsystem_39"),"error")end
		end,false)
		
		-- Adminlevel vergeben
		addEventHandler("onClientGUIClick",GUIEditor.button[5],function()
			local clicked = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),1)
			local edit = guiGetText(GUIEditor.edit[1])
			if(clicked ~= "" and #edit >= 1 and isOnlyNumbers(edit))then
				triggerServerEvent("Adminsystem.giveAdminlevel",localPlayer,clicked,edit)
			else infobox(loc("Adminsystem_40"),"error")end
		end,false)
		
		-- Warn vergeben
		addEventHandler("onClientGUIClick",GUIEditor.button[6],function()
			local clicked = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),1)
			local edit = guiGetText(GUIEditor.edit[1])
			if(clicked ~= "" and #edit >= 1)then
				triggerServerEvent("Adminsystem.giveWarn",localPlayer,clicked,edit)
			else infobox(loc("Adminsystem_41"),"error")end
		end,false)
		
		-- Warn entfernen
		addEventHandler("onClientGUIClick",GUIEditor.button[7],function()
			local clicked = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),1)
			local edit = guiGetText(GUIEditor.edit[1])
			if(clicked ~= "" and #edit >= 1)then
				triggerServerEvent("Adminsystem.removeWarn",localPlayer,clicked,edit)
			else infobox(loc("Adminsystem_42"),"error")end
		end,false)
		
		-- Spectaten
		addEventHandler("onClientGUIClick",GUIEditor.button[8],function()
			local clicked = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),1)
			if(clicked ~= "")then
				triggerServerEvent("Adminsystem.spectaten",localPlayer,clicked)
			else infobox(loc("Adminsystem_43"),"error")end
		end,false)
		
		-- Chat leeren
		addEventHandler("onClientGUIClick",GUIEditor.button[9],function()
			triggerServerEvent("Adminsystem.clearChat",localPlayer)
		end,false)
		
		-- Fahrzeug zu dir teleportieren
		addEventHandler("onClientGUIClick",GUIEditor.button[10],function()
			local edit = guiGetText(GUIEditor.edit[1])
			if(#edit >= 1 and isOnlyNumbers(edit))then
				triggerServerEvent("Adminsystem.teleportVehicleToYou",localPlayer,edit)
			else infobox(loc("Adminsystem_44"),"error")end
		end,false)
		
		-- Zum Fahrzeug teleportieren
		addEventHandler("onClientGUIClick",GUIEditor.button[11],function()
			local edit = guiGetText(GUIEditor.edit[1])
			if(#edit >= 1 and isOnlyNumbers(edit))then
				triggerServerEvent("Adminsystem.teleportToVehicle",localPlayer,edit)
			else infobox(loc("Adminsystem_45"),"error")end
		end,false)
		
		-- Aus dem Prison entlassen
		addEventHandler("onClientGUIClick",GUIEditor.button[12],function()
			local clicked = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),1)
			local edit = guiGetText(GUIEditor.edit[1])
			if(clicked ~= "" and #edit >= 1)then
				triggerServerEvent("Adminsystem.ausPrisonEntlassen",localPlayer,clicked,edit)
			else infobox(loc("Adminsystem_46"),"error")end
		end,false)
		
		-- Leader vergeben
		addEventHandler("onClientGUIClick",GUIEditor.button[13],function()
			local clicked = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),1)
			local id = guiGetText(GUIEditor.edit[1])
			if(clicked ~= "" and #id >= 1 and isOnlyNumbers(id))then
				Adminsystem.saveStuff = {clicked,id}
				destroyElement(GUIEditor.window[1])
				
				GUIEditor.window[1] = guiCreateWindow(580, 345, 270, 108, "Adminsystem", false)
				centerWindow(GUIEditor.window[1])
				
				GUIEditor.button[1] = guiCreateButton(10, 28, 250, 30, "Fraktion", false, GUIEditor.window[1])
				GUIEditor.button[2] = guiCreateButton(10, 68, 250, 30, "Unternehmen", false, GUIEditor.window[1])
				
				addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
					triggerServerEvent("Adminsystem.setLeader",localPlayer,Adminsystem.saveStuff[1],"Fraktion",Adminsystem.saveStuff[2])
					setWindowDatas()
				end,false)
				
				addEventHandler("onClientGUIClick",GUIEditor.button[2],function()
					triggerServerEvent("Adminsystem.setLeader",localPlayer,Adminsystem.saveStuff[1],"Unternehmen",Adminsystem.saveStuff[2])
					setWindowDatas()
				end,false)
			else infobox(loc("Adminsystem_47"),"error")end
		end,false)
		
		-- Ins Prison sperren
		addEventHandler("onClientGUIClick",GUIEditor.button[14],function()
			local clicked = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),1)
			local grund = guiGetText(GUIEditor.edit[1])
			local marker = guiGetText(GUIEditor.edit[2])
			if(clicked ~= "" and #marker >= 1 and isOnlyNumbers(marker) and #grund >= 1)then
				triggerServerEvent("Adminsystem.setPrison",localPlayer,clicked,guiGetText(source),marker,grund)
			else infobox(loc("Adminsystem_48"),"error")end
		end,false)
		
		-- Event starten
		addEventHandler("onClientGUIClick",GUIEditor.button[15],function()
			local clicked = guiGridListGetItemText(GUIEditor.gridlist[2],guiGridListGetSelectedItem(GUIEditor.gridlist[2]),1)
			if(clicked ~= "")then
				triggerServerEvent("Adminsystem.startEvent",localPlayer,clicked)
			else infobox(loc("Adminsystem_49"),"error")end
		end,false)
		
		-- Event stoppen
		addEventHandler("onClientGUIClick",GUIEditor.button[16],function()
			triggerServerEvent("Adminsystem.stopEvent",localPlayer,localPlayer)
		end,false)
		
		-- Schwarzes Brett editieren
		addEventHandler("onClientGUIClick",GUIEditor.button[17],function()
			local clicked = guiGridListGetItemText(GUIEditor.gridlist[3],guiGridListGetSelectedItem(GUIEditor.gridlist[3]),1)
			if(clicked ~= "")then
				if(getElementData(localPlayer,"Adminlevel") >= 7)then
					guiMemoSetReadOnly(GUIEditor.memo[1],false)
					infobox(loc("Adminsystem_54"),"info")
				else infobox(loc("Adminsystem_53"),"error")end
			else infobox(loc("Adminsystem_50"),"error")end
		end,false)
		
		-- Neuen Schwarzen Brett Text speichern
		addEventHandler("onClientGUIClick",GUIEditor.button[18],function()
			local clicked = guiGridListGetItemText(GUIEditor.gridlist[3],guiGridListGetSelectedItem(GUIEditor.gridlist[3]),1)
			if(clicked ~= "")then
				triggerServerEvent("setBrettText",localPlayer,clicked,guiGetText(GUIEditor.memo[1]))
				guiMemoSetReadOnly(GUIEditor.memo[1],true)
			else infobox(loc("Adminsystem_51"),"error")end
		end,false)
		
		-- Fahrzeuge respawnen
		addEventHandler("onClientGUIClick",GUIEditor.button[19],function()
			local clicked = guiGridListGetItemText(GUIEditor.gridlist[4],guiGridListGetSelectedItem(GUIEditor.gridlist[4]),1)
			if(clicked ~= "")then
				triggerServerEvent("newRespawnVehicle",localPlayer,localPlayer,clicked)
			else infobox(loc("Adminsystem_52"),"error")end
		end,false)
			
		-- Text vom Schwarzen Brett anzeigen
		addEventHandler("onClientGUIClick",GUIEditor.gridlist[3],function()
			local clicked = guiGridListGetItemText(GUIEditor.gridlist[3],guiGridListGetSelectedItem(GUIEditor.gridlist[3]),1)
			if(clicked ~= "")then
				triggerServerEvent("getBrettText",localPlayer,clicked)
			end
		end,false)
			
		-- Logs anzeigen
		addEventHandler("onClientGUIClick",GUIEditor.gridlist[5],function()
			local clicked = guiGridListGetItemText(GUIEditor.gridlist[5],guiGridListGetSelectedItem(GUIEditor.gridlist[5]),1)
			if(clicked ~= "")then
				triggerServerEvent("getLogText",localPlayer,clicked)
			end
		end,false)
	end
end)

-- [[ EVENTS ZUM REFRESHEN DER TEXTE ]] --

addEvent("setLogText",true)
addEventHandler("setLogText",root,function(text)
	guiSetText(GUIEditor.memo[2],text)
end)

addEvent("setBrettText",true)
addEventHandler("setBrettText",root,function(text)
	guiSetText(GUIEditor.memo[1],text)
	guiMemoSetReadOnly(GUIEditor.memo[1],true)
end)

-- [[ NICKCHANGES ]] --

addEvent("Adminsystem.openNickchanges",true)
addEventHandler("Adminsystem.openNickchanges",root,function(nickchanges)
	if(isWindowOpen())then
        GUIEditor.window[1] = guiCreateWindow(1041, 294, 451, 378, "", false)

        GUIEditor.gridlist[1] = guiCreateGridList(10, 26, 279, 342, false, GUIEditor.window[1])
        ID = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Adminsystem_59"), 0.3)
        Name = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Adminsystem_60"), 0.3)
        NeuerName = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Adminsystem_61"), 0.3)
        GUIEditor.button[1] = guiCreateButton(299, 26, 142, 29, loc("Adminsystem_62"), false, GUIEditor.window[1])
        GUIEditor.label[1] = guiCreateLabel(299, 65, 142, 24, loc("Adminsystem_63"), false, GUIEditor.window[1])
        GUIEditor.edit[1] = guiCreateEdit(299, 99, 142, 26, "", false, GUIEditor.window[1])
        GUIEditor.button[2] = guiCreateButton(299, 135, 142, 29, loc("Adminsystem_64"), false, GUIEditor.window[1])
		setWindowDatas(1)
		
		if(#nickchanges >= 1)then
			for _,v in pairs(nickchanges)do
				local row = guiGridListAddRow(GUIEditor.gridlist[1])
				guiGridListSetItemText(GUIEditor.gridlist[1],row,ID,v[1],false,false)
				guiGridListSetItemText(GUIEditor.gridlist[1],row,Name,v[2],false,false)
				guiGridListSetItemText(GUIEditor.gridlist[1],row,NeuerName,v[3],false,false)
			end
		end
		
		addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
			local clicked = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),1)
			if(clicked ~= "")then
				triggerServerEvent("Nickchange.accept",localPlayer,"Annehmen",clicked)
			end
		end,false)
		
		addEventHandler("onClientGUIClick",GUIEditor.button[2],function()
			local clicked = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),1)
			if(clicked ~= "")then
				triggerServerEvent("Nickchange.accept",localPlayer,"Ablehnen",clicked)
			end
		end,false)
	end
end)