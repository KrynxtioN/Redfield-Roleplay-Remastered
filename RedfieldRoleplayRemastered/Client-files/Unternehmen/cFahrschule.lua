-- [[ DAS FENSTER ]] --

addEvent("Fahrschule.openWindow",true)
addEventHandler("Fahrschule.openWindow",root,function(scheine)
	if(isWindowOpen())then
		Fahrschule.markerID = 0
        GUIEditor.window[1] = guiCreateWindow(480, 230, 392, 405, loc("Unternehmen_4"), false)

        GUIEditor.gridlist[1] = guiCreateGridList(10, 101, 372, 256, false, GUIEditor.window[1])
        schein = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Unternehmen_5"), 0.4)
        theoriePreis = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Unternehmen_6"), 0.3)
        praxisPreis = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Unternehmen_7"), 0.3)
        GUIEditor.button[1] = guiCreateButton(10, 367, 181, 28, loc("Unternehmen_8"), false, GUIEditor.window[1])
        GUIEditor.button[2] = guiCreateButton(201, 367, 181, 28, loc("Unternehmen_9"), false, GUIEditor.window[1])
        GUIEditor.label[1] = guiCreateLabel(10, 25, 372, 66, loc("Unternehmen_10"), false, GUIEditor.window[1])
		setWindowDatas(1)
		triggerServerEvent("Fahrschule.checkTutorial",localPlayer)
		
		for _,v in pairs(scheine)do
			local row = guiGridListAddRow(GUIEditor.gridlist[1])
			guiGridListSetItemText(GUIEditor.gridlist[1],row,schein,v[1],false,false)
			guiGridListSetItemText(GUIEditor.gridlist[1],row,theoriePreis,"$"..v[2],false,false)
			guiGridListSetItemText(GUIEditor.gridlist[1],row,praxisPreis,"$"..v[3],false,false)
		end
		
		for i = 1,2 do
			addEventHandler("onClientGUIClick",GUIEditor.button[i],function()
				local clicked = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),1)
				if(clicked ~= "")then
					triggerServerEvent("Fahrschule.server",localPlayer,clicked,guiGetText(source))
				end
			end,false)
		end
    end
end)

-- [[ DER FRAGEBOGEN ]] --

function Fahrschule.openInformationsWindow(schein)
	destroyElement(GUIEditor.window[1])
	ID = 0
	wrong_answers = 0
	GUIEditor.window[1] = guiCreateWindow(491, 178, 419, 161, loc("Unternehmen_11"):format(schein), false)

    GUIEditor.label[1] = guiCreateLabel(10, 25, 399, 91, loc("Unternehmen_12"):format(schein), false, GUIEditor.window[1])
    GUIEditor.button[1] = guiCreateButton(158, 126, 102, 25, "-->", false, GUIEditor.window[1])
	setWindowDatas(1,_,true)
	
	addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
		ID = ID + 1
		if(ID < #Fahrschule["Theorie"][schein]["Informationstexte"]+1)then
			guiSetText(GUIEditor.label[1],Fahrschule["Theorie"][schein]["Informationstexte"][ID])
		else
			ID = 0
			Fahrschule.openFragebogen(schein)
		end
	end,false)
end
addEvent("Fahrschule.openInformationsWindow",true)
addEventHandler("Fahrschule.openInformationsWindow",root,Fahrschule.openInformationsWindow)

-- [[ DER FRAGEBOGEN ]] --

