-- [[ MARKER ZUR BÜCHERKONTROLLE ]] --

Buecherei.marker = createMarker(694.61120605469,-1208.8560791016,2083.9743652344-0.9,"cylinder",1,255,0,0,100)
setElementInterior(Buecherei.marker,1)

-- [[ AUSSTEHENDE ANTRÄGE ]] --

addEventHandler("onClientMarkerHit",Buecherei.marker,function(player)
	if(player == localPlayer)then
		if(isWindowOpen())then
			GUIEditor.window[1] = guiCreateWindow(341, 208, 696, 402, loc("Shops_1"), false)

			GUIEditor.gridlist[1] = guiCreateGridList(11, 26, 246, 366, false, GUIEditor.window[1])
			id = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Shops_2"), 0.2)
			titel = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Shops_3"), 0.7)
			GUIEditor.label[1] = guiCreateLabel(267, 26, 419, 26, loc("Shops_4"), false, GUIEditor.window[1])
			GUIEditor.memo[1] = guiCreateMemo(267, 62, 419, 287, "", false, GUIEditor.window[1])
			guiMemoSetReadOnly(GUIEditor.memo[1], true)
			GUIEditor.button[1] = guiCreateButton(267, 359, 203, 33, loc("Shops_5"), false, GUIEditor.window[1])
			GUIEditor.button[2] = guiCreateButton(483, 359, 203, 33, loc("Shops_6"), false, GUIEditor.window[1])
			setWindowDatas(1)
			
			triggerServerEvent("Buecherei.getEingereichteBooks",localPlayer)
			
			for i = 1,2 do
				addEventHandler("onClientGUIClick",GUIEditor.button[i],function()
					local clicked = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),1)
					if(clicked ~= "")then
						triggerServerEvent("Buecherei.freischaltenOrDelete",localPlayer,clicked,guiGetText(source))
						triggerServerEvent("Buecherei.getEingereichteBooks",localPlayer)
					end
				end,false)
			end
			
			addEventHandler("onClientGUIClick",GUIEditor.gridlist[1],function()
					local clicked = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),1)
					if(clicked ~= "")then
						triggerServerEvent("Buecherei.getEingereichtesBookData",localPlayer,clicked)
					end
			end,false)
		end
	end
end)

-- [[ DAS FENSTER ]] --

addEvent("Buecherei.openWindow",true)
addEventHandler("Buecherei.openWindow",root,function(books)
	if(isWindowOpen())then
        GUIEditor.window[1] = guiCreateWindow(380, 230, 592, 374, loc("Shops_7"), false)

        GUIEditor.gridlist[1] = guiCreateGridList(10, 96, 572, 229, false, GUIEditor.window[1])
        id = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Shops_8"), 0.1)
        titel = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Shops_9"), 0.5)
        autor = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Shops_10"), 0.5)
        GUIEditor.label[1] = guiCreateLabel(10, 26, 572, 60, loc("Shops_11"), false, GUIEditor.window[1])
        GUIEditor.button[1] = guiCreateButton(10, 335, 156, 29, loc("Shops_12"), false, GUIEditor.window[1])
        GUIEditor.button[2] = guiCreateButton(176, 335, 156, 29, loc("Shops_13"), false, GUIEditor.window[1])
        GUIEditor.button[3] = guiCreateButton(342, 335, 240, 29, loc("Shops_14"), false, GUIEditor.window[1])
		setWindowDatas(1)
		
		if(#books >= 1)then
			for k,v in pairs(books) do 
				local row = guiGridListAddRow(GUIEditor.gridlist[1])
				guiGridListSetItemText(GUIEditor.gridlist[1],row,id,v[1],false,false)
				guiGridListSetItemText(GUIEditor.gridlist[1],row,titel,v[2],false,false)
				guiGridListSetItemText(GUIEditor.gridlist[1],row,autor,v[3],false,false)
			end
		end
		
		addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
			local clicked = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),1)
			if(clicked ~= "")then
				triggerServerEvent("Buecherei.ausleihen",localPlayer,clicked)
			end
		end,false)
		
		addEventHandler("onClientGUIClick",GUIEditor.button[2],function()
			Buecherei.schreiben()
		end,false)
		
		addEventHandler("onClientGUIClick",GUIEditor.button[3],function()
			Buecherei.verwaltung()
		end,false)
	end
end)

-- [[ EIN BUCH SCHREIBEN ]] --

