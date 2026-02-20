-- [[ DAS INVENTAR ]] --

function Inventar.dxDraw()
    dxDrawRectangle(498*(x/1440), 377*(y/900), 444*(x/1440), 145*(y/900), tocolor(0, 0, 0, 200), false)
    dxDrawImage(498*(x/1440), 377*(y/900), 444*(x/1440), 16*(y/900), "Files/Images/Window2.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    dxDrawText(Inventar.text, 498*(x/1440), 377*(y/900), 942*(x/1440), 393*(y/900), tocolor(255, 255, 255, 255), 1.00*(x/1440), "default-bold", "center", "center", false, false, false, false, false)
	
	for i = 0,1 do
		local coord = 403 + (i*60)
		dxDrawRectangle(508*(x/1440), coord*(y/900), 52*(x/1440), 49*(y/900),tocolor(255,255,255,175),false)
		dxDrawRectangle(570*(x/1440), coord*(y/900), 52*(x/1440), 49*(y/900),tocolor(255,255,255,175),false)
		dxDrawRectangle(632*(x/1440), coord*(y/900), 52*(x/1440), 49*(y/900),tocolor(255,255,255,175),false)
		dxDrawRectangle(694*(x/1440), coord*(y/900), 52*(x/1440), 49*(y/900),tocolor(255,255,255,175),false)
		dxDrawRectangle(756*(x/1440), coord*(y/900), 52*(x/1440), 49*(y/900),tocolor(255,255,255,175),false)
		dxDrawRectangle(818*(x/1440), coord*(y/900), 52*(x/1440), 49*(y/900),tocolor(255,255,255,175),false)
		dxDrawRectangle(880*(x/1440), coord*(y/900), 52*(x/1440), 49*(y/900),tocolor(255,255,255,175),false)
	end
	
	local state1 = false
	for i = 1 + Inventar.scroll, 7  + Inventar.scroll do
		if(Inventar.items[i])then
			local tbl = Inventar.items[i]
			dxDrawImage(tbl[3],tbl[4],tbl[5],tbl[6],"Files/Images/Inventar/"..tbl[1]..".png",0,0,0,tocolor(255,255,255,255),true)
			if(isCursorOnElement(tbl[3],tbl[4],tbl[5],tbl[6]))then
				dxDrawRectangle(tbl[3],tbl[4],tbl[5],tbl[6],tocolor(250,250,0,200),false)
				Inventar.text = tbl[1].." ("..math.floor(tbl[2]).."x)"
				state1 = true
			end
		end
	end
	
	local state2 = false
	for i = 8 + Inventar.scroll, 14 + Inventar.scroll do
		if(Inventar.items[i])then
			local tbl = Inventar.items[i]
			dxDrawImage(tbl[3],tbl[4] + 60*(y/900),tbl[5],tbl[6],"Files/Images/Inventar/"..tbl[1]..".png",0,0,0,tocolor(255,255,255,255),true)
			if(isCursorOnElement(tbl[3],tbl[4] + 60*(y/900),tbl[5],tbl[6]))then
				dxDrawRectangle(tbl[3],tbl[4] + 60*(y/900),tbl[5],tbl[6],tocolor(250,250,0,200),false)
				Inventar.text = tbl[1].." ("..math.floor(tbl[2]).."x)"
				state2 = true
			end
		end
	end
	
	if(state1 == false and state2 == false)then
		Inventar.text = loc("Anzeigen_9")
	end
end

-- [[ EIN ITEM BENUTZEN ]] --

function Inventar.click(button)
	if(button == "left")then
		for i = 1 + Inventar.scroll, 7 + Inventar.scroll do
			if(Inventar.items[i])then
				local tbl = Inventar.items[i]
				if(isCursorOnElement(tbl[3],tbl[4],tbl[5],tbl[6]))then
					triggerServerEvent("Inventar.use",localPlayer,tbl[1])
				end
			end
		end
		
		for i = 8 + Inventar.scroll, 14 + Inventar.scroll do
			if(Inventar.items[i])then
				local tbl = Inventar.items[i]
				if(isCursorOnElement(tbl[3],tbl[4] + 60*(y/900),tbl[5],tbl[6]))then
					triggerServerEvent("Inventar.use",localPlayer,tbl[1])
				end
			end
		end
	end
end

-- [[ NACH OBEN UND UNTEN SCROLLEN ]] --

function Inventar.scrollDown()
	if(Inventar.scroll + 14 < #Inventar.items)then
		Inventar.scroll = Inventar.scroll + 7
	end
end

function Inventar.scrollUp()
	if(Inventar.scroll > 0)then
		Inventar.scroll = Inventar.scroll - 7
	end
end

-- [[ FUNKTION ZUM REFRESHEN DER SPIELERITEMS ]] --

function Inventar.refresh()
	local counter   = 0
	local distance  = 0
	Inventar.items = {}
	for i,v in pairs(Inventar["Items"])do
		if(getElementData(localPlayer,v) >= 1)then
			if(counter >= 7)then counter  = 0 end
			counter = counter + 1
			local tbl = Inventar["Slots"][counter]
			table.insert(Inventar.items,{v,getElementData(localPlayer,v),tbl[1]*(x/1440),(tbl[2] + distance * 60)*(y/900),tbl[3]*(x/1440),tbl[4]*(y/900)})
		end
	end
end
addEvent("Inventar.refresh",true)
addEventHandler("Inventar.refresh",root,Inventar.refresh)

-- [[ ÖFFNEN UND SCHLIESSEN ]] --

function Inventar.openInventar(type)
	if(Inventar.state == false)then
		if(isWindowOpen())then
			if(fileExists("Files/Images/Inventar/Eis.png"))then
				setWindowDatas()
				Inventar.scroll = 0
				Inventar.refresh()
				Inventar.state = true
				addEventHandler("onClientRender",root,Inventar.dxDraw)
				bindKey("mouse_wheel_down","down",Inventar.scrollDown)
				bindKey("mouse_wheel_up","down",Inventar.scrollUp)
				addEventHandler("onClientDoubleClick",root,Inventar.click)
			else infobox(loc("Anzeigen_8"),"error")end
		end
	else
		if(not(type))then setWindowDatas()end
		removeEventHandler("onClientRender",root,Inventar.dxDraw)
		Inventar.state = false
		unbindKey("mouse_wheel_down","down",Inventar.scrollDown)
		unbindKey("mouse_wheel_up","down",Inventar.scrollUp)
		removeEventHandler("onClientDoubleClick",root,Inventar.click)
		Inventar.text = loc("Anzeigen_9")
	end
end
addEvent("Inventar.openInventar",true)
addEventHandler("Inventar.openInventar",root,Inventar.openInventar)
bindKey("i","down",function() Inventar.openInventar() end)

-- [[ GRAS BENUTZEN ]] --

addEvent("useGras",true)
addEventHandler("useGras",root,function()
	if(not(isTimer(GrasTimer)))then
		setGameSpeed(0.8)
		local counter = 0
		GrasTimer = setTimer(function()
			counter = counter + 1
			setElementHealth(localPlayer,getElementHealth(localPlayer)+1)
			if(counter >= 60)then
				setGameSpeed(1)
			end
		end,1000,60)
	end
end)

-- [[ WAS PASSIERT, WENN DER SPIELER STIRBT ]] --

addEventHandler("onClientPlayerWasted",root,function(player)
	if(player == localPlayer)then
		if(isTimer(GrasTimer))then
			killTimer(GrasTimer)
			setGameSpeed(1)
		end
		if(Inventar.state == true)then
			Inventar.openInventar()
		end
	end
end)