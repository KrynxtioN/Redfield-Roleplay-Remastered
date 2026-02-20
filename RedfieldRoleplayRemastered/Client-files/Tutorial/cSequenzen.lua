-- [[ INTROSEQUENZ STARTEN ]] --

function Sequenzen.beginn()
	setWeather(8)
	setTimer(function()
		local dim = getElementDimension(localPlayer)
		setElementDimension(localPlayer,dim)
		Sequenzen.element[1] = createVehicle(511,400.60028076172,2504.27734375,17.816272735596,0,0,31)
		setVehicleColor(Sequenzen.element[1],0,0,0)
		Sequenzen.element[2] = createPed(127,399.83486938477,2498.9897460938,16.484375,180)
		Sequenzen.element[3] = createPed(0,401.09664916992,2497.8215332031,16.484375,180)
		setPedControlState(Sequenzen.element[2],"forwards",true)
		setPedControlState(Sequenzen.element[3],"forwards",true)
		createExplosion(400.60028076172,2504.27734375,17.816272735596,10)
		setElementFrozen(Sequenzen.element[1],true)
		setTimer(function()
			for _,v in pairs(Sequenzen["Fire"])do
				createFire(v[1],v[2],v[3],5)
			end
		end,1000,1)
		triggerServerEvent("Sequenzen.server",localPlayer,dim)
		
		setTimer(function()
			setPedControlState(Sequenzen.element[2],"forwards",false)
			setPedControlState(Sequenzen.element[3],"forwards",false)
		end,10000,1)
		
		setElementDimension(Sequenzen.element[1],dim)
		setElementDimension(Sequenzen.element[2],dim)
		setElementDimension(Sequenzen.element[3],dim)
	end,1500,1)
end

-- [[ INTROSEQUENZ BEENDEN ]] --

function Sequenzen.ende()
	local x,y,z = getElementPosition(Sequenzen.element[3])
	setElementPosition(localPlayer,x,y,z)
	setPedRotation(localPlayer,getPedRotation(Sequenzen.element[3]))
	destroyElement(Sequenzen.element[3])
	setElementFrozen(Sequenzen.element[2],true)
	setElementData(Sequenzen.element[2],"Name",loc("Tutorial_8"))
	setElementData(Sequenzen.element[2],"IntroPed",true)
	for _,v in pairs(Components)do setPlayerHudComponentVisible(v,false)end
	Rundfahrt.createMarker()
end

addEvent("Sequenzen.destroy",true)
addEventHandler("Sequenzen.destroy",root,function()
	for _,v in pairs(Sequenzen.element)do
		destroyElement(v)
	end
end)