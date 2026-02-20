StatusRender = false

-- [[ DIE STATUSVERWALTUNG ]] --

addEvent("Status.openWindow",true)
addEventHandler("Status.openWindow",root,function(tbl)
	if(isWindowOpen())then
		if(fileExists("Files/Images/Status_reached.png"))then
			GUIEditor.window[1] = guiCreateWindow(415, 252, 556, 323, loc("Errungenschaften_49"), false)

			GUIEditor.gridlist[1] = guiCreateGridList(11, 27, 259, 286, false, GUIEditor.window[1])
			id = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Errungenschaften_50"), 0.2)
			status = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Errungenschaften_51"), 0.8)
			GUIEditor.label[1] = guiCreateLabel(280, 27, 266, 41, loc("Errungenschaften_52"), false, GUIEditor.window[1])
			GUIEditor.label[2] = guiCreateLabel(280, 78, 266, 17, "_______________________________________", false, GUIEditor.window[1])
			GUIEditor.label[3] = guiCreateLabel(280, 105, 266, 41, loc("Errungenschaften_53"), false, GUIEditor.window[1])
			GUIEditor.staticimage[1] = guiCreateStaticImage(360, 183, 107, 103, "Files/Images/Status_locked.png", false, GUIEditor.window[1])
			GUIEditor.label[4] = guiCreateLabel(280, 296, 266, 17, "_______________________________________", false, GUIEditor.window[1])
			GUIEditor.label[5] = guiCreateLabel(280, 156, 266, 17, "_______________________________________", false, GUIEditor.window[1])
			
			setWindowDatas(5)
			
			if(#tbl >= 1)then
				for i,v in pairs(tbl)do
					local row = guiGridListAddRow(GUIEditor.gridlist[1])
					guiGridListSetItemText(GUIEditor.gridlist[1],row,id,i,false,false)
					guiGridListSetItemText(GUIEditor.gridlist[1],row,status,v[1],false,false)
					guiGridListSetItemColor(GUIEditor.gridlist[1],row,status,Color[v[2]][1],Color[v[2]][2],Color[v[2]][3])
				end
			end
			
			addEventHandler("onClientGUIClick",GUIEditor.gridlist[1],function()
				local clicked = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),1)
				if(clicked ~= "")then
					triggerServerEvent("Status.getDatas",localPlayer,clicked)
					guiSetText(GUIEditor.label[3],Status["Status"][tonumber(clicked)][2])
				end
			end,false)
			
			addEventHandler("onClientGUIDoubleClick",GUIEditor.gridlist[1],function()
				local clicked = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),1)
				if(clicked ~= "")then
					triggerServerEvent("Status.doubleClick",localPlayer,clicked)
				end
			end,false)
		else infobox(loc("Errungenschaften_57"),"error")end
	end
end)

-- [[ DIE STATUS-DATAS SETZEN ]] --

addEvent("Status.setDatas",true)
addEventHandler("Status.setDatas",root,function(reached)
	if(reached == 0)then reached = {"locked",loc("Errungenschaften_54")} else reached = {"reached",loc("Errungenschaften_55")} end
	guiStaticImageLoadImage(GUIEditor.staticimage[1],"Files/Images/Status_"..reached[1]..".png")
	guiSetText(GUIEditor.label[1],reached[2])
end)

-- [[ ANZEIGE WENN STATUS FREIGESCHALTET ]] --

function Status.dxDraw()
	if(not(isPlayerMapVisible(localPlayer)))then
        dxDrawRectangle(0*(x/1440), 396*(y/900), 1440*(x/1440), 108*(y/900), tocolor(0, 0, 0, 175), false)
        dxDrawText(loc("Errungenschaften_56").." "..Status.text, 0*(x/1440), 396*(y/900), 1440*(x/1440), 504*(y/900), tocolor(255, 255, 255, 255), 2.00, "default-bold", "center", "center", false, true, false, false, false)
	end
end

addEvent("Status.showInfo",true)
addEventHandler("Status.showInfo",root,function(id)
	StatusRender = true
	if(fileExists("Files/Sounds/Achievement.mp3"))then
		playSound("Files/Sounds/Achievement.mp3")
	end
	Status.text = Status["Status"][id][1]
	if(getElementData(localPlayer,"elementClicked") ~= true and fileExists("Files/Images/Status_reached.png"))then
		addEventHandler("onClientRender",root,Status.dxDraw)
		setTimer(function()
			StatusRender = false
			removeEventHandler("onClientRender",root,Status.dxDraw)
		end,10000,1)
	else
		outputChatBox("#fa6400[INFO] #FFFFFF"..loc("Errungenschaften_56")..": #fa6400"..Status.text,255,255,255,true)
	end
end)