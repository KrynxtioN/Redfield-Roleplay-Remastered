-- [[ DAS FENSTER ]] --

addEvent("Jobcenter.openWindow",true)
addEventHandler("Jobcenter.openWindow",root,function()
	if(isWindowOpen())then
        GUIEditor.window[1] = guiCreateWindow(203, 188, 535, 305, loc("Jobs_15"), false)

        GUIEditor.gridlist[1] = guiCreateGridList(10, 26, 239, 269, false, GUIEditor.window[1])
        job = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Jobs_16"), 0.7)
        level = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Jobs_17"), 0.3)
        GUIEditor.label[1] = guiCreateLabel(259, 26, 266, 230, loc("Jobs_18"), false, GUIEditor.window[1])
        GUIEditor.button[1] = guiCreateButton(259, 266, 266, 29, loc("Jobs_19"), false, GUIEditor.window[1])
		setWindowDatas(1)
		
		for i,v in pairs(Jobcenter["Jobs"])do
			local row = guiGridListAddRow(GUIEditor.gridlist[1])
			guiGridListSetItemText(GUIEditor.gridlist[1],row,job,v[1],false,false)
			guiGridListSetItemText(GUIEditor.gridlist[1],row,level,v[2],false,false)
		end
		
		addEventHandler("onClientGUIClick",GUIEditor.gridlist[1],function()
			local clicked = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),1)
			if(clicked ~= "")then
				guiSetText(GUIEditor.label[1],Jobcenter["Texte"][clicked])
			end
		end,false)
		
		addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
			local job = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),1)
			local level = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),2)
			if(job ~= "")then
				if(getElementData(localPlayer,"Personalausweis") == 1 and getElementData(localPlayer,"Arbeitsgenehmigung") == 1)then
					if(getElementData(localPlayer,"Level") >= tonumber(level))then
						setElementData(localPlayer,"Job",job)
						infobox(loc("Jobs_20"):format(job),"info")
						if(isTimer(Jobcenter.blipTimer))then killTimer(Jobcenter.blipTimer)end
						if(isElement(Jobcenter.blip))then destroyElement(Jobcenter.blip)end
						Jobcenter.blip = createBlip(Jobcenter["JobPositions"][job][1],Jobcenter["JobPositions"][job][2],Jobcenter["JobPositions"][job][3],41)
						Jobcenter.blipTimer = setTimer(function()
							destroyElement(Jobcenter.blip)
						end,300000,1)
					else infobox(loc("Jobs_21"),"error")end
				else infobox(loc("Jobs_22"),"error")end
			end
		end,false)
    end
end)