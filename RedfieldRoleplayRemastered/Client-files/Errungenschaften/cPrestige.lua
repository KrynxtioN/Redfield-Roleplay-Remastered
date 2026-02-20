-- [[ DAS FENSTER ZUM KAUFEN / VERKAUFEN ]] --

addEvent("Prestige.openWindow",true)
addEventHandler("Prestige.openWindow",root,function(name,besitzer,preis)
	if(isWindowOpen())then
		if(besitzer == "Niemand" or besitzer == getPlayerName(localPlayer))then
			GUIEditor.window[1] = guiCreateWindow(429, 221, 315, 142, loc("Errungenschaften_29"), false)

			GUIEditor.label[1] = guiCreateLabel(10, 31, 295, 64, name.." - "..loc("Errungenschaften_30"):format(preis).." "..loc("Errungenschaften_31"), false, GUIEditor.window[1])
			GUIEditor.button[1] = guiCreateButton(89, 105, 138, 27, loc("Errungenschaften_32"), false, GUIEditor.window[1])
			setWindowDatas(1)
			
			if(besitzer == getPlayerName(localPlayer))then
				guiSetText(GUIEditor.label[1],loc("Errungenschaften_33"))
				guiSetText(GUIEditor.button[1],loc("Errungenschaften_34"))
			end
			
			addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
				triggerServerEvent("Prestige.buyObject",localPlayer,name,preis)
			end,false)
		else infobox(loc("Errungenschaften_35"):format(besitzer),"info")end
    end
end)