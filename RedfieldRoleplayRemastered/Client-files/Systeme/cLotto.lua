-- [[ DAS FENSTER ]] --

addEvent("Lotto.openWindow",true)
addEventHandler("Lotto.openWindow",root,function()
	if(isWindowOpen())then
        GUIEditor.window[1] = guiCreateWindow(471, 404, 349, 184, loc("Systeme_67"), false)

        GUIEditor.label[1] = guiCreateLabel(10, 28, 329, 61, loc("Systeme_68"):format(Lotto.jackpot), false, GUIEditor.window[1])
        GUIEditor.edit[1] = guiCreateEdit(148, 99, 53, 31, "", false, GUIEditor.window[1])
        GUIEditor.edit[2] = guiCreateEdit(85, 99, 53, 31, "", false, GUIEditor.window[1])
        GUIEditor.edit[3] = guiCreateEdit(211, 99, 53, 31, "", false, GUIEditor.window[1])
		for i = 1,3 do guiEditSetMaxLength(GUIEditor.edit[i],3) end
        GUIEditor.button[1] = guiCreateButton(10, 140, 329, 34, loc("Systeme_69"), false, GUIEditor.window[1])
		setWindowDatas(1)
		
		addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
			local nr1,nr2,nr3 = guiGetText(GUIEditor.edit[1]),guiGetText(GUIEditor.edit[2]),guiGetText(GUIEditor.edit[3])
			if(#nr1 >= 1 and isOnlyNumbers(nr1) and #nr2 >= 1 and isOnlyNumbers(nr2) and #nr3 >= 1 and isOnlyNumbers(nr3))then
				triggerServerEvent("Lotto.buyTicket",localPlayer,nr1,nr2,nr3)
			end
		end,false)
    end
end)
