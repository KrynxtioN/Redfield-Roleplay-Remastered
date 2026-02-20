-- [[ ANGELANZEIGE ]] --

addEvent("Angelsystem.dxDraw",true)
addEventHandler("Angelsystem.dxDraw",root,function(type)
	removeEventHandler("onClientRender",root,Angelsystem.dxDraw)
	if(type)then
		Angelsystem.points = 15
		bindKey("space","down",Angelsystem.space)
		Angelsystem.pointsTimer = setTimer(function()
			Angelsystem.points = Angelsystem.points - 1
			if(Angelsystem.points == 0)then
				killTimer(Angelsystem.pointsTimer)
				unbindKey("space","down",Angelsystem.space)
				removeEventHandler("onClientRender",root,Angelsystem.dxDraw)
			end
		end,250,0)
		addEventHandler("onClientRender",root,Angelsystem.dxDraw)
	end
end)

function Angelsystem.space()
	Angelsystem.points = Angelsystem.points + 2
	if(Angelsystem.points == 100)then
		killTimer(Angelsystem.pointsTimer)
		unbindKey("space","down",Angelsystem.space)
		removeEventHandler("onClientRender",root,Angelsystem.dxDraw)
		triggerServerEvent("Angelsystem.fischen",localPlayer)
	end
end

function Angelsystem.dxDraw()
	if(isWindowOpen())then
		local x,y,z = getElementPosition(localPlayer)
		local sx,sy = getScreenFromWorldPosition(x,y,z,1000,true)
		dxDrawRectangle(sx - 70,sy-155,137,16,tocolor(0,0,0,255),false)
		dxDrawRectangle(sx - 70,sy-155,(1.37*Angelsystem.points),16,tocolor(0,255,0,255),false)
	end
end

-- [[ DAS FENSTER VOM ANGELLADEN ]] --

addEvent("Angelsystem.openWindow",true)
addEventHandler("Angelsystem.openWindow",root,function()
	if(isWindowOpen())then
        GUIEditor.window[1] = guiCreateWindow(510, 214, 360, 331, loc("Nebenjobs_1"), false)

        GUIEditor.gridlist[1] = guiCreateGridList(9, 27, 341, 147, false, GUIEditor.window[1])
        artikel = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Nebenjobs_2"), 0.4)
        preis = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Nebenjobs_3"), 0.3)
        lagerbestand = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Nebenjobs_4"), 0.3)
        GUIEditor.label[1] = guiCreateLabel(10, 184, 340, 27, "", false, GUIEditor.window[1])
        GUIEditor.label[2] = guiCreateLabel(10, 221, 154, 27, loc("Nebenjobs_5"), false, GUIEditor.window[1])
        GUIEditor.button[1] = guiCreateButton(9, 258, 341, 27, loc("Nebenjobs_6"), false, GUIEditor.window[1])
        GUIEditor.button[2] = guiCreateButton(9, 294, 341, 27, loc("Nebenjobs_7"), false, GUIEditor.window[1])
        GUIEditor.edit[1] = guiCreateEdit(174, 220, 176, 28, "", false, GUIEditor.window[1])
		setWindowDatas(2)
		triggerServerEvent("Angelsystem.getDatas",localPlayer,localPlayer)
		
		addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
			local clicked = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),1)
			if(clicked ~= "")then
				triggerServerEvent("Angelsystem.buy",localPlayer,clicked)
			end
		end,false)
		
		addEventHandler("onClientGUIClick",GUIEditor.button[2],function()
			local menge = guiGetText(GUIEditor.edit[1])
			if(#menge >= 1 and isOnlyNumbers(menge))then
				triggerServerEvent("Angelsystem.sellFisch",localPlayer,menge)
			else infobox(loc("Nebenjobs_8"),"error")end
		end,false)
	end
end)

addEvent("Angelsystem.setDatas",true)
addEventHandler("Angelsystem.setDatas",root,function(datas,fischpreis)
	guiGridListClear(GUIEditor.gridlist[1])
	guiSetText(GUIEditor.label[1],loc("Nebenjobs_9"):format(fischpreis))
	if(#datas >= 1)then
		for i,v in pairs(datas)do
			local row = guiGridListAddRow(GUIEditor.gridlist[1])
			guiGridListSetItemText(GUIEditor.gridlist[1],row,artikel,v[1],false,false)
			guiGridListSetItemText(GUIEditor.gridlist[1],row,preis,"$"..v[3],false,false)
			guiGridListSetItemText(GUIEditor.gridlist[1],row,lagerbestand,v[2],false,false)
		end
	end
end)	