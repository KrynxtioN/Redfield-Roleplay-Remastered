-- [[ DAS FENSTER ]] --

addEvent("Waffenbox.openWindow",true)
addEventHandler("Waffenbox.openWindow",root,function(weapons,state)
	if(getElementData(localPlayer,"InHouse") ~= true)then
		if(isWindowOpen() or state == true)then
		
		end
	end
	if(state == false)then
		if(getElementData(localPlayer,"InHouse") == true)then destroyElement(GUIEditor.window[1])end
		GUIEditor.window[1] = guiCreateWindow(348, 262, 347, 212, loc("Systeme_210"), false)

		GUIEditor.staticimage[1] = guiCreateStaticImage(10, 27, 102, 89, "Files/Images/HUD/Waffen/1337.png", false, GUIEditor.window[1])
		GUIEditor.staticimage[2] = guiCreateStaticImage(122, 27, 102, 89, "Files/Images/HUD/Waffen/1337.png", false, GUIEditor.window[1])
		GUIEditor.staticimage[3] = guiCreateStaticImage(234, 27, 102, 89, "Files/Images/HUD/Waffen/1337.png", false, GUIEditor.window[1])
		GUIEditor.label[1] = guiCreateLabel(10, 126, 102, 40, "", false, GUIEditor.window[1])
		GUIEditor.label[2] = guiCreateLabel(122, 126, 102, 40, "", false, GUIEditor.window[1])
		GUIEditor.label[3] = guiCreateLabel(234, 126, 102, 40, "", false, GUIEditor.window[1])
		GUIEditor.button[1] = guiCreateButton(10, 176, 102, 26, loc("Systeme_211"), false, GUIEditor.window[1])
		GUIEditor.button[2] = guiCreateButton(122, 176, 102, 26, loc("Systeme_212"), false, GUIEditor.window[1])
		GUIEditor.button[3] = guiCreateButton(234, 176, 102, 26, loc("Systeme_213"), false, GUIEditor.window[1])
		if(getElementData(localPlayer,"InHouse") == true)then
			setWindowDatas(3,_,true)
		else
			setWindowDatas(3)
		end
			
		for i = 1,3 do
			addEventHandler("onClientGUIClick",GUIEditor.button[i],function()
				triggerServerEvent("Waffenbox.server",localPlayer,i)
			end,false)
		end
			
		loadWeapons(weapons)
	else
		loadWeapons(weapons)
	end
end)

-- [[ DEN WAFFENBOXINHALT REFRESHEN ]] --

function loadWeapons(weapons)
	for i = 1,3 do
		if(weapons[i][1] == 1337)then
			datas = {"-",loc("Systeme_214")}
		else
			datas = {getWeaponNameFromID(weapons[i][1]).."\n"..weapons[i][2].." "..loc("Systeme_215"),loc("Systeme_216")}
		end
		guiSetText(GUIEditor.label[i],datas[1])
		guiStaticImageLoadImage(GUIEditor.staticimage[i],"Files/Images/HUD/Waffen/"..weapons[i][1]..".png")
		guiSetText(GUIEditor.button[i],datas[2])
	end
end