function Buecherei.schreiben()
	destroyElement(GUIEditor.window[1])
    GUIEditor.window[1] = guiCreateWindow(380, 230, 592, 374, loc("Shops_15"), false)

    GUIEditor.label[1] = guiCreateLabel(10, 26, 166, 29, loc("Shops_16"), false, GUIEditor.window[1])
    GUIEditor.button[1] = guiCreateButton(10, 335, 572, 29, loc("Shops_17"), false, GUIEditor.window[1])
    GUIEditor.edit[1] = guiCreateEdit(186, 26, 396, 29, "", false, GUIEditor.window[1])
    GUIEditor.memo[1] = guiCreateMemo(10, 65, 572, 260, "", false, GUIEditor.window[1])
	setWindowDatas(1,_,true)
	
	addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
		local titel,text = guiGetText(GUIEditor.edit[1]),guiGetText(GUIEditor.memo[1])
		if(#titel >= 1 and #titel <= 46 and #text >= 1)then
			triggerServerEvent("Buecherei.einreichen",localPlayer,titel,text)
		else infobox(loc("Shops_18"),"error")end
	end,false)
end

-- [[ BUCHVERWALTUNG ]] --

function Buecherei.verwaltung()
	destroyElement(GUIEditor.window[1])

    GUIEditor.window[1] = guiCreateWindow(506, 246, 648, 366, loc("Shops_19"), false)

    GUIEditor.gridlist[1] = guiCreateGridList(10, 26, 628, 330, false, GUIEditor.window[1])
    id = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Shops_20"), 0.1)
    titel = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Shops_21"), 0.3)
    autor = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Shops_22"), 0.3)
    leihzeit = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Shops_23"), 0.3)
	setWindowDatas(_,_,true)
	
	triggerServerEvent("Buecherei.getVerwaltungsBooks",localPlayer)
	
	addEventHandler("onClientGUIClick",GUIEditor.gridlist[1],function()
		local clicked = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),1)
		if(clicked ~= "")then
			triggerServerEvent("Buecherei.getBookText",localPlayer,clicked)
		end
	end,false)
end

-- [[ EIN BUCH LESEN ]] --

addEvent("Buecherei.inhalt",true)
addEventHandler("Buecherei.inhalt",root,function(name,text)
	destroyElement(GUIEditor.window[1])
    GUIEditor.window[1] = guiCreateWindow(506, 246, 648, 366, name, false)

    GUIEditor.memo[1] = guiCreateMemo(9, 26, 629, 293, text, false, GUIEditor.window[1])
    guiMemoSetReadOnly(GUIEditor.memo[1], true)
    GUIEditor.button[1] = guiCreateButton(9, 328, 629, 28, loc("Shops_24"), false, GUIEditor.window[1])
	setWindowDatas(_,_,true)
	
	addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
		Buecherei.verwaltung()
	end,false)
end)

-- [[ DIE VERWALTUNGSDATAS SETZEN ]] --

addEvent("Buecherei.setVerwaltungsBooks",true)
addEventHandler("Buecherei.setVerwaltungsBooks",root,function(books)
	if(#books >= 1)then
		for k,v in pairs(books) do 
			local row = guiGridListAddRow(GUIEditor.gridlist[1])
			guiGridListSetItemText(GUIEditor.gridlist[1],row,id,v[1],false,false)
			guiGridListSetItemText(GUIEditor.gridlist[1],row,titel,v[2],false,false)
			guiGridListSetItemText(GUIEditor.gridlist[1],row,autor,v[3],false,false)
			guiGridListSetItemText(GUIEditor.gridlist[1],row,leihzeit,v[4],false,false)
		end
	end
end)

addEvent("Buecherei.setEingereichteBooks",true)
addEventHandler("Buecherei.setEingereichteBooks",root,function(books)
	guiGridListClear(GUIEditor.gridlist[1])
	if(#books >= 1)then
		for k,v in pairs(books) do 
			local row = guiGridListAddRow(GUIEditor.gridlist[1])
			guiGridListSetItemText(GUIEditor.gridlist[1],row,id,v[1],false,false)
			guiGridListSetItemText(GUIEditor.gridlist[1],row,titel,v[2],false,false)
		end
	end
end)

addEvent("Buecherei.setEingereichtesBookData",true)
addEventHandler("Buecherei.setEingereichtesBookData",root,function(titel,autor,text)
	guiSetText(GUIEditor.label[1],loc("Shops_25"):format(titel,autor))
	guiSetText(GUIEditor.memo[1],text)
end)