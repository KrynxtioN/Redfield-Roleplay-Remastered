-- [[ STARTEN (LEVEL 1) ]] --

addEvent("Schrottplatzmitarbeiter.level1",true)
addEventHandler("Schrottplatzmitarbeiter.level1",root,function()
	triggerServerEvent("Schrottplatzmitarbeiter.level1",localPlayer)
end)

-- [[ ABGABEMARKER ERSTELLEN / LÖSCHEN ]] --

addEvent("Schrottplatzmitarbeiter.createMarker",true)
addEventHandler("Schrottplatzmitarbeiter.createMarker",root,function(type)
	if(isElement(Schrottplatzmitarbeiter.marker))then destroyElement(Schrottplatzmitarbeiter.marker)end
	if(isElement(Schrottplatzmitarbeiter.blip))then destroyElement(Schrottplatzmitarbeiter.blip)end
	if(isElement(Schrottplatzmitarbeiter.abgabe))then destroyElement(Schrottplatzmitarbeiter.abgabe)end
	
	if(type)then
		Schrottplatzmitarbeiter.marker = createMarker(2147,-1973,11.699999809265,"cylinder",5,0,0,200,100)
		Schrottplatzmitarbeiter.blip = createBlip(-1818.5,-1628.8000488281,21.700000762939,0,2,0,255,0)
		Schrottplatzmitarbeiter.abgabe = createMarker(-1818.5,-1628.8000488281,21.700000762939,"cylinder",5,0,0,200,100)
		
		addEventHandler("onClientMarkerHit",Schrottplatzmitarbeiter.marker,function(player)
			if(player == localPlayer)then
				if(isWindowOpen())then
					GUIEditor.window[1] = guiCreateWindow(453, 349, 379, 333, loc("Jobs_30"), false)

					GUIEditor.gridlist[1] = guiCreateGridList(10, 86, 359, 201, false, GUIEditor.window[1])
					fahrzeug = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Jobs_31"), 0.5)
					preis = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Jobs_32"), 0.5)
					GUIEditor.button[1] = guiCreateButton(10, 297, 359, 26, loc("Jobs_33"), false, GUIEditor.window[1])
					GUIEditor.label[1] = guiCreateLabel(10, 26, 359, 50, loc("Jobs_34"), false, GUIEditor.window[1])
					setWindowDatas(1)
					
					for _,v in pairs(Schrottplatzmitarbeiter["Client"])do
						local row = guiGridListAddRow(GUIEditor.gridlist[1])
						guiGridListSetItemText(GUIEditor.gridlist[1],row,fahrzeug,v[1],false,false)
						guiGridListSetItemText(GUIEditor.gridlist[1],row,preis,v[2],false,false)
					end
					
					addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
						local vehicle = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),1)
						if(vehicle ~= "")then
							triggerServerEvent("Schrottplatzmitarbeiter.vehicle",localPlayer,vehicle)
						end
					end,false)
				end
			end
		end)
		
		addEventHandler("onClientMarkerHit",Schrottplatzmitarbeiter.abgabe,function(player)
			if(player == localPlayer)then
				triggerServerEvent("Schrottplatzmitarbeiter.abgabe",localPlayer)
			end
		end)
	end
end)