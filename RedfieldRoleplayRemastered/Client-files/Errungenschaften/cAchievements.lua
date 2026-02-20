AchievementRender = false

-- [[ DIE ACHIEVEMENTSVERWALTUNG ]] --

addEvent("Achievements.openWindow",true)
addEventHandler("Achievements.openWindow",root,function(tbl)
	if(isWindowOpen())then
		if(fileExists("Files/Images/Achievement_reached.png"))then
			GUIEditor.window[1] = guiCreateWindow(415, 252, 556, 323, loc("Errungenschaften_20"), false)

			GUIEditor.gridlist[1] = guiCreateGridList(11, 27, 259, 286, false, GUIEditor.window[1])
			id = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Errungenschaften_21"), 0.2)
			achievement = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Errungenschaften_22"), 0.8)
			GUIEditor.label[1] = guiCreateLabel(280, 27, 266, 41, loc("Errungenschaften_23"), false, GUIEditor.window[1])
			GUIEditor.label[2] = guiCreateLabel(280, 78, 266, 17, "_______________________________________", false, GUIEditor.window[1])
			GUIEditor.label[3] = guiCreateLabel(280, 105, 266, 41, loc("Errungenschaften_24"), false, GUIEditor.window[1])
			GUIEditor.staticimage[1] = guiCreateStaticImage(360, 183, 107, 103, "Files/Images/Achievement_locked.png", false, GUIEditor.window[1])
			GUIEditor.label[4] = guiCreateLabel(280, 296, 266, 17, "_______________________________________", false, GUIEditor.window[1])
			GUIEditor.label[5] = guiCreateLabel(280, 156, 266, 17, "_______________________________________", false, GUIEditor.window[1])
			
			setWindowDatas(5)
			
			if(#tbl >= 1)then
				for i,v in pairs(tbl)do
					local row = guiGridListAddRow(GUIEditor.gridlist[1])
					guiGridListSetItemText(GUIEditor.gridlist[1],row,id,i,false,false)
					guiGridListSetItemText(GUIEditor.gridlist[1],row,achievement,v[1],false,false)
					guiGridListSetItemColor(GUIEditor.gridlist[1],row,achievement,Color[v[2]][1],Color[v[2]][2],Color[v[2]][3])
				end
			end
			
			addEventHandler("onClientGUIClick",GUIEditor.gridlist[1],function()
				local clicked = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),1)
				if(clicked ~= "")then
					triggerServerEvent("Achievements.getDatas",localPlayer,clicked)
					guiSetText(GUIEditor.label[3],Achievements["Achievements"][tonumber(clicked)][2])
				end
			end,false)
		else infobox(loc("Errungenschaften_28"),"error")end
	end
end)

-- [[ DIE ACHIEVEMENT-DATAS SETZEN ]] --

addEvent("Achievements.setDatas",true)
addEventHandler("Achievements.setDatas",root,function(reached)
	if(reached == 0)then reached = {"locked",loc("Errungenschaften_25")} else reached = {"reached",loc("Errungenschaften_26")} end
	guiStaticImageLoadImage(GUIEditor.staticimage[1],"Files/Images/Achievement_"..reached[1]..".png")
	guiSetText(GUIEditor.label[1],reached[2])
end)

-- [[ ANZEIGE WENN ACHIEVEMENT ERREICHT ]] --

function Achievements.dxDraw()
	if(not(isPlayerMapVisible(localPlayer)))then
        dxDrawRectangle(0*(x/1440), 396*(y/900), 1440*(x/1440), 108*(y/900), tocolor(0, 0, 0, 175), false)
        dxDrawText(loc("Errungenschaften_27").." "..Achievements.text, 0*(x/1440), 396*(y/900), 1440*(x/1440), 504*(y/900), tocolor(255, 255, 255, 255), 2.00*(x/1440), "default-bold", "center", "center", false, true, false, false, false)
	end
end

addEvent("Achievements.showInfo",true)
addEventHandler("Achievements.showInfo",root,function(id)
	AchievementRender = true
	if(getElementData(localPlayer,"ImIntro") ~= true)then
		if(fileExists("Files/Sounds/Achievement.mp3"))then
			playSound("Files/Sounds/Achievement.mp3")
		end
	end
	Achievements.text = Achievements["Achievements"][id][1]
	if(getElementData(localPlayer,"elementClicked") ~= true and fileExists("Files/Images/Achievement_reached.png"))then
		addEventHandler("onClientRender",root,Achievements.dxDraw)
		setTimer(function()
			AchievementRender = false
			removeEventHandler("onClientRender",root,Achievements.dxDraw)
		end,10000,1)
	else
		outputChatBox("#fa6400[INFO] #FFFFFF"..loc("Errungenschaften_27")..": #fa6400"..Achievements.text,255,255,255,true)
	end
end)