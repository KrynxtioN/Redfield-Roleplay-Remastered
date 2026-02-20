-- [[ DAS FENSTER ]] --

bindKey("r","down",function()
	if(isWindowOpen())then
		if(getPedWeapon(localPlayer) == 0)then
			if(getElementData(localPlayer,"Premium") == 1)then
			    GUIEditor.window[1] = guiCreateWindow(467, 206, 371, 303, loc("Systeme_1"), false)

				GUIEditor.gridlist[1] = guiCreateGridList(10, 27, 351, 177, false, GUIEditor.window[1])
				stream = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Systeme_2"), 0.9)
				GUIEditor.edit[1] = guiCreateEdit(160, 214, 201, 35, "", false, GUIEditor.window[1])
				GUIEditor.label[1] = guiCreateLabel(10, 214, 140, 35, loc("Systeme_3"), false, GUIEditor.window[1])
				GUIEditor.button[1] = guiCreateButton(10, 260, 170, 33, loc("Systeme_4"), false, GUIEditor.window[1])
				GUIEditor.button[2] = guiCreateButton(190, 260, 170, 33, loc("Systeme_5"), false, GUIEditor.window[1])
				setWindowDatas(1)
				
				for _,v in pairs(Ghettoblaster["StreamNames"])do
					local row = guiGridListAddRow(GUIEditor.gridlist[1])
					guiGridListSetItemText(GUIEditor.gridlist[1],row,stream,v,false,false)
				end
				
				addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
					local url = guiGetText(GUIEditor.edit[1])
					local clicked = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),1)
					if(#url >= 1)then
						triggerServerEvent("newPlaySound",localPlayer,url)
					else
						if(clicked ~= "")then
							triggerServerEvent("newPlaySound",localPlayer,Ghettoblaster["StreamLinks"][clicked])
						else infobox(loc("Systeme_6"),"error")end
					end
				end,false)
				
				addEventHandler("onClientGUIClick",GUIEditor.button[2],function()
					triggerServerEvent("deleteBlaster",localPlayer,localPlayer)
				end,false)
			end
		end
	end
end)

-- [[ MUSIK STOPPEN ]] --

addEvent("deleteMusic",true)
addEventHandler("deleteMusic",root,function(player)
	if(isElement(Ghettoblaster[player]))then
		destroyElement(Ghettoblaster[player])
	end
end)

-- [[ MUSIK STARTEN ]] --

addEvent("createNewMusik",true)
addEventHandler("createNewMusik",root,function(player,link)
	local x,y,z = getElementPosition(player)
	if(isElement(Ghettoblaster[player]))then
		destroyElement(Ghettoblaster[player])
	end
	Ghettoblaster[player] = playSound3D(link,x,y,z)
	attachElements(Ghettoblaster[player],player)
end)