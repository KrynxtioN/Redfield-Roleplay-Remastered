RedfieldLobby = {}
local b_Width, b_Height = guiGetScreenSize()
local ReallifeID, RaceID, TacticsID = 1,1,1

local BigNoodle1 = dxCreateFont("Files/Fonts/big_noodle_titling.ttf",14)
local BigNoodle2 = dxCreateFont("Files/Fonts/big_noodle_titling_oblique.ttf",35)

setElementData(localPlayer,"loggedin",0)
setElementData(localPlayer,"elementClicked",false)
setElementData(localPlayer,"Lobby","Eingangsbereich")

function RedfieldLobby.createLobby()
	setWindowDatas(_,"no")
	addEventHandler("onClientRender",root,RedfieldLobby.dxDraw)
	addEventHandler("onClientClick",root,RedfieldLobby.click)
end

function RedfieldLobby.dxDraw()
	--dxDrawImage(0*(b_Width/1920),0*(b_Height/1080),1920*(b_Width/1920),1080*(b_Height/1080),"Files/Images/Lobby/Lobby_BG.png")
	dxDrawRectangle(0*(b_Width/1920),80*(b_Height/1080),1920*(b_Width/1920),120*(b_Height/1080),tocolor(46,49,54,178.5))
	--dxDrawRectangle(0*(b_Width/1920),0*(b_Height/1080),1920*(b_Width/1920),1080*(b_Height/1080),tocolor(0,0,0,76.5))
	dxDrawText("Redfield Roleplay",0*(b_Width/1920),93*(b_Height/1080),1920*(b_Width/1920),200*(b_Height/1080),tocolor(227, 227, 227,255),1*(b_Height/1080),BigNoodle2,"center","top")
	dxDrawText("You should play with us and not alone!",0*(b_Width/1920),153*(b_Height/1080),1920*(b_Width/1920),200*(b_Height/1080),tocolor(227, 227, 227,255),1*(b_Height/1080),BigNoodle1,"center","top")

	-- Reallife
	dxDrawRectangle(560*(b_Width/1920),340*(b_Height/1080),800*(b_Width/1920),50*(b_Height/1080),tocolor(29,31,34,255))
	dxDrawRectangle(560*(b_Width/1920),560*(b_Height/1080),800*(b_Width/1920),42*(b_Height/1080),tocolor(46,49,54,255))
	dxDrawRectangle(560*(b_Width/1920),390*(b_Height/1080),800*(b_Width/1920),170*(b_Height/1080),tocolor(38,41,45,255))
	dxDrawImageSection(560*(b_Width/1920),390*(b_Height/1080),800*(b_Width/1920),170*(b_Height/1080),0,0,800/ReallifeID,170/ReallifeID,"Files/Images/Lobby/Reallife.png")
	dxDrawText("Reallife",580*(b_Width/1920),340*(b_Height/1080),800*(b_Width/1920),390*(b_Height/1080),tocolor(227, 227, 227,255),1*(b_Height/1080),"default-bold","left","center")
	
	-- Race
	dxDrawRectangle(560*(b_Width/1920),680*(b_Height/1080),380*(b_Width/1920),50*(b_Height/1080),tocolor(29,31,34,255))
	dxDrawRectangle(560*(b_Width/1920),898*(b_Height/1080),380*(b_Width/1920),42*(b_Height/1080),tocolor(46,49,54,255))
	dxDrawRectangle(560*(b_Width/1920),730*(b_Height/1080),380*(b_Width/1920),168*(b_Height/1080),tocolor(38,41,45,255))
	dxDrawImageSection(560*(b_Width/1920),730*(b_Height/1080),380*(b_Width/1920),168*(b_Height/1080),0,0,380/RaceID,165/RaceID,"Files/Images/Lobby/Race_Comingsoon.png")
	dxDrawText("Race",580*(b_Width/1920),680*(b_Height/1080),380*(b_Width/1920),730*(b_Height/1080),tocolor(227,227,227,255),1*(b_Height/1080),"default-bold","left","center")
	
	-- Tactics
	dxDrawRectangle(980*(b_Width/1920),680*(b_Height/1080),380*(b_Width/1920),50*(b_Height/1080),tocolor(29,31,34,255))
	dxDrawRectangle(980*(b_Width/1920),898*(b_Height/1080),380*(b_Width/1920),42*(b_Height/1080),tocolor(46,49,54,255))
	dxDrawRectangle(980*(b_Width/1920),730*(b_Height/1080),379*(b_Width/1920),168*(b_Height/1080),tocolor(38,41,45,255))
	dxDrawImageSection(980*(b_Width/1920),730*(b_Height/1080),379*(b_Width/1920),168*(b_Height/1080),0,0,380/TacticsID,165/TacticsID,"Files/Images/Lobby/Tactics.png")
	dxDrawText("Deathmatch",1000*(b_Width/1920),680*(b_Height/1080),380*(b_Width/1920),730*(b_Height/1080),tocolor(227,227,227,255),1*(b_Height/1080),"default-bold","left","center")
	
	if(isCursorOnElement(560*(b_Width/1920),390*(b_Height/1080),800*(b_Width/1920),170*(b_Height/1080)))then
		if(ReallifeID < 1.1)then
			ReallifeID = ReallifeID + 0.01
		end
	else
		if(ReallifeID > 1)then
			ReallifeID = ReallifeID - 0.01
		end
	end
	if(isCursorOnElement(560*(b_Width/1920),730*(b_Height/1080),380*(b_Width/1920),168*(b_Height/1080)))then
		if(RaceID < 1.1)then
			RaceID = RaceID + 0.01
		end
	else
		if(RaceID > 1)then
			RaceID = RaceID - 0.01
		end
	end
	if(isCursorOnElement(980*(b_Width/1920),730*(b_Height/1080),379*(b_Width/1920),168*(b_Height/1080)))then
		if(TacticsID < 1.1)then
			TacticsID = TacticsID + 0.01
		end
	else
		if(TacticsID > 1)then
			TacticsID = TacticsID - 0.01
		end
	end
end

function RedfieldLobby.click(button,state)
	if(button == "left" and state == "down")then
		if(isCursorOnElement(560*(b_Width/1920),390*(b_Height/1080),800*(b_Width/1920),170*(b_Height/1080)))then
			triggerServerEvent("checkAccount",localPlayer,localPlayer)
			triggerServerEvent("checkAutologin",localPlayer)
			removeEventHandler("onClientRender",root,RedfieldLobby.dxDraw)
			removeEventHandler("onClientClick",root,RedfieldLobby.click)
		elseif(isCursorOnElement(560*(b_Width/1920),730*(b_Height/1080),380*(b_Width/1920),168*(b_Height/1080)))then

		elseif(isCursorOnElement(980*(b_Width/1920),730*(b_Height/1080),379*(b_Width/1920),168*(b_Height/1080)))then
			triggerServerEvent("DeagleArena.join",localPlayer)
			removeEventHandler("onClientRender",root,RedfieldLobby.dxDraw)
			removeEventHandler("onClientClick",root,RedfieldLobby.click)
			setElementData(localPlayer,"DeagleArenaGast",true)
			dxDrawHUDFunction()
		end
	end
end
RedfieldLobby.createLobby()
addEvent("RedfieldLobby.createLobby",true)
addEventHandler("RedfieldLobby.createLobby",root,RedfieldLobby.createLobby)