-- [[ DAS FENSTER ZUM GRÜNDEN EINER FIRMA / GANG ]] --

addEvent("Firma.openWindow",true)
addEventHandler("Firma.openWindow",root,function()
	if(isWindowOpen())then
		if(getElementData(localPlayer,"Firma") == 0)then
			GUIEditor.window[1] = guiCreateWindow(373, 319, 480, 172, loc("Firma_1"), false)

			GUIEditor.label[1] = guiCreateLabel(10, 28, 460, 56, loc("Firma_2"), false, GUIEditor.window[1])
			GUIEditor.label[2] = guiCreateLabel(10, 94, 145, 27, loc("Firma_3"), false, GUIEditor.window[1])
			GUIEditor.edit[1] = guiCreateEdit(165, 94, 305, 27, "", false, GUIEditor.window[1])
			GUIEditor.button[1] = guiCreateButton(10, 131, 225, 31, loc("Firma_4"), false, GUIEditor.window[1])
			GUIEditor.button[2] = guiCreateButton(245, 131, 225, 31, loc("Firma_5"), false, GUIEditor.window[1])
			setWindowDatas(2)
			
			for i = 1,2 do
				addEventHandler("onClientGUIClick",GUIEditor.button[i],function()
					local name = guiGetText(GUIEditor.edit[1])
					if(#name >= 1)then
						triggerServerEvent("Firma.create",localPlayer,name,guiGetText(source))
					end
				end,false)
			end
		else
			GUIEditor.window[1] = guiCreateWindow(427, 271, 338, 169, loc("Firma_6"), false)

			GUIEditor.button[1] = guiCreateButton(10, 100, 318, 25, loc("Firma_7"), false, GUIEditor.window[1])
			GUIEditor.label[1] = guiCreateLabel(10, 27, 318, 30, loc("Firma_8"):format(getElementData(localPlayer,"FirmenName")), false, GUIEditor.window[1])
			GUIEditor.label[2] = guiCreateLabel(10, 67, 132, 23, loc("Firma_9"), false, GUIEditor.window[1])
			GUIEditor.edit[1] = guiCreateEdit(152, 67, 176, 23, "", false, GUIEditor.window[1])
			GUIEditor.button[2] = guiCreateButton(10, 134, 318, 25, loc("Firma_10"), false, GUIEditor.window[1])
			setWindowDatas(2)
			
			addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
				local name = guiGetText(GUIEditor.edit[1])
				if(#name >= 1)then
					triggerServerEvent("Firma.rename",localPlayer,name)
				else infobox(loc("Firma_11"),"error")end
			end,false)
			
			addEventHandler("onClientGUIClick",GUIEditor.button[2],function()
				triggerServerEvent("Firma.delete",localPlayer,name)
			end,false)
		end
	end
end)
