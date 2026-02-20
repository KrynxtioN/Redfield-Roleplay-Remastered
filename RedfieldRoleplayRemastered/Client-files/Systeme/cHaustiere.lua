-- [[ MODS LADEN ]] --

BearTXD = engineLoadTXD("Files/Mods/Bear.txd")
engineImportTXD(BearTXD,264)
BearDFF = engineLoadDFF("Files/Mods/Bear.dff")
engineReplaceModel(BearDFF,264)

ChickenTXD = engineLoadTXD("Files/Mods/Chicken.txd")
engineImportTXD(ChickenTXD,263)
ChickenDFF = engineLoadDFF("Files/Mods/Chicken.dff")
engineReplaceModel(ChickenDFF,263)

-- [[ INTERAKTION ]] --

addEvent("Haustiere.openWindow",true)
addEventHandler("Haustiere.openWindow",root,function(Laune,Gesundheit,Hunger,Durst,Name,Model)
	if(isWindowOpen())then
        GUIEditor.window[1] = guiCreateWindow(460, 328, 517, 292, loc("Systeme_13"), false)

        GUIEditor.staticimage[1] = guiCreateStaticImage(10, 26, 134, 127, "Files/Images/Model264.png", false, GUIEditor.window[1])
        GUIEditor.label[1] = guiCreateLabel(10, 163, 134, 119, "", false, GUIEditor.window[1])
        GUIEditor.label[2] = guiCreateLabel(154, 26, 353, 31, loc("Systeme_14"), false, GUIEditor.window[1])
        GUIEditor.button[1] = guiCreateButton(154, 67, 353, 27, loc("Systeme_15"), false, GUIEditor.window[1])
        GUIEditor.button[2] = guiCreateButton(154, 104, 353, 27, loc("Systeme_16"), false, GUIEditor.window[1])
        GUIEditor.button[3] = guiCreateButton(154, 141, 353, 27, loc("Systeme_17"), false, GUIEditor.window[1])
        GUIEditor.button[4] = guiCreateButton(154, 178, 353, 27, loc("Systeme_18"), false, GUIEditor.window[1])
        GUIEditor.button[5] = guiCreateButton(154, 255, 353, 27, loc("Systeme_19"), false, GUIEditor.window[1])
		setWindowDatas(2)
		triggerServerEvent("Haustiere.getDatas",localPlayer,localPlayer)
		
		Haustiere.timer = setTimer(function()
			triggerServerEvent("Haustiere.getDatas",localPlayer,localPlayer)
		end,1000,0)
		
		for i = 1,5 do
			addEventHandler("onClientGUIClick",GUIEditor.button[i],function()
				triggerServerEvent("Haustiere.server",localPlayer,guiGetText(source))
			end,false)
		end
	end
end)

-- [[ FENSTER REFRESHEN ]] --

addEvent("Haustiere.setDatas",true)
addEventHandler("Haustiere.setDatas",root,function(datas)
	if(isElement(GUIEditor.window[1]))then
		guiSetText(GUIEditor.label[1],loc("Systeme_20"):format(datas[2],datas[3],datas[4],datas[5],datas[6]))

		guiSetText(GUIEditor.button[1],loc("Systeme_21"):format(datas[8]))
		guiSetText(GUIEditor.button[2],loc("Systeme_22"):format(datas[9]))
		guiSetText(GUIEditor.button[3],loc("Systeme_23"):format(datas[7]))
		guiStaticImageLoadImage(GUIEditor.staticimage[1],"Files/Images/Model"..datas[1]..".png")
		guiSetText(GUIEditor.label[2],loc("Systeme_24"):format(datas[10],datas[10],(datas[10]+1)*Haustiere.pointsProLevel))
	end
end)

-- [[ DAMAGE CANCELN ]] --

addEventHandler("onClientPedDamage",root,function()
	if(getElementData(source,"Haustier") == true)then
		cancelEvent()
	end
end)