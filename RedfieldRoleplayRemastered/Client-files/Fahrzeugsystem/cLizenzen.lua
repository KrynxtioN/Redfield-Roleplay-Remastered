-- [[ DAS FENSTER ]] --

addEvent("Eigenmenue.Lizenzen",true)
addEventHandler("Eigenmenue.Lizenzen",root,function()
	local text = ""
    GUIEditor.window[1] = guiCreateWindow(569, 165, 300, 337, loc("Fahrzeugsystem_15"), false, true)

    GUIEditor.label[1] = guiCreateLabel(10, 26, 280, 301, "", false, GUIEditor.window[1])
	setWindowDatas(1,_,true)
	
	for _,v in pairs(Vehicles["Lizenzen"])do
		if(v == "Personalausweis" or v == "Arbeitsgenehmigung")then
			if(getElementData(localPlayer,v) == 1)then lizenz = "✔" else lizenz = "✘" end
			text = text.." \n"..v..": "..lizenz
		else
			if(getElementData(localPlayer,v.."Theorie") == 1)then lizenz = "✔" else lizenz = "✘" end
			text = text.." \n"..v.." ("..loc("Fahrzeugsystem_16").."): "..lizenz
			if(getElementData(localPlayer,v.."Praxis") == 1)then lizenz = "✔" else lizenz = "✘" end
			text = text.." \n"..v.." ("..loc("Fahrzeugsystem_17").."): "..lizenz
		end
	end
	guiSetText(GUIEditor.label[1],text)
end)

--// Tempomat
curMaxSpeed = false

function limit_func(cmd,amount)
	local amount = tonumber(amount)
	if(amount)then
		local amount = math.abs(amount)
		curMaxSpeed = amount
		curMaxSpeed = curMaxSpeed*0.00464
		if(not(isTimer(curMaxSpeedTimer)))then
			curMaxSpeedTimer = setTimer(fixSpeed,50,0)
		end
		if(getElementData(localPlayer,"Language") == 1)then
			infobox(loc("Fahrzeugsystem_20"):format(amount),"info")
		end
	else infobox(loc("Fahrzeugsystem_18"),"error")end
end
addCommandHandler("limit",limit_func)

function stoplimit_func()
	if(curMaxSpeed)then
		curMaxSpeed = false
		killTimer(curMaxSpeedTimer)
		infobox(loc("Fahrzeugsystem_19"),"error")
	end
end
addCommandHandler("stoplimit",stoplimit_func)

function fixSpeed()
	local veh = getPedOccupiedVehicle(localPlayer)
	if(veh)then
		if(isVehicleOnGround(veh) and getPedOccupiedVehicleSeat(localPlayer) == 0)then
			local vx,vy,vz = getElementVelocity(veh)
			local speed = math.sqrt(vx^2+vy^2+vz^2)
			if(speed > curMaxSpeed)then
				setElementVelocity(veh,vx*0.97,vy*0.97,vz*0.97)
			end
		end
	end
end