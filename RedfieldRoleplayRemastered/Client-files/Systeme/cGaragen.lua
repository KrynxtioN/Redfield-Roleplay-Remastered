-- [[ DAS FENSTER ]] --

addEvent("Garagen.openWindow",true)
addEventHandler("Garagen.openWindow",root,function(preis,owner)
	if(isWindowOpen())then
		if(owner == "Niemand" or owner == getPlayerName(localPlayer))then
			GUIEditor.window[1] = guiCreateWindow(504, 335, 370, 116, loc("Systeme_7"), false)

			GUIEditor.label[1] = guiCreateLabel(10, 28, 350, 39, loc("Systeme_8"):format(preis), false, GUIEditor.window[1])
			GUIEditor.button[1] = guiCreateButton(9, 77, 351, 29, loc("Systeme_9"), false, GUIEditor.window[1])
			setWindowDatas(1)
			
			if(owner == getPlayerName(localPlayer))then
				guiSetText(GUIEditor.label[1],loc("Systeme_10"))
				guiSetText(GUIEditor.button[1],loc("Systeme_11"))
			end
			
			addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
				triggerServerEvent("Garagen.buy",localPlayer)
			end,false)
		else infobox(loc("Systeme_12"):format(owner),"info")end
	end
end)