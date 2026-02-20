-- [[ DAS FENSTER LADEN ]] --

addEvent("Eigenmenue.Fahrzeuge",true)
addEventHandler("Eigenmenue.Fahrzeuge",root,function()
	Vehicles.fahrzeugverwaltung()
end)

-- [[ DAS FENSTER ]] --

function Vehicles.fahrzeugverwaltung()
    GUIEditor.window[1] = guiCreateWindow(453, 165, 541, 313, loc("Fahrzeugsystem_1"), false, "nocross")

    GUIEditor.gridlist[1] = guiCreateGridList(10, 26, 521, 165, false, GUIEditor.window[1])
    id = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Fahrzeugsystem_2"), 0.2)
    fahrzeug = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Fahrzeugsystem_3"), 0.3)
	benzin = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Fahrzeugsystem_4"), 0.3)
    explos = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Fahrzeugsystem_5"), 0.3)
    GUIEditor.button[1] = guiCreateButton(10, 201, 167, 27, loc("Fahrzeugsystem_6"), false, GUIEditor.window[1])
    GUIEditor.button[2] = guiCreateButton(187, 201, 167, 27, loc("Fahrzeugsystem_7"), false, GUIEditor.window[1])
    GUIEditor.button[3] = guiCreateButton(364, 201, 167, 27, loc("Fahrzeugsystem_8"), false, GUIEditor.window[1])
    GUIEditor.label[1] = guiCreateLabel(10, 238, 167, 27, loc("Fahrzeugsystem_9"), false, GUIEditor.window[1])
    GUIEditor.label[2] = guiCreateLabel(10, 275, 167, 27, loc("Fahrzeugsystem_10"), false, GUIEditor.window[1])
    GUIEditor.button[4] = guiCreateButton(364, 276, 167, 27, loc("Fahrzeugsystem_11"), false, GUIEditor.window[1])
	GUIEditor.button[5] = guiCreateButton(364, 238, 167, 27, loc("Fahrzeugsystem_12"), false, GUIEditor.window[1])
    GUIEditor.edit[1] = guiCreateEdit(187, 238, 167, 27, loc("Fahrzeugsystem_13"), false, GUIEditor.window[1])
	GUIEditor.edit[2] = guiCreateEdit(187, 275, 167, 27, "", false, GUIEditor.window[1])
	setWindowDatas(2,_,true)
	
	triggerServerEvent("Fahrzeugverwaltung.loadPlayerVehicles",localPlayer,localPlayer)
	
	for i = 1,3 do
		addEventHandler("onClientGUIClick",GUIEditor.button[i],function()
			local clicked = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),1)
			if(clicked ~= "")then
				triggerServerEvent("Fahrzeugverwaltung.server",localPlayer,clicked,guiGetText(source))
			end
		end,false)
	end
	
	addEventHandler("onClientGUIClick",GUIEditor.button[4],function()
		local clicked = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),1)
		local player,preis = guiGetText(GUIEditor.edit[1]),guiGetText(GUIEditor.edit[2])
		if(clicked ~= "")then
			triggerServerEvent("Fahrzeugverwaltung.server",localPlayer,clicked,guiGetText(source),player,preis)
		end
	end,false)
	
	addEventHandler("onClientGUIClick",GUIEditor.button[5],function()
		local clicked = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),1)
		if(clicked ~= "")then
			Schluesselvergabe.openWindow()
			setElementData(localPlayer,"SchluesselvergabeID",clicked)
			triggerServerEvent("Schluesselvergabe.getDatas",localPlayer,localPlayer,clicked)
		end
	end,false)
end
addEvent("Fahrzeugverwaltung.client",true)
addEventHandler("Fahrzeugverwaltung.client",root,Vehicles.fahrzeugverwaltung)

-- [[ EIN FAHRZEUG ORTEN ]] --

addEvent("Fahrzeugverwaltung.orten",true)
addEventHandler("Fahrzeugverwaltung.orten",root,function(x,y,z)
	if(isElement(FahrzeugverwaltungBlip))then destroyElement(Fahrzeugverwaltung)end
	if(isTimer(FahrzeugverwaltungTimer))then killTimer(FahrzeugverwaltungTimer)end
	FahrzeugverwaltungBlip = createBlip(x,y,z,0,2,255,0,0)
	FahrzeugverwaltungTimer = setTimer(function()
		destroyElement(FahrzeugverwaltungBlip)
	end,30000,1)
	infobox(loc("Fahrzeugsystem_14"),"info")
end)

-- [[ DIE FAHRZEUG-DATAS SETZEN ]] --

addEvent("Fahrzeugverwaltung.setVehicles",true)
addEventHandler("Fahrzeugverwaltung.setVehicles",root,function(vehicles)
	guiGridListClear(GUIEditor.gridlist[1])
	if(#vehicles >= 1)then
		for _,v in pairs(vehicles)do
			local row = guiGridListAddRow(GUIEditor.gridlist[1])
			guiGridListSetItemText(GUIEditor.gridlist[1],row,id,v[1],false,false)
			guiGridListSetItemText(GUIEditor.gridlist[1],row,fahrzeug,v[2],false,false)
			guiGridListSetItemText(GUIEditor.gridlist[1],row,benzin,v[3],false,false)
			guiGridListSetItemText(GUIEditor.gridlist[1],row,explos,v[4],false,false)
		end
	end
end)