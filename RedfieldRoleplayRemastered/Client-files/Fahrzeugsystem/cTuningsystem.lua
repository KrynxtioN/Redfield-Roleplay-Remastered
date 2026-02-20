-- [[ DAS FENSTER ]] --

addEvent("Tuningsystem.openWindow",true)
addEventHandler("Tuningsystem.openWindow",root,function()
	if(isWindowOpen())then
		Tuningsystem.kameraPos = 1
        GUIEditor.window[1] = guiCreateWindow(10, 262, 555, 417, loc("Fahrzeugsystem_42"), false)

        GUIEditor.gridlist[1] = guiCreateGridList(10, 28, 178, 338, false, GUIEditor.window[1])
        kategorie = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Fahrzeugsystem_43"), 0.9)
        GUIEditor.gridlist[2] = guiCreateGridList(198, 28, 347, 338, false, GUIEditor.window[1])
        id = guiGridListAddColumn(GUIEditor.gridlist[2], loc("Fahrzeugsystem_44"), 0.3)
        tuningteil = guiGridListAddColumn(GUIEditor.gridlist[2], loc("Fahrzeugsystem_45"), 0.4)
        preis = guiGridListAddColumn(GUIEditor.gridlist[2], loc("Fahrzeugsystem_46"), 0.3)
        GUIEditor.button[1] = guiCreateButton(10, 376, 178, 31, loc("Fahrzeugsystem_47"), false, GUIEditor.window[1])
        GUIEditor.button[2] = guiCreateButton(198, 376, 347, 31, loc("Fahrzeugsystem_48"), false, GUIEditor.window[1])
		setWindowDatas(_,"no",_,"no")
		bindKey("arrow_r","down",Tuningsystem.bindKeyRight)
		bindKey("arrow_l","down",Tuningsystem.bindKeyLeft)
		Tuningsystem.setCamera()
		infobox(loc("Fahrzeugsystem_49"),"info")
		
		for _,v in pairs(Tuningsystem["Categorys"])do
			local row = guiGridListAddRow(GUIEditor.gridlist[1])
			guiGridListSetItemText(GUIEditor.gridlist[1],row,kategorie,v,false,false)
		end
		
		addEventHandler("onClientGUIClick",GUIEditor.gridlist[1],function()
			local clicked = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),1)
			if(clicked ~= "")then
				if(clicked == "Farbe")then
					colorPicker.create()
				else
					guiGridListClear(GUIEditor.gridlist[2])
					local model = getElementModel(getPedOccupiedVehicle(localPlayer))
					for _,v in pairs(Tuningsystem["Tuningteile"][clicked])do
						if(isTuningteilAvailable(model,v))then
							local row = guiGridListAddRow(GUIEditor.gridlist[2])
							guiGridListSetItemText(GUIEditor.gridlist[2],row,id,v,false,false)
							guiGridListSetItemText(GUIEditor.gridlist[2],row,tuningteil,Tuningsystem["Tuningnames"][v],false,false)
							guiGridListSetItemText(GUIEditor.gridlist[2],row,preis,Tuningsystem["Tuningpreise"][v],false,false)
						end
					end
				end
			end
		end,false)
		
		addEventHandler("onClientGUIClick",GUIEditor.gridlist[2],function()
			local clicked = guiGridListGetItemText(GUIEditor.gridlist[2],guiGridListGetSelectedItem(GUIEditor.gridlist[2]),1)
			if(clicked ~= "")then
				triggerServerEvent("Tuningsystem.loadTunings",localPlayer,getPedOccupiedVehicle(localPlayer))
				triggerServerEvent("Tuningsystem.addRemoveTuning",localPlayer,"show",_,clicked)
			end
		end,false)
		
		addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
			local clicked = guiGridListGetItemText(GUIEditor.gridlist[2],guiGridListGetSelectedItem(GUIEditor.gridlist[2]),1)
			local preis = guiGridListGetItemText(GUIEditor.gridlist[2],guiGridListGetSelectedItem(GUIEditor.gridlist[2]),3)
			if(clicked ~= "")then
				triggerServerEvent("Tuningsystem.addRemoveTuning",localPlayer,"add",preis,clicked)
			else infobox(loc("Fahrzeugsystem_50"),"error")end
		end,false)
		
		addEventHandler("onClientGUIClick",GUIEditor.button[2],function()
			local clicked = guiGridListGetItemText(GUIEditor.gridlist[2],guiGridListGetSelectedItem(GUIEditor.gridlist[2]),1)
			if(clicked ~= "")then
				triggerServerEvent("Tuningsystem.addRemoveTuning",localPlayer,"remove",_,clicked)
			else infobox(loc("Fahrzeugsystem_51"),"error")end
		end,false)
    end
end)

-- [[ IST TUNINGTEIL VERFÜGBAR? ]] --

function isTuningteilAvailable(model,id)
	local state = false
	for _,v in pairs(Tuningsystem["AvailableTunings"][model])do
		if(v == tonumber(id))then
			state = true
			break
		end
	end
	return state
end

-- [[ KAMERAPERSPEKTIVE WECHSELN ]] --

function Tuningsystem.setCamera()
	local tbl = Tuningsystem["Kamera"][Tuningsystem.kameraPos]
	setCameraMatrix(tbl[1],tbl[2],tbl[3],tbl[4],tbl[5],tbl[6])
end

function Tuningsystem.bindKeyRight()
	if(Tuningsystem.kameraPos < #Tuningsystem["Kamera"])then
		Tuningsystem.kameraPos = Tuningsystem.kameraPos + 1
		Tuningsystem.setCamera()
	end
end

function Tuningsystem.bindKeyLeft()
	if(Tuningsystem.kameraPos > 1)then
		Tuningsystem.kameraPos = Tuningsystem.kameraPos - 1
		Tuningsystem.setCamera()
	end
end
