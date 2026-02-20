-- [[ OXYGEN CHECKEN ]] --

addEvent("Tauchen.setPedOxygenLevel",true)
addEventHandler("Tauchen.setPedOxygenLevel",root,function()
	if(getElementData(localPlayer,"OxygenFlasche") > 0)then
		setPedOxygenLevel(localPlayer,1000)
		setElementData(localPlayer,"OxygenFlasche",getElementData(localPlayer,"OxygenFlasche")-1)
	end
	if(not(isElementInWater(localPlayer)))then
		triggerServerEvent("Tauchen.useSuit",localPlayer,localPlayer)
	end
end)

-- [[ OXYGEN-ANZEIGE ]] --

function Tauchen.dxDraw()
	if(getElementData(localPlayer,"elementClicked") ~= true)then
		if(getElementData(localPlayer,"OxygenFlasche") <= 10)then r,g,b = 255,0,0 else r,g,b = 255,255,255 end
        dxDrawRectangle(1286*(x/1440), 684*(y/900), 58*(x/1440)/5000*getElementData(localPlayer,"OxygenFlasche"), 192*(y/900), tocolor(4, 131, 250, 255), false)
        dxDrawImage(1213*(x/1440), 632*(y/900), 217*(x/1440), 258*(y/900), "Files/Images/OxygenFlasche.png", 0, 0, 0, tocolor(r,g,b, 255), false)
	end
end

addEvent("Tauchen.dxDraw",true)
addEventHandler("Tauchen.dxDraw",root,function()
	if(Tauchen.render == false)then
		addEventHandler("onClientRender",root,Tauchen.dxDraw)
		Tauchen.render = true
	else
		removeEventHandler("onClientRender",root,Tauchen.dxDraw)
		Tauchen.render = false
	end
end)