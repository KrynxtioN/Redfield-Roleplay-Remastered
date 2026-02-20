-- [[ DAS FENSTER ]] --

addEvent("Bankraub.openWindow",true)
addEventHandler("Bankraub.openWindow",root,function()
	local fac = getElementData(localPlayer,"Fraktion")
	if(fac == 6 or fac == 7 or fac == 8 or fac == 9)then
		if(isWindowOpen())then
			GUIEditor.window[1] = guiCreateWindow(396, 332, 370, 206, loc("Fraktionen_26"), false)

			GUIEditor.label[1] = guiCreateLabel(10, 30, 350, 88, loc("Fraktionen_27"), false, GUIEditor.window[1])
			GUIEditor.button[1] = guiCreateButton(10, 167, 350, 29, loc("Fraktionen_28"), false, GUIEditor.window[1])
			GUIEditor.button[2] = guiCreateButton(11, 128, 349, 29, loc("Fraktionen_29"), false, GUIEditor.window[1]) 
			setWindowDatas(1)
			
			addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
				triggerServerEvent("Bankraub.planAbgeben",localPlayer)
			end,false)
			
			addEventHandler("onClientGUIClick",GUIEditor.button[2],function()
				triggerServerEvent("Bankraub.start",localPlayer)
			end,false)
		end
	else infobox("Wer bist du?!","error")end
end)

-- [[ ABGABEMARKER ]] --

addEvent("Bankraub.createMarker",true)
addEventHandler("Bankraub.createMarker",root,function(type,phase)
	if(isElement(Bankraub.marker))then destroyElement(Bankraub.marker)end
	if(isElement(Bankraub.blip))then destroyElement(Bankraub.blip)end
	
	if(type)then
		local tbl = Bankraub["Marker"][phase]
		Bankraub.marker = createMarker(tbl[1],tbl[2],tbl[3],"cylinder",3,255,0,0)
		Bankraub.blip = createBlip(tbl[1],tbl[2],tbl[3],0,2,255,0,0)
		
		addEventHandler("onClientMarkerHit",Bankraub.marker,function(player)
			if(player == localPlayer)then
				triggerServerEvent("Bankraub.nextPhase",localPlayer)
				destroyElement(source)
			end
		end)
	end
end)