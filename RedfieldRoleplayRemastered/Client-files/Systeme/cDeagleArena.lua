DeagleArena.players = 0

addEvent("DeagleArena.openWindow",true)
addEventHandler("DeagleArena.openWindow",root,function(players)
	if(isWindowOpen())then
        GUIEditor.window[1] = guiCreateWindow(720, 284, 224, 144, loc("Systeme_128"), false)

        GUIEditor.label[1] = guiCreateLabel(10, 32, 204, 62, loc("Systeme_129"):format(players), false, GUIEditor.window[1])
        GUIEditor.button[1] = guiCreateButton(10, 104, 204, 30, loc("Systeme_130"), false, GUIEditor.window[1])    
		setWindowDatas(1)
		
		addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
			triggerServerEvent("DeagleArena.join",localPlayer,localPlayer)
		end,false)
	end
end)

addEvent("DeagleArena.refreshPlayer",true)
addEventHandler("DeagleArena.refreshPlayer",root,function(player)
	DeagleArena.players = player
	if(DeagleArena.players == 1)then
		text = loc("Systeme_131")
	else
		text = loc("Systeme_132"):format(DeagleArena.players)
	end
	Information.dxDraw(text,"create")
end)