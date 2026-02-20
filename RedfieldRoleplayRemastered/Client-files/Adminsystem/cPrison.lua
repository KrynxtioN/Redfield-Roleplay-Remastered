-- [[ FUNKTION ZUM ERSTELLEN DER MARKER ]] --

function Prison.client()
	local nr = math.random(1,#Prison["Marker"])
	if(nr ~= Prison.lastID)then
		Prison.marker = createMarker(Prison["Marker"][nr][1],Prison["Marker"][nr][2],Prison["Marker"][nr][3],"checkpoint",1,255,0,0,150)
		setElementInterior(Prison.marker,15)
		Prison.lastID = nr
		
		addEventHandler("onClientMarkerHit",Prison.marker,function(player)
			if(player == localPlayer)then
				if(getElementDimension(localPlayer) == getElementDimension(source))then
					destroyElement(source)
					setElementData(localPlayer,"Prison",getElementData(localPlayer,"Prison")-1)
					if(getElementData(localPlayer,"Prison") == 0)then
						triggerServerEvent("Prison.server",localPlayer)
					else
						Prison.client()
					end
				end
			end
		end)
	else
		Prison.client()
	end
end
addEvent("Prison.client",true)
addEventHandler("Prison.client",root,Prison.client)

-- [[ ANZEIGE ]] --

function Prison.dxDraw()
	if(isWindowOpen())then
		dxDrawRectangle(1116*(x/1440), 307*(y/900), 314*(x/1440), 62*(y/900), tocolor(17, 17, 17, 200), false)
		dxDrawText(loc("Adminsystem_65"):format(getElementData(localPlayer,"Prison")), 1182*(x/1440), 317*(y/900), 1420*(x/1440), 359*(y/900), tocolor(255, 255, 255, 255), 1.00*(x/1440), "default-bold", "center", "center", false, true, false, false, false)
		dxDrawImage(1126*(x/1440), 317*(y/900), 46*(x/1440), 42*(y/900), "Files/Images/HUD/Info.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
	end
end

addEvent("Prison.createDxDraw",true)
addEventHandler("Prison.createDxDraw",root,function(type)
	if(type == "create")then
		addEventHandler("onClientRender",root,Prison.dxDraw)
	else
		removeEventHandler("onClientRender",root,Prison.dxDraw)
	end
end)

-- [[ WAS PASSIERT, WENN DER SPIELER STIRBT ]] --

addEventHandler("onClientPlayerWasted",root,function(player)
	if(player == localPlayer)then
		if(isElement(Prison.marker))then
			destroyElement(Prison.marker)
		end
	end
end)