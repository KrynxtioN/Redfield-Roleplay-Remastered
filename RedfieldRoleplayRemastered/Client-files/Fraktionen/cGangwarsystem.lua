-- [[ DAS FENSTER ]] --

addEvent("Gangwar.openWindow",true)
addEventHandler("Gangwar.openWindow",root,function()
	if(isWindowOpen())then
        GUIEditor.window[1] = guiCreateWindow(547, 366, 280, 70, loc("Fraktionen_73"), false)

        GUIEditor.button[1] = guiCreateButton(10, 26, 260, 34, loc("Fraktionen_74"), false, GUIEditor.window[1])
		setWindowDatas()
		
		addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
			triggerServerEvent("Gangwar.start",localPlayer)
		end,false)
    end
end)

--//Gangwaranzeige
addEvent("Gangwar.updateDatas",true)
addEventHandler("Gangwar.updateDatas",root,function(attacker,defender,x,y,z,type)
	if(type == "create")then
		Gangwar.clientDatas = {attacker,defender}
		Gangwar.pickup = {x,y,z}
		addEventHandler("onClientRender",root,Gangwar.dxDrawMitmachen)
		addEventHandler("onClientRender",root,Gangwar.dxDraw)
		addEventHandler("onClientClick",root,Gangwar.mitmachenClick)
		Gangwar.refreshMatesTimer = setTimer(function()
			Gangwar.clientDatas[3] = 0 -- Insgesamt Angreifer
			Gangwar.clientDatas[4] = 0 -- Insgesamt Verteidiger
			Gangwar.clientDatas[5] = 0 -- Lebende Angreifer
			Gangwar.clientDatas[6] = 0 -- Lebende Verteidiger
			for _,v in pairs(getElementsByType("player"))do
				if(tonumber(getElementData(v,"Fraktion")) == tonumber(Gangwar.clientDatas[1]))then
					Gangwar.clientDatas[3] = Gangwar.clientDatas[3] + 1
					if(getElementData(v,"ImGangwarGestorben") ~= true)then
						Gangwar.clientDatas[5] = Gangwar.clientDatas[5] + 1
					end
				elseif(tonumber(getElementData(v,"Fraktion")) == tonumber(Gangwar.clientDatas[2]))then
					Gangwar.clientDatas[4] = Gangwar.clientDatas[4] + 1
					if(getElementData(v,"ImGangwarGestorben") ~= true)then
						Gangwar.clientDatas[6] = Gangwar.clientDatas[6] + 1
					end
				end
			end
		end,50,0)
		Gangwar.afk = setTimer(function()
			removeEventHandler("onClientRender",root,Gangwar.dxDrawMitmachen)
			triggerServerEvent("Gangwar.nichtMitmachen",localPlayer,"AFK")
		end,60000,1)
	elseif(type == "destroy")then
		removeEventHandler("onClientRender",root,Gangwar.dxDrawMitmachen)
		removeEventHandler("onClientRender",root,Gangwar.dxDraw)
		removeEventHandler("onClientClick",root,Gangwar.mitmachenClick)
		if(isTimer(Gangwar.refreshMatesTimer))then
			killTimer(Gangwar.refreshMatesTimer)
		end
	end
end)

addEvent("Gangwar.updateDatasTime",true)
addEventHandler("Gangwar.updateDatasTime",root,function(time)
	Gangwar.clientDatas[7] = time
end)

function Gangwar.mitmachenClick(button, state, absoluteX, absoluteY, worldX, worldY, worldZ, clickedElement)
	if(button == "left" and state == "down")then
		if(isCursorOnElement(1280*(x/1440), 505*(y/900), 150*(x/1440), 29*(y/900)))then
			removeEventHandler("onClientRender",root,Gangwar.dxDrawMitmachen)
			triggerServerEvent("Gangwar.mitmachen",localPlayer)
			if(isTimer(Gangwar.afk))then killTimer(Gangwar.afk)end
		elseif(isCursorOnElement(1280*(x/1440), 544*(y/900), 150*(x/1440), 29*(y/900)))then
			removeEventHandler("onClientRender",root,Gangwar.dxDrawMitmachen)
			triggerServerEvent("Gangwar.nichtMitmachen",localPlayer)
			if(isTimer(Gangwar.afk))then killTimer(Gangwar.afk)end
		end
	end
end

