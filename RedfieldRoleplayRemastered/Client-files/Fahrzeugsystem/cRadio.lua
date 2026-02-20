-- [[ DAS RADIO ]] --

addEventHandler("onClientRender",root,function()
	if(isPedInVehicle(localPlayer))then
		if(isWindowOpen() and not(isPlayerMapVisible(localPlayer)))then
			if(Radio.alpha > 0)then Radio.alpha = Radio.alpha - 1 end
			dxDrawText(Radio.text, 564*(x/1440), 11*(y/900), 874*(x/1440), 78*(y/900), tocolor(255, 255, 255, Radio.alpha), 1.00*(x/1440), "pricedown", "center", "center", false, false, false, false, false)
		end
	end
end)

-- [[ SCROLLEN ]] --

bindKey("mouse_wheel_up","down",function()
	if(isWindowOpen() and not(isPlayerMapVisible(localPlayer)))then
		if(isPedInVehicle(localPlayer))then
			if(Radio.id < 4)then
				if(isElement(Radio.musik))then destroyElement(Radio.musik)end
				Radio.alpha = 255
				Radio.id = Radio.id + 1
				Radio.musik = playSound(Radio["Streams"][Radio.id][2])
				Radio.text = Radio["Streams"][Radio.id][1]
			end
		end
	end
end)

bindKey("mouse_wheel_down","down",function()
	if(isWindowOpen() and not(isPlayerMapVisible(localPlayer)))then
		if(isPedInVehicle(localPlayer))then
			if(Radio.id > 0)then
				if(isElement(Radio.musik))then destroyElement(Radio.musik)end
				Radio.id = Radio.id - 1
				if(Radio.id ~= 0)then
					Radio.musik = playSound(Radio["Streams"][Radio.id][2])
				end
				Radio.text = Radio["Streams"][Radio.id][1]
				Radio.alpha = 255
			end
		end
	end
end)

-- [[ DAS RADIO EIN- / AUSBLENDEN WENN SPIELER EIN- ODER AUSSTEIGT ]] --

addEventHandler("onClientVehicleExit",root,function(player)
	if(player == localPlayer)then
		if(isElement(Radio.musik))then
			destroyElement(Radio.musik)
		end
	end
end)

addEventHandler("onClientVehicleEnter",root,function(player)
	if(player == localPlayer)then
		Radio.alpha = 255
		if(isElement(Radio.musik))then destroyElement(Radio.musik)end
		if(Radio.id ~= 0)then
			Radio.musik = playSound(Radio["Streams"][Radio.id][2])
		end
		RadioDestroyTimer = setTimer(function()
			if(not(isPedInVehicle(localPlayer)))then
				if(isElement(Radio.musik))then
					destroyElement(Radio.musik)
				end
				if(isTimer(RadioDestroyTimer))then killTimer(RadioDestroyTimer)end
			end
		end,50,0)
	end
end)

-- [[ WAS PASSIERT, WENN SPIELER STIRBT ]] --

addEventHandler("onClientPlayerWasted",root,function(player)
	if(player == localPlayer)then
		if(isElement(Radio.musik))then
			destroyElement(Radio.musik)
		end
	end
end)