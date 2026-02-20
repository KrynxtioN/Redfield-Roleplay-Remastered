-- [[ TAZER ]] --

addEventHandler("onClientPlayerDamage",root,function(attacker,weapon)
	if(attacker == localPlayer)then
		if(weapon == 23)then
			if(getElementData(attacker,"FDuty") == true)then
				triggerServerEvent("TazerPlayer",localPlayer,source)
				cancelEvent()
			end
		end
	end
end)

-- [[ DAS FENSTER ZUM STELLEN ]] --

addEvent("Polizei.stellen",true)
addEventHandler("Polizei.stellen",root,function()
	if(isWindowOpen())then
		if(getElementData(localPlayer,"Wanteds") >= 1)then
			GUIEditor.window[1] = guiCreateWindow(461, 236, 361, 121, loc("Fraktionen_45"), false)
			GUIEditor.label[1] = guiCreateLabel(10, 28, 341, 48, loc("Fraktionen_46"):format(getElementData(localPlayer,"Wanteds"),getElementData(localPlayer,"Wanteds")*2), false, GUIEditor.window[1])
			GUIEditor.button[1] = guiCreateButton(109, 86, 142, 25, loc("Fraktionen_47"), false, GUIEditor.window[1])
			setWindowDatas(1)
			
			addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
				triggerServerEvent("Polizei.stellen",localPlayer)
			end,false)
		end
	end
end)

-- [[ DAS FENSTER ZUM ZAHLEN VON KAUTIONEN ]] --

addEvent("Polizei.kaution",true)
addEventHandler("Polizei.kaution",root,function()
	if(isWindowOpen())then
        GUIEditor.window[1] = guiCreateWindow(461, 236, 359, 345, loc("Fraktionen_48"), false)
		
        GUIEditor.label[1] = guiCreateLabel(10, 28, 339, 48, loc("Fraktionen_49"), false, GUIEditor.window[1])
        GUIEditor.button[1] = guiCreateButton(108, 310, 142, 25, loc("Fraktionen_50"), false, GUIEditor.window[1])
        GUIEditor.gridlist[1] = guiCreateGridList(10, 86, 339, 214, false, GUIEditor.window[1])
        player = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Fraktionen_51"), 0.5)
        jailtime = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Fraktionen_52"), 0.5)   
		
		setWindowDatas(1)
		
		for _,v in pairs(getElementsByType("player"))do
			if(getElementData(v,"Jailtime") >= 1)then
				local row = guiGridListAddRow(GUIEditor.gridlist[1])
				guiGridListSetItemText(GUIEditor.gridlist[1],row,player,getPlayerName(v),false,false)
				guiGridListSetItemText(GUIEditor.gridlist[1],row,jailtime,getElementData(v,"Jailtime").." Min.",false,false)
			end
		end
		
		addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
			local clicked = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),1)
			if(clicked ~= "")then
				triggerServerEvent("Polizei.kaution",localPlayer,clicked)
			end
		end,false)
    end
end)

-- [[ ANZEIGE DER KNASTZEIT ]] --

function Staatsfraktionen.dxDraw()
	if(isWindowOpen())then
		if(not(isPlayerMapVisible(localPlayer)))then
			dxDrawRectangle(1116*(x/1440), 307*(y/900), 314*(x/1440), 62*(y/900), tocolor(17, 17, 17, 200), false)
			dxDrawText(loc("Fraktionen_53"):format(getElementData(localPlayer,"Jailtime")), 1182*(x/1440), 317*(y/900), 1420*(x/1440), 359*(y/900), tocolor(255, 255, 255, 255), 1.00*(x/1440), "default-bold", "center", "center", false, true, false, false, false)
			dxDrawImage(1126*(x/1440), 317*(y/900), 46*(x/1440), 42*(y/900), "Files/Images/HUD/Info.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
		end
	end
end

-- [[ KNASTZEITANZEIGE EIN- UND AUSBLENDEN ]] --

addEvent("Staatsfraktionen.dxDraw",true)
addEventHandler("Staatsfraktionen.dxDraw",root,function(type)
	removeEventHandler("onClientRender",root,Staatsfraktionen.dxDraw)
	if(type)then
		addEventHandler("onClientRender",root,Staatsfraktionen.dxDraw)
	end
end)