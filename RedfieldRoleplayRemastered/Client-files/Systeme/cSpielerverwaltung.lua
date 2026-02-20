-- [[ DAS FENSTER ]] --

addEvent("Eigenmenue.Spielerverwaltung",true)
addEventHandler("Eigenmenue.Spielerverwaltung",root,function()
    GUIEditor.window[1] = guiCreateWindow(417, 280, 481, 249, loc("Systeme_139"), false, "nocross")

    GUIEditor.gridlist[1] = guiCreateGridList(10, 27, 173, 210, false, GUIEditor.window[1])
    spawn = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Systeme_140"), 0.9)
    GUIEditor.button[1] = guiCreateButton(337, 27, 134, 29, loc("Systeme_141"), false, GUIEditor.window[1])
    GUIEditor.button[2] = guiCreateButton(193, 27, 134, 29, loc("Systeme_142"), false, GUIEditor.window[1])
    GUIEditor.button[3] = guiCreateButton(193, 66, 134, 29, loc("Systeme_143"), false, GUIEditor.window[1])
    GUIEditor.button[4] = guiCreateButton(337, 66, 134, 29, loc("Systeme_144"), false, GUIEditor.window[1])
    GUIEditor.button[5] = guiCreateButton(193, 105, 134, 29, loc("Systeme_145"), false, GUIEditor.window[1])
    GUIEditor.button[6] = guiCreateButton(337, 105, 134, 29, loc("Systeme_146"), false, GUIEditor.window[1])
    GUIEditor.label[1] = guiCreateLabel(193, 144, 278, 15, "__________________________________________________________", false, GUIEditor.window[1])
    GUIEditor.button[7] = guiCreateButton(193, 169, 134, 29, loc("Systeme_147"), false, GUIEditor.window[1])
    GUIEditor.button[8] = guiCreateButton(193, 208, 134, 29, loc("Systeme_148"), false, GUIEditor.window[1])
	GUIEditor.button[9] = guiCreateButton(337, 169, 134, 29, loc("Systeme_149"), false, GUIEditor.window[1])
    GUIEditor.button[10] = guiCreateButton(337, 208, 134, 29, "-", false, GUIEditor.window[1])
	setWindowDatas(1,_,true)
		
	if(getElementData(localPlayer,"Hitsound") == 1)then guiSetText(GUIEditor.button[1],loc("Systeme_150"))end
	if(getElementData(localPlayer,"Autologin") == 1)then guiSetText(GUIEditor.button[3],loc("Systeme_151"))end
		
	local row = guiGridListAddRow(GUIEditor.gridlist[1])
	guiGridListSetItemText(GUIEditor.gridlist[1],row,spawn,"Noobspawn",false,false)
	if(getElementData(localPlayer,"Fraktion") >= 1)then
		local row = guiGridListAddRow(GUIEditor.gridlist[1])
		guiGridListSetItemText(GUIEditor.gridlist[1],row,spawn,"Fraktion",false,false)
	end
	if(getElementData(localPlayer,"Unternehmen") >= 1)then
		local row = guiGridListAddRow(GUIEditor.gridlist[1])
		guiGridListSetItemText(GUIEditor.gridlist[1],row,spawn,"Unternehmen",false,false)
	end
	if(getElementData(localPlayer,"Adminlevel") >= 1)then
		local row = guiGridListAddRow(GUIEditor.gridlist[1])
		guiGridListSetItemText(GUIEditor.gridlist[1],row,spawn,"Jetziger Standpunkt",false,false)
	end
	if(getElementData(localPlayer,"Fraktion") == 1)then
		local row = guiGridListAddRow(GUIEditor.gridlist[1])
		guiGridListSetItemText(GUIEditor.gridlist[1],row,spawn,"FCPD",false,false)
		local row = guiGridListAddRow(GUIEditor.gridlist[1])
		guiGridListSetItemText(GUIEditor.gridlist[1],row,spawn,"LSPD",false,false)
		local row = guiGridListAddRow(GUIEditor.gridlist[1])
		guiGridListSetItemText(GUIEditor.gridlist[1],row,spawn,"LVPD",false,false)
	end
	
	addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
		if(getElementData(localPlayer,"Hitsound") == 1)then
			setElementData(localPlayer,"Hitsound",0)
			infobox(loc("Systeme_152"),"error")
			guiSetText(GUIEditor.button[1],loc("Systeme_153"))
		else
			setElementData(localPlayer,"Hitsound",1)
			infobox(loc("Systeme_154"),"info")
			guiSetText(GUIEditor.button[1],loc("Systeme_155"))
		end
	end,false)
	
	addEventHandler("onClientGUIClick",GUIEditor.button[2],function()
		local clicked = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),1)
		if(clicked ~= "")then
			triggerServerEvent("Spielerverwaltung.changeSpawn",localPlayer,clicked)
		end
	end,false)
	
	addEventHandler("onClientGUIClick",GUIEditor.button[3],function()
		if(getElementData(localPlayer,"Autologin") == 1)then
			setElementData(localPlayer,"Autologin",0)
			infobox(loc("Systeme_156"),"error")
			guiSetText(GUIEditor.button[3],loc("Systeme_157"))
		else
			setElementData(localPlayer,"Autologin",1)
			infobox(loc("Systeme_158"),"info")
			guiSetText(GUIEditor.button[3],loc("Systeme_159"))
		end
	end,false)
	
	for i = 4,5 do
		addEventHandler("onClientGUIClick",GUIEditor.button[i],function()
			local text = guiGetText(source)
			destroyElement(GUIEditor.window[1])
			GUIEditor.window[1] = guiCreateWindow(480, 349, 373, 187, loc("Systeme_160"), false, "nocross")
			
			GUIEditor.label[1] = guiCreateLabel(10, 26, 353, 47, loc("Systeme_161"), false,GUIEditor.window[1])
			GUIEditor.label[2] = guiCreateLabel(10, 83, 145, 25, loc("Systeme_162"), false, GUIEditor.window[1])
			GUIEditor.edit[1] = guiCreateEdit(165, 83, 198, 25, "", false, GUIEditor.window[1])
			GUIEditor.label[3] = guiCreateLabel(10, 118, 145, 25, loc("Systeme_163"), false, GUIEditor.window[1])
			GUIEditor.edit[2] = guiCreateEdit(165, 118, 198, 25, "", false, GUIEditor.window[1])
			GUIEditor.button[1] = guiCreateButton(10, 153, 353, 24, loc("Systeme_164"), false, GUIEditor.window[1])
			setWindowDatas(3,_,true)
			
			if(text == "Name ändern")then
				guiSetText(GUIEditor.button[1],loc("Systeme_165"))
				guiSetText(GUIEditor.label[1],loc("Systeme_166"))
				guiSetText(GUIEditor.label[3],loc("Systeme_167"))
			end
				
			addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
				local edit1,edit2 = guiGetText(GUIEditor.edit[1]),guiGetText(GUIEditor.edit[2])
				if(#edit1 >= 1 and #edit2 >= 1)then
					triggerServerEvent("Spielerverwaltung.server",localPlayer,guiGetText(source),edit1,edit2)
				else infobox(loc("Systeme_168"),"error")end
			end,false)
		end,false)
	end
	
	addEventHandler("onClientGUIClick",GUIEditor.button[6],function()
		triggerServerEvent("Spielerverwaltung.kd",localPlayer)
	end,false)
	
	addEventHandler("onClientGUIClick",GUIEditor.button[7],function()
		destroyElement(GUIEditor.window[1])
	    GUIEditor.window[1] = guiCreateWindow(463, 296, 286, 98, loc("Systeme_169"), false, "nocross")

		GUIEditor.label[1] = guiCreateLabel(10, 27, 98, 24, loc("Systeme_170"), false, GUIEditor.window[1])
		GUIEditor.button[1] = guiCreateButton(10, 61, 266, 27, loc("Systeme_171"), false, GUIEditor.window[1])
		GUIEditor.edit[1] = guiCreateEdit(118, 27, 158, 24, "", false, GUIEditor.window[1])
		setWindowDatas(1,_,true)
		
		addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
			local edit = guiGetText(GUIEditor.edit[1])
			if(#edit >= 1)then
				triggerServerEvent("Spielerverwaltung.useBonuscode",localPlayer,edit)
			end
		end,false)
	end,false)
	
	addEventHandler("onClientGUIClick",GUIEditor.button[8],function()
		destroyElement(GUIEditor.window[1])
        GUIEditor.window[1] = guiCreateWindow(476, 284, 366, 336, loc("Systeme_172"), false,"nocross")

        GUIEditor.gridlist[1] = guiCreateGridList(10, 74, 346, 252, false, GUIEditor.window[1])
        spielerGridlist = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Systeme_173"), 0.5)
        spielstundenGridlist = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Systeme_174"), 0.5)
        GUIEditor.label[1] = guiCreateLabel(10, 26, 346, 38, loc("Systeme_175"), false, GUIEditor.window[1])
		setWindowDatas(1,_,true)
	end,false)
		
	addEventHandler("onClientGUIClick",GUIEditor.button[9],function()
		destroyElement(GUIEditor.window[1])
		GUIEditor.window[1] = guiCreateWindow(385, 177, 511, 318, loc("Systeme_176"), false,"nocross")

		GUIEditor.label[1] = guiCreateLabel(10, 26, 491, 28, loc("Systeme_177"):format(getElementData(localPlayer,"Bonuspunkte")), false, GUIEditor.window[1])
		GUIEditor.tabpanel[1] = guiCreateTabPanel(10, 64, 491, 208, false, GUIEditor.window[1])

		GUIEditor.tab[1] = guiCreateTab(loc("Systeme_178"), GUIEditor.tabpanel[1])
		
		GUIEditor.gridlist[1] = guiCreateGridList(10, 10, 471, 164, false, GUIEditor.tab[1])
		artikelGridlist = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Systeme_179"), 0.4)
		mengeGridlist = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Systeme_180"), 0.3)
		artikelpreisGridlist = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Systeme_181"), 0.3)
		
		for _,v in pairs(Spielerverwaltung["Shop"]["Items"])do
			local row = guiGridListAddRow(GUIEditor.gridlist[1])
			guiGridListSetItemText(GUIEditor.gridlist[1],row,artikelGridlist,v[1],false,false)
			guiGridListSetItemText(GUIEditor.gridlist[1],row,mengeGridlist,v[2],false,false)
			guiGridListSetItemText(GUIEditor.gridlist[1],row,artikelpreisGridlist,v[3],false,false)
		end

		GUIEditor.tab[2] = guiCreateTab(loc("Systeme_182"), GUIEditor.tabpanel[1])

		GUIEditor.gridlist[2] = guiCreateGridList(10, 10, 471, 164, false, GUIEditor.tab[2])
		fahrzeugGridlist = guiGridListAddColumn(GUIEditor.gridlist[2], loc("Systeme_183"), 0.5)
		fahrzeugpreisGridlist = guiGridListAddColumn(GUIEditor.gridlist[2], loc("Systeme_184"), 0.5)
		
		for _,v in pairs(Spielerverwaltung["Shop"]["Fahrzeuge"])do
			local row = guiGridListAddRow(GUIEditor.gridlist[2])
			guiGridListSetItemText(GUIEditor.gridlist[2],row,fahrzeugGridlist,v[1],false,false)
			guiGridListSetItemText(GUIEditor.gridlist[2],row,fahrzeugpreisGridlist,v[2],false,false)
		end
			
		GUIEditor.button[1] = guiCreateButton(10, 282, 491, 26, loc("Systeme_185"), false, GUIEditor.window[1])
		setWindowDatas(1,_,true)
		
		addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
			if(guiGetSelectedTab(GUIEditor.tabpanel[1]) == GUIEditor.tab[1])then
				local artikel = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),1)
				local preis = tonumber(guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),3))
				if(artikel ~= "")then
					if(getElementData(localPlayer,"Bonuspunkte") >= preis)then
						if(string.find(artikel,"Waffenskills"))then
							if(tonumber(getElementData(localPlayer,artikel)) == 0)then
								setElementData(localPlayer,artikel,1)
								infobox(loc("Systeme_186"):format(artikel),"info")
								setElementData(localPlayer,"Bonuspunkte",getElementData(localPlayer,"Bonuspunkte")-preis)
								guiSetText(GUIEditor.label[1],loc("Systeme_187"):format(getElementData(localPlayer,"Bonuspunkte")))
								triggerServerEvent("givePlayerWeaponskills",localPlayer,localPlayer)
							else infobox(loc("Systeme_188"),"error")end
						else
							setElementData(localPlayer,artikel,getElementData(localPlayer,artikel)+menge)
							infobox(loc("Systeme_189"):format(artikel),"info")
							setElementData(localPlayer,"Bonuspunkte",getElementData(localPlayer,"Bonuspunkte")-preis)
						end
					else infobox(loc("Systeme_190"),"error")end
				end
			else
				local fahrzeug = guiGridListGetItemText(GUIEditor.gridlist[2],guiGridListGetSelectedItem(GUIEditor.gridlist[2]),1)
				local preis = tonumber(guiGridListGetItemText(GUIEditor.gridlist[2],guiGridListGetSelectedItem(GUIEditor.gridlist[2]),2))
				if(fahrzeug ~= "")then
					if(getElementData(localPlayer,"Bonuspunkte") >= preis)then
						setElementData(localPlayer,"Bonuspunkte",getElementData(localPlayer,"Bonuspunkte")-preis)
						local x,y,z = getElementPosition(localPlayer)
						local rx,ry,rz = getElementRotation(localPlayer)
						triggerServerEvent("Autohaus.buy",localPlayer,localPlayer,getVehicleModelFromName(fahrzeug),0,x,y,z,rz,0,0,getPlayerName(localPlayer),getPlayerName(localPlayer))
						Eigenmenue.close()
					else infobox(loc("Systeme_191"),"error")end
				end
			end
		end,false)
    end,false)
end)

-- [[ GEWORBENE SPIELER LADEN ]] --

addEvent("Spielerverwaltung.setGeworbeneSpieler",true)
addEventHandler("Spielerverwaltung.setGeworbeneSpieler",root,function(tbl)
	for _,v in pairs(tbl)do
		local spielstunden = v[2]
		local hour = math.floor(spielstunden/60)
		local minute = spielstunden-hour*60
		local spielzeit = Scoreboard.formString(hour)..":"..Scoreboard.formString(minute)
			
		local row = guiGridListAddRow(GUIEditor.gridlist[1])
		guiGridListSetItemText(GUIEditor.gridlist[1],row,spielerGridlist,v[1],false,false)
		guiGridListSetItemText(GUIEditor.gridlist[1],row,spielstundenGridlist,spielzeit,false,false)
	end
end)