function Gangwar.dxDrawMitmachen()
	if(isWindowOpen())then
        dxDrawRectangle(1280*(x/1440), 505*(y/900), 150*(x/1440), 29*(y/900), tocolor(0, 0, 0, 175), false)
        dxDrawRectangle(1280*(x/1440), 544*(y/900), 150*(x/1440), 29*(y/900), tocolor(0, 0, 0, 175), false)
        dxDrawText(loc("Fraktionen_75"), 1280*(x/1440), 505*(y/900), 1430*(x/1440), 534*(y/900), tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
        dxDrawText(loc("Fraktionen_76"), 1280*(x/1440), 544*(y/900), 1430*(x/1440), 573*(y/900), tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
	end
end

function Gangwar.dxDraw()
	if(isWindowOpen())then
		if(Gangwar.clientDatas[1] and Gangwar.clientDatas[2] and Gangwar.clientDatas[3] and Gangwar.clientDatas[4] and Gangwar.clientDatas[5] and Gangwar.clientDatas[6] and Gangwar.clientDatas[7])then
			local distance = getDistanceBetweenPoints3D(Gangwar.pickup[1],Gangwar.pickup[2],Gangwar.pickup[3],getElementPosition(localPlayer))
			if(distance <= 15)then r,g,b = 0,255,0 else r,g,b = 255,0,0 end
			dxDrawText(math.floor(distance).." Meter", 1322*(x/1440), 343*(y/900), 1430*(x/1440), 361*(y/900), tocolor(r,g,b, 255), 1.00*(x/1440), "default", "right", "center", false, false, false, false, false)
			dxDrawRectangle(1172*(x/1440), 372*(y/900), 124*(x/1440), 48*(y/900), tocolor(Fraktionssystem["Fraktion"][Gangwar.clientDatas[1]][1], Fraktionssystem["Fraktion"][Gangwar.clientDatas[1]][2], Fraktionssystem["Fraktion"][Gangwar.clientDatas[1]][3], 175), false)
			dxDrawRectangle(1306*(x/1440), 372*(y/900), 124*(x/1440), 48*(y/900), tocolor(Fraktionssystem["Fraktion"][Gangwar.clientDatas[2]][1], Fraktionssystem["Fraktion"][Gangwar.clientDatas[2]][2], Fraktionssystem["Fraktion"][Gangwar.clientDatas[2]][3], 175), false)
			dxDrawText(Fraktionssystem["Fraktionnamen"][Gangwar.clientDatas[1]].."\n"..Gangwar.clientDatas[5].."/"..Gangwar.clientDatas[3], 1172*(x/1440), 372*(y/900), 1296*(x/1440), 420*(y/900), tocolor(255,255,255, 255), 1.00*(x/1440), "default-bold", "center", "center", false, false, false, false, false)
			dxDrawText(Fraktionssystem["Fraktionnamen"][Gangwar.clientDatas[2]].."\n"..Gangwar.clientDatas[6].."/"..Gangwar.clientDatas[4], 1306*(x/1440), 372*(y/900), 1430*(x/1440), 420*(y/900), tocolor(255,255,255, 255), 1.00*(x/1440), "default-bold", "center", "center", false, false, false, false, false)
			dxDrawRectangle(1172*(x/1440), 430*(y/900), 258*(x/1440), 25*(y/900), tocolor(0,0,0, 175), false)
			dxDrawRectangle(1172*(x/1440), 465*(y/900), 258*(x/1440), 25*(y/900), tocolor(0,0,0, 175), false)
			dxDrawImage(1172*(x/1440), 430*(y/900), 25*(x/1440), 25*(y/900), "Files/Images/flash.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
			dxDrawImage(1306*(x/1440), 430*(y/900), 25*(x/1440), 25*(y/900), "Files/Images/skull.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
			dxDrawText(getElementData(localPlayer,"TemporaerGWDamage"), 1197*(x/1440), 430*(y/900), 1296*(x/1440), 455*(y/900), tocolor(255, 255, 255, 255), 1.00*(x/1440), "default-bold", "center", "center", false, false, false, false, false)
			dxDrawText(getElementData(localPlayer,"TemporaerGWKills"), 1331*(x/1440), 430*(y/900), 1430*(x/1440), 455*(y/900), tocolor(255, 255, 255, 255), 1.00*(x/1440), "default-bold", "center", "center", false, false, false, false, false)
			dxDrawImage(1172*(x/1440), 465*(y/900), 25*(x/1440), 25*(y/900), "Files/Images/time.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
			dxDrawText(Gangwar.clientDatas[7], 1197*(x/1440), 465*(y/900), 1430*(x/1440), 490*(y/900), tocolor(255, 255, 255, 255), 1.00*(x/1440), "default-bold", "center", "center", false, false, false, false, false)
		end
	end
end

--//Spielerblips
local FactionMemberBlips = {}

addEvent("createFactionMemberBlips",true)
addEventHandler("createFactionMemberBlips",root,function()
	for i = 1,#FactionMemberBlips do
		if(isElement(FactionMemberBlips[i]))then
			destroyElement(FactionMemberBlips[i])
		end
	end
	if(getElementData(localPlayer,"Fraktion") >= 1)then
		local counter = 0
		local r,g,b = Fraktionssystem["Fraktion"][getElementData(localPlayer,"Fraktion")][1],Fraktionssystem["Fraktion"][getElementData(localPlayer,"Fraktion")][2],Fraktionssystem["Fraktion"][getElementData(localPlayer,"Fraktion")][3]
		for _,v in pairs(getElementsByType("player"))do
			if(getElementData(v,"Fraktion") == getElementData(localPlayer,"Fraktion"))then
				if(getPlayerName(v) ~= getPlayerName(localPlayer))then
					counter = counter + 1
					FactionMemberBlips[counter] = createBlipAttachedTo(v,0,2,r,g,b)
				end
			end
		end
	end
end)