-- [[ DAS FENSTER ]] --

bindKey("num_add","down",function()
	local fac = getElementData(localPlayer,"Fraktion")
	if(fac == 1 or fac == 2 or fac == 3)then
		if(isPedInVehicle(localPlayer))then
			local veh = getPedOccupiedVehicle(localPlayer)
			if(getElementData(veh,"Fraktion") == 1 or getElementData(veh,"Fraktion") == 2 or getElementData(veh,"Fraktion") == 3)then
				if(isWindowOpen())then
					GUIEditor.window[1] = guiCreateWindow(349, 191, 563, 395, loc("Fraktionen_31"), false)

					GUIEditor.gridlist[1] = guiCreateGridList(10, 26, 214, 359, false, GUIEditor.window[1])
					spieler = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Fraktionen_32"), 0.4)
					wanteds = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Fraktionen_33"), 0.3)
					stvo = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Fraktionen_34"), 0.3)
					GUIEditor.tabpanel[1] = guiCreateTabPanel(234, 26, 319, 287, false, GUIEditor.window[1])

					GUIEditor.tab[1] = guiCreateTab(loc("Fraktionen_35"), GUIEditor.tabpanel[1])

					GUIEditor.gridlist[2] = guiCreateGridList(10, 10, 299, 243, false, GUIEditor.tab[1])
					grundWanteds = guiGridListAddColumn(GUIEditor.gridlist[2], loc("Fraktionen_36"), 0.7)
					anzahlWanteds = guiGridListAddColumn(GUIEditor.gridlist[2], loc("Fraktionen_37"), 0.3)

					GUIEditor.tab[2] = guiCreateTab(loc("Fraktionen_38"), GUIEditor.tabpanel[1])
					
					GUIEditor.gridlist[3] = guiCreateGridList(10, 10, 299, 243, false, GUIEditor.tab[2])
					grundStVo = guiGridListAddColumn(GUIEditor.gridlist[3], loc("Fraktionen_39"), 0.7)
					anzahlStVo = guiGridListAddColumn(GUIEditor.gridlist[3], loc("Fraktionen_40"), 0.3)

					GUIEditor.button[1] = guiCreateButton(234, 323, 154, 26, loc("Fraktionen_41"), false, GUIEditor.window[1])
					GUIEditor.button[2] = guiCreateButton(399, 323, 154, 26, loc("Fraktionen_42"), false, GUIEditor.window[1])
					GUIEditor.button[3] = guiCreateButton(234, 359, 154, 26, loc("Fraktionen_43"), false, GUIEditor.window[1])
					GUIEditor.button[4] = guiCreateButton(399, 359, 154, 26, "/", false, GUIEditor.window[1])  
					setWindowDatas()
					loadWantedcomputerPlayer()
					
					for i,v in pairs(Computer["Wanteds"])do
						local row = guiGridListAddRow(GUIEditor.gridlist[2])
						guiGridListSetItemText(GUIEditor.gridlist[2],row,grundWanteds,v[1],false,false)
						guiGridListSetItemText(GUIEditor.gridlist[2],row,anzahlWanteds,v[2],false,false)
					end
					
					for i,v in pairs(Computer["StVo"])do
						local row = guiGridListAddRow(GUIEditor.gridlist[3])
						guiGridListSetItemText(GUIEditor.gridlist[3],row,grundStVo,v[1],false,false)
						guiGridListSetItemText(GUIEditor.gridlist[3],row,anzahlStVo,v[2],false,false)
					end

					addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
						local type = guiGetText(guiGetSelectedTab(GUIEditor.tabpanel[1]))
						if(type == "Wanteds")then id = 2 else id = 3 end
						local clicked = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),1)
						local grund = guiGridListGetItemText(GUIEditor.gridlist[id],guiGridListGetSelectedItem(GUIEditor.gridlist[id]),1)
						local menge = guiGridListGetItemText(GUIEditor.gridlist[id],guiGridListGetSelectedItem(GUIEditor.gridlist[id]),2)
						if(clicked ~= "" and grund ~= "")then
							triggerServerEvent("Computer.give",localPlayer,clicked,type,grund,menge)
						end
					end,false)
					
					addEventHandler("onClientGUIClick",GUIEditor.button[2],function()
						local type = guiGetText(guiGetSelectedTab(GUIEditor.tabpanel[1]))
						local clicked = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),1)
						if(clicked ~= "")then
							triggerServerEvent("Computer.deleteWanteds",localPlayer,clicked,type)
						end
					end,false)
					
					addEventHandler("onClientGUIClick",GUIEditor.button[3],function()
						local clicked = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),1)
						if(clicked ~= "")then
							triggerServerEvent("Computer.orten",localPlayer,clicked)
						end
					end,false)
				end
			end
		end
	end
end)

function loadWantedcomputerPlayer()
	guiGridListClear(GUIEditor.gridlist[1])
	for i,v in pairs(getElementsByType("player"))do
		local row = guiGridListAddRow(GUIEditor.gridlist[1])
		guiGridListSetItemText(GUIEditor.gridlist[1],row,spieler,getPlayerName(v),false,false)
		guiGridListSetItemText(GUIEditor.gridlist[1],row,wanteds,getElementData(v,"Wanteds"),false,false)
		guiGridListSetItemText(GUIEditor.gridlist[1],row,stvo,getElementData(v,"StVo"),false,false)
	end
end
addEvent("loadWantedcomputerPlayer",true)
addEventHandler("loadWantedcomputerPlayer",root,loadWantedcomputerPlayer)

--//Orten
addEvent("Computer.ortenBlip",true)
addEventHandler("Computer.ortenBlip",root,function(target)
	if(isElement(Computer.ortenBlip))then destroyElement(Computer.ortenBlip)end
	if(isTimer(Computer.ortenTimer))then killTimer(Computer.ortenTimer)end
	Computer.ortenBlip = createBlipAttachedTo(target,0,2,255,0,200)
	Computer.ortenTimer = setTimer(function()
		destroyElement(Computer.ortenBlip)
	end,20000,1)
	infobox(loc("Fraktionen_44"),"info")
end)