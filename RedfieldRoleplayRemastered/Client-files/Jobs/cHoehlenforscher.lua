-- [[ JOB STARTEN (LEVEL 1) ]] --

addEvent("Hoehlenforscher.level1",true)
addEventHandler("Hoehlenforscher.level1",root,function()
	infobox(loc("Jobs_2"),"info")
end)

-- [[ JOB STARTEN (LEVEL 2) ]] --

addEvent("Hoehlenforscher.level2",true)
addEventHandler("Hoehlenforscher.level2",root,function()
	if(isElement(Hoehlenforscher.schmiedBlip))then destroyElement(Hoehlenforscher.schmiedBlip)end
	if(isTimer(Hoehlenforscher.schmiedBlipTimer))then killTimer(Hoehlenforscher.schmiedBlipTimer)end
	infobox(loc("Jobs_3"),"info")
	Hoehlenforscher.schmiedBlip = createBlip(565.90032958984,1218.0773925781,11.718799591064,0,2,255,0,0)
	Hoehlenforscher.schmiedBlipTimer = setTimer(function()
		destroyElement(Hoehlenforscher.schmiedBlip)
	end,300000,1)
end)

-- [[ SCHMIED ]] --

addEvent("Hoehlenforscher.openSchmied",true)
addEventHandler("Hoehlenforscher.openSchmied",root,function(datas)
	if(isWindowOpen())then
        GUIEditor.window[1] = guiCreateWindow(409, 362, 415, 120, loc("Jobs_4"), false)

        GUIEditor.label[1] = guiCreateLabel(10, 29, 396, 43, loc("Jobs_5"), false, GUIEditor.window[1])
        GUIEditor.button[1] = guiCreateButton(10, 82, 396, 28, loc("Jobs_6"), false, GUIEditor.window[1])
		setWindowDatas(1)
		
		if(#datas >= 1)then
			if(tonumber(datas[1][1]) > 0 and tonumber(datas[1][2]) == 0)then
				guiSetText(GUIEditor.label[1],loc("Jobs_7"))
				guiSetText(GUIEditor.button[1],"-")
			elseif(tonumber(datas[1][1]) > 0 and tonumber(datas[1][2]) == 1)then
				guiSetText(GUIEditor.label[1],loc("Jobs_8"))
				guiSetText(GUIEditor.button[1],loc("Jobs_9"))
			end
		end
		
		addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
			triggerServerEvent("Hoehlenforscher.schmied",localPlayer,guiGetText(source))
		end,false)
    end
end)

-- [[ GOLDBARREN VERKAUFEN ]] --

addEvent("Hoehlenforscher.sellGoldbarren",true)
addEventHandler("Hoehlenforscher.sellGoldbarren",root,function()
	if(isWindowOpen())then
        GUIEditor.window[1] = guiCreateWindow(538, 294, 297, 150, loc("Jobs_10"), false)

        GUIEditor.label[1] = guiCreateLabel(10, 28, 277, 28, loc("Jobs_11"), false, GUIEditor.window[1])
        GUIEditor.label[2] = guiCreateLabel(10, 66, 118, 30, loc("Jobs_12"), false, GUIEditor.window[1])
        GUIEditor.button[1] = guiCreateButton(10, 106, 277, 34, loc("Jobs_13"), false, GUIEditor.window[1])
        GUIEditor.edit[1] = guiCreateEdit(138, 66, 149, 30, "", false, GUIEditor.window[1])
		setWindowDatas(2)
		triggerServerEvent("getGoldbarrenPreis",localPlayer)

		addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
			local menge = guiGetText(GUIEditor.edit[1])
			if(#menge >= 1 and isOnlyNumbers(menge))then
				triggerServerEvent("Hoehlenforscher.sellGoldbarren",localPlayer,menge)
			end
		end,false)
	end
end)

addEvent("setGoldbarrenPreis",true)
addEventHandler("setGoldbarrenPreis",root,function(GoldbarrenPreis)
	guiSetText(GUIEditor.label[1],loc("Jobs_14"):format(GoldbarrenPreis))
end)