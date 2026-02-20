addEvent("Shooterarena.openWindow",true)
addEventHandler("Shooterarena.openWindow",root,function(players)
	if(isWindowOpen())then
		GUIEditor.window[1] = guiCreateWindow(720, 284, 224, 144, loc("Systeme_89"), false)

		GUIEditor.label[1] = guiCreateLabel(10, 32, 204, 62, loc("Systeme_90"):format(players), false, GUIEditor.window[1])
		GUIEditor.button[1] = guiCreateButton(10, 104, 204, 30, loc("Systeme_91"), false, GUIEditor.window[1])    
		setWindowDatas(1)
			
		addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
			triggerServerEvent("Shooterarena.join",localPlayer,localPlayer)
			setWindowDatas()
		end,false)
	end
end)

function Shooterarena.shoot()
	if(isPedInVehicle(localPlayer) == true)then
		local veh = getPedOccupiedVehicle(localPlayer)
		if(getElementData(veh,"shooterVehicle") == true and Shooterarena.state == false)then
			createProjectile(veh,19)
			Shooterarena.state = true
			setTimer(function()
				Shooterarena.state = false
			end,2100,1)
		end
	end
end

addEvent("Shooterarena.join",true)
addEventHandler("Shooterarena.join",root,function(type)
	unbindKey("mouse1","down",Shooterarena.shoot)
	if(type)then
		bindKey("mouse1","down",Shooterarena.shoot)
	end
end)

addEvent("Shooterarena.refreshPlayer",true)
addEventHandler("Shooterarena.refreshPlayer",root,function(player)
	Shooterarena.players = player
	if(Shooterarena.players == 1)then
		text = loc("Systeme_92")
	else
		text = loc("Systeme_93"):format(Shooterarena.players)
	end
	Information.dxDraw(text,"create")
end)