function Fahrschule.openFragebogen(schein)
	destroyElement(GUIEditor.window[1])
	ID = ID + 1
    GUIEditor.window[1] = guiCreateWindow(709, 222, 374, 292, loc("Unternehmen_13"):format(schein), false)
		
    GUIEditor.label[1] = guiCreateLabel(10, 28, 354, 53, Fahrschule["Theorie"][schein]["Fragen"][ID][1], false, GUIEditor.window[1])
    GUIEditor.label[2] = guiCreateLabel(33, 87, 331, 43, Fahrschule["Theorie"][schein]["Fragen"][ID][2], false, GUIEditor.window[1])
    GUIEditor.radiobutton[1] = guiCreateRadioButton(10, 87, 48, 43, "", false, GUIEditor.window[1])
    GUIEditor.radiobutton[2] = guiCreateRadioButton(10, 140, 48, 43, "", false, GUIEditor.window[1])
    GUIEditor.radiobutton[3] = guiCreateRadioButton(10, 193, 48, 43, "", false, GUIEditor.window[1])
    GUIEditor.label[3] = guiCreateLabel(33, 140, 331, 43, Fahrschule["Theorie"][schein]["Fragen"][ID][3], false, GUIEditor.window[1])
    GUIEditor.label[4] = guiCreateLabel(33, 193, 331, 43, Fahrschule["Theorie"][schein]["Fragen"][ID][4], false, GUIEditor.window[1])
    GUIEditor.button[1] = guiCreateButton(112, 254, 149, 28, "-->", false, GUIEditor.window[1])
	setWindowDatas(4,_,true)
		
	addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
		if(not(guiRadioButtonGetSelected(GUIEditor.radiobutton[Fahrschule["Theorie"][schein]["Fragen"][ID][5]]) == true))then
			wrong_answers = wrong_answers + 1
		end
		if(ID < #Fahrschule["Theorie"][schein]["Fragen"])then
			Fahrschule.openFragebogen(schein)
		else
			if(wrong_answers <= 1)then
				setElementData(localPlayer,getElementData(localPlayer,"FahrschulLicense").."Theorie",1)
				infobox(loc("Unternehmen_14"):format(schein,#Fahrschule["Theorie"][schein]["Fragen"]-wrong_answers),"info")
				setWindowDatas()
				if(getElementData(localPlayer,"TutorialTask") == 3)then
					if(schein == "Fuehrerschein")then
						triggerServerEvent("Tutorial.aufgabeErledigt",localPlayer,localPlayer)
					end
				end
			else
				infobox(loc("Unternehmen_15"):format(wrong_answers,#Fahrschule["Theorie"][schein]["Fragen"]),"error")
				setWindowDatas()
			end
		end
	end,false)
end

--[[ PRAXISPRÜFUNG MARKER ]] --

function Fahrschule.praxisPruefungMarker(type)
	if(isElement(Fahrschule.marker))then destroyElement(Fahrschule.marker)end
	if(isElement(Fahrschule.blip))then destroyElement(Fahrschule.blip)end
	
	if(type)then
		local license = getElementData(localPlayer,"FahrschulLicense")
		if(license == "FlugscheinA" or license == "FlugscheinB")then
			datas = {"corona",0,255,5} -- MarkerType, Z-Koordinaten minus, Alpha, Größe
		else
			datas = {"cylinder",0.5,100,3} -- MarkerType, Z-Koordinaten minus, Alpha, Größe
		end
		Fahrschule.markerID = Fahrschule.markerID + 1
		if(Fahrschule.markerID > #Fahrschule["Praxis"][license])then
			triggerServerEvent("Fahrschule.giveLizenz",localPlayer,localPlayer,"bestanden")
		else
			local tbl = Fahrschule["Praxis"][license][Fahrschule.markerID]
			Fahrschule.marker = createMarker(tbl[1],tbl[2],tbl[3]-datas[2],datas[1],datas[4],255,0,0,datas[3])
			Fahrschule.blip = createBlip(tbl[1],tbl[2],tbl[3],0,2,255,0,0)
			setElementDimension(Fahrschule.marker,getElementDimension(localPlayer))
			setElementDimension(Fahrschule.blip,getElementDimension(localPlayer))
			
			addEventHandler("onClientMarkerHit",Fahrschule.marker,function(player)
				if(player == localPlayer)then
					Fahrschule.praxisPruefungMarker("create")
				end
			end)
		end
	end
end
addEvent("Fahrschule.praxisPruefungMarker",true)
addEventHandler("Fahrschule.praxisPruefungMarker",root,Fahrschule.praxisPruefungMarker)