-- [[ DAS FENSTER ]] --

addEvent("Fightstyles.openWindow",true)
addEventHandler("Fightstyles.openWindow",root,function()
	if(isWindowOpen())then
        GUIEditor.window[1] = guiCreateWindow(522, 355, 341, 272, loc("CJ_1"), false)

        GUIEditor.label[1] = guiCreateLabel(10, 26, 321, 46, loc("CJ_2"), false, GUIEditor.window[1])
        GUIEditor.gridlist[1] = guiCreateGridList(10, 82, 321, 141, false, GUIEditor.window[1])
        style = guiGridListAddColumn(GUIEditor.gridlist[1], loc("CJ_3"), 0.9)
        GUIEditor.button[1] = guiCreateButton(10, 235, 321, 27, loc("CJ_4"), false, GUIEditor.window[1])
		setWindowDatas(1)
		
		for _,v in pairs(Fightstyles["Names"])do
			local row = guiGridListAddRow(GUIEditor.gridlist[1])
			guiGridListSetItemText(GUIEditor.gridlist[1],row,style,v,false,false)
		end
		
		addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
			local clicked = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),1)
			if(clicked ~= "")then
				triggerServerEvent("Fightstyles.startFight",localPlayer,clicked)
			end
		end,false)
	end
end)

-- [[ BOXER PED ERSTELLEN ]] --

addEvent("Fightstyles.startFight",true)
addEventHandler("Fightstyles.startFight",root,function()
	local dim = getElementDimension(localPlayer)
	Boxer.ped = createPed(81,763.25842285156,2.7256000041962,1001.5941772461,134)
	setElementInterior(Boxer.ped,getElementInterior(localPlayer))
	setElementDimension(Boxer.ped,dim)
	Boxer.walk = false
	setElementData(localPlayer,"Boxfight",true)
	addEventHandler("onClientPreRender",root,Boxer.preRender)
	addEventHandler("onClientPedWasted",Boxer.ped,function()
		Boxer.stopFight("gewonnen","fighting")
	end)
end)