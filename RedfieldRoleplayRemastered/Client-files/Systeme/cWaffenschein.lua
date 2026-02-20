-- [[ DAS FENSTER ]] --

addEvent("Waffenschein.openWindow",true)
addEventHandler("Waffenschein.openWindow",root,function()
	if(isWindowOpen())then
        GUIEditor.window[1] = guiCreateWindow(456, 249, 374, 153, loc("Systeme_199"), false)

        GUIEditor.label[1] = guiCreateLabel(10, 27, 354, 78, loc("Systeme_200"), false, GUIEditor.window[1])
        GUIEditor.button[1] = guiCreateButton(10, 115, 172, 25, loc("Systeme_201"), false, GUIEditor.window[1])
        GUIEditor.button[2] = guiCreateButton(192, 115, 172, 25, loc("Systeme_202"), false, GUIEditor.window[1])
		setWindowDatas(1)
		
		addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
			if(getElementData(localPlayer,"WaffenscheinTheorie") == 0)then
				triggerServerEvent("Waffenschein.theorie",localPlayer)
			else infobox(loc("Systeme_203"),"error")end
		end,false)
		
		addEventHandler("onClientGUIClick",GUIEditor.button[2],function()
			if(getElementData(localPlayer,"WaffenscheinPraxis") == 0)then
				triggerServerEvent("Waffenschein.praxis",localPlayer)
			else infobox(loc("Systeme_204"),"error")end
		end,false)
    end
end)

-- [[ DER FRAGEBOGEN ]] --

function Waffenschein.openInformationsWindow()
	destroyElement(GUIEditor.window[1])
	ID = 0
	wrong_answers = 0
    GUIEditor.window[1] = guiCreateWindow(491, 178, 419, 161, loc("Systeme_205"), false)

    GUIEditor.label[1] = guiCreateLabel(10, 25, 399, 91, loc("Systeme_206"), false, GUIEditor.window[1])
    GUIEditor.button[1] = guiCreateButton(158, 126, 102, 25, "-->", false, GUIEditor.window[1])
	setWindowDatas(1,_,true)
		
	addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
		ID = ID + 1
		if(ID < #Waffenschein["Informationstexte"]+1)then
			guiSetText(GUIEditor.label[1],Waffenschein["Informationstexte"][ID])
		else
			ID = 0
			Waffenschein.openFragebogen()
		end
	end,false)
end
addEvent("Waffenschein.openInformationsWindow",true)
addEventHandler("Waffenschein.openInformationsWindow",root,Waffenschein.openInformationsWindow)

function Waffenschein.openFragebogen()
	destroyElement(GUIEditor.window[1])
	ID = ID + 1
    GUIEditor.window[1] = guiCreateWindow(709, 222, 374, 292, loc("Systeme_207"), false)
		
    GUIEditor.label[1] = guiCreateLabel(10, 28, 354, 53, Waffenschein["Fragen"][ID][1], false, GUIEditor.window[1])
    GUIEditor.label[2] = guiCreateLabel(33, 87, 331, 43, Waffenschein["Fragen"][ID][2], false, GUIEditor.window[1])
    GUIEditor.radiobutton[1] = guiCreateRadioButton(10, 87, 48, 43, "", false, GUIEditor.window[1])
    GUIEditor.radiobutton[2] = guiCreateRadioButton(10, 140, 48, 43, "", false, GUIEditor.window[1])
    GUIEditor.radiobutton[3] = guiCreateRadioButton(10, 193, 48, 43, "", false, GUIEditor.window[1])
    GUIEditor.label[3] = guiCreateLabel(33, 140, 331, 43, Waffenschein["Fragen"][ID][3], false, GUIEditor.window[1])
    GUIEditor.label[4] = guiCreateLabel(33, 193, 331, 43, Waffenschein["Fragen"][ID][4], false, GUIEditor.window[1])
    GUIEditor.button[1] = guiCreateButton(112, 254, 149, 28, "-->", false, GUIEditor.window[1])
	setWindowDatas(4,_,true)
		
	addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
		if(not(guiRadioButtonGetSelected(GUIEditor.radiobutton[Waffenschein["Fragen"][ID][5]]) == true))then
			wrong_answers = wrong_answers + 1
		end
		if(ID < #Waffenschein["Fragen"])then
			Waffenschein.openFragebogen()
		else
			if(wrong_answers <= 1)then
				setElementData(localPlayer,"WaffenscheinTheorie",1)
				infobox(loc("Systeme_208"):format(#Waffenschein["Fragen"]-wrong_answers),"info")
				setWindowDatas()
			else infobox(loc("Systeme_209"):format(wrong_answers,#Waffenschein["Fragen"]),"error")end
		end
	end,false)
end