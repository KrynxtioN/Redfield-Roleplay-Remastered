x,y = guiGetScreenSize()
NewFont = dxCreateFont("Files/Fonts/Font.ttf",10)

Color = {
	[0] = {255,0,0},
	[1] = {0,255,0},
}

local WindowPoints = 0
local loadscreenFakt = nil
local ScreenSource = dxCreateScreenSource(x,y)
BlurShader = dxCreateShader("Files/Shader/Blur.fx")

-- [[ SONDERZEICHEN/BUCHSTABEN CHECK ]] --

local OnlyNumbersTable = {"a","b","c","d","e","f","g","h","i","j","k","l","m","o","p","y","r","s","t","u","v","w","x","y","z","A","B","C","D","E","F","G","H","I","J","K","L","M","O","P","Q","R","S","T","U","V","W","X","Y","Z","ä","ü","ö","Ä","Ü","Ö"," ",",","#","'","+","*","~",":","","=","}","?","\\","{","&","/","§","\"","!","°","@","|","`","´","-","+"}

function isOnlyNumbers(text)
	local counter = 0
	for k,v in ipairs(OnlyNumbersTable)do
		if(string.find(text,v))then
			counter = counter + 1
			break
		end
	end
	if(counter > 0)then
		infobox(loc("cMain_1"),"error")
		return false
	else
		return true
	end
end

-- [[ getText ]] --

function getText(id)
	local language = tonumber(getElementData(localPlayer,"Language"))
	local id = tonumber(id)
	if(Language[language] and Language[language][id])then
		return Language[language][id]
	else
		return Language[1][id]
	end
end

-- [[ BLUREFFEKT ]] --

function renderBlur()
	if(BlurShader)then
		dxUpdateScreenSource(ScreenSource)
		dxSetShaderValue(BlurShader,"ScreenSource",ScreenSource)
		dxSetShaderValue(BlurShader,"BlurStrength",7)
		dxSetShaderValue(BlurShader,"UVSize",x,y)
		dxDrawImage(0,0,x,y,BlurShader)
	end
end

function centerWindow (center_window)
    local windowW, windowH = guiGetSize(center_window, false)
    local x, y = (x - windowW) /2,(y - windowH) /2
    return guiSetPosition(center_window, x, y, false)
end

-- [[ IST FENSTER OFFEN? ]] --

function isWindowOpen()
	if(isElement(GUIEditor.window[1]) or getElementData(localPlayer,"elementClicked") == true or getElementData(localPlayer,"ImIntro") == true or getElementData(localPlayer,"wirdGeportet") == true)then
		return false
	else
		return true
	end
end

function isCursorOnElement( posX, posY, width, height )
	if isCursorShowing( ) then
		local mouseX, mouseY = getCursorPosition( )
		local clientW, clientH = guiGetScreenSize( )
		local mouseX, mouseY = mouseX * clientW, mouseY * clientH
		if ( mouseX > posX and mouseX < ( posX + width ) and mouseY > posY and mouseY < ( posY + height ) ) then
			return true
		end
	end
	return false
end

-- [[ CURSOR ANZEIGEN ]] --

bindKey("m","both",function()
	if(getElementData(localPlayer,"elementClicked") ~= true)then
		showCursor(not(isCursorShowing()))
	end
end)

-- [[ WINDOW-DATAS SETZEN ]] --

function setWindowDatas(label,blur,refresh,center)
	local veh = getPedOccupiedVehicle(localPlayer)
	if(getElementData(localPlayer,"elementClicked") == false or refresh == true)then
		playSound("Files/Sounds/MenueOpen.mp3")
		showChat(false)
		if(label)then
			for i = 1,label do 
				guiSetFont(GUIEditor.label[i],"default-bold-small")
				guiLabelSetHorizontalAlign(GUIEditor.label[i],"center",true)
				guiLabelSetVerticalAlign(GUIEditor.label[i],"center")
			end
		end
		if(isElement(GUIEditor.window[1]))then
			if(not(center))then
				centerWindow(GUIEditor.window[1])
			end
		end
		if(getElementData(localPlayer,"elementClicked") ~= true)then
			if(not(blur) and not(center))then
				addEventHandler("onClientRender",root,renderBlur)
			end
			addEventHandler("onClientRender",root,dxDrawKinobalken)
			KinobalkenState = true
		end
		showCursor(true)
		setElementData(localPlayer,"elementClicked",true)
		setPlayerHudComponentVisible("radar",false)
	else
		if(isTimer(CamflightTimer))then killTimer(CamflightTimer)end
		if(isTimer(Haustiere.timer))then killTimer(Haustiere.timer)end
		playSound("Files/Sounds/MenueClose.mp3")
		showCursor(false)
		if(isElement(GUIEditor.window[1]))then destroyElement(GUIEditor.window[1])end
		removeEventHandler("onClientRender",root,renderBlur)
		KinobalkenState = false
		KinobalkenTimer = setTimer(function()
			if(getElementData(localPlayer,"ImIntro") ~= true)then
				showChat(true)
				setElementData(localPlayer,"elementClicked",false)
			end
			WindowPoints = 0
			removeEventHandler("onClientRender",root,dxDrawKinobalken)
		end,750,1)
		if(getElementData(localPlayer,"InRakete") ~= true)then
			setElementAlpha(localPlayer,255)
		end
		if(isElement(CJSkinshop.ped))then
			destroyElement(CJSkinshop.ped)
			removeEventHandler("onClientRender",root,CJSkinshop.rotate)
			setCameraTarget(localPlayer)
		end
		setPlayerHudComponentVisible("radar",true)
		
		if(getElementData(localPlayer,"InTuninggarage") == true)then
			triggerServerEvent("Tuningsystem.spawnVorGarage",localPlayer)
			unbindKey("arrow_r","down",Tuningsystem.bindKeyRight)
			unbindKey("arrow_l","down",Tuningsystem.bindKeyLeft)
		end
	end
end
addEvent("setWindowDatas",true)
addEventHandler("setWindowDatas",root,setWindowDatas)

-- [[ KINOBALKEN ]] --

function dxDrawKinobalken()
	if(KinobalkenState == true)then
		if(WindowPoints < 35)then
			WindowPoints = WindowPoints + 1
		end
	elseif(KinobalkenState == false)then
		if(WindowPoints > 0)then
			WindowPoints = WindowPoints - 1
		end
	end
	dxDrawRectangle(0*(x/1440), 0*(y/900), 1440*(x/1440), WindowPoints*(y/900), tocolor(0, 0, 0, 255), false)
	dxDrawRectangle(0*(x/1440), 900*(y/900), 1440*(x/1440), - WindowPoints*(y/900), tocolor(0, 0, 0, 255), false)
end

-- [[ ÜBERGANG ]] --

function dxDrawLoadscreen()
	if(loadscreenAlpha < 255)then loadscreenAlpha = loadscreenAlpha + 1 end
    dxDrawText(loc("cMain_2"), x * 0.3424, y * 0.4667, x * 0.6576, y * 0.5333, tocolor(255, 255, 255, loadscreenAlpha), 1.50, "pricedown", "center", "center", false, false, false, false, false)
    dxDrawText(loc("cMain_3"):format(loadscreenFakt), x * 0.3493, y * 0.5444, x * 0.6507, y * 0.6100, tocolor(255, 255, 255, loadscreenAlpha), 1.20, "default-bold", "center", "center", false, true, false, false, false)
end

addEvent("createLoadscreen",true)
addEventHandler("createLoadscreen",root,function()
	if(isWindowOpen())then
		loadscreenFakt = Fakten[math.random(1,#Fakten)]
		loadscreenAlpha = 0
		fadeCamera(false)
		addEventHandler("onClientRender",root,dxDrawLoadscreen)
		fadeElementInterior = true
		
		setTimer(function()
			fadeCamera(true)
			removeEventHandler("onClientRender",root,dxDrawLoadscreen)
			fadeElementInterior = false
		end,3000,1)
	end
end)

-- [[ ROTATION FINDEN ]] --

function findRotation(x1,y1,x2,y2)
	local t = -math.deg(math.atan2(x2-x1,y2-y1))
	return t < 0 and t + 360 or t
end

-- [[ IS PED AIMING? ]] --

function isPedAiming ( thePedToCheck )
	if isElement(thePedToCheck) then
		if getElementType(thePedToCheck) == "player" or getElementType(thePedToCheck) == "ped" then
			if getPedTask(thePedToCheck, "secondary", 0) == "TASK_SIMPLE_USE_GUN" then
				return true
			end
		end
	end
	return false
end

-- [[ SOUND ABSPIELEN ]] --

function newPlaySound(file)
	playSound("Files/Sounds/"..file)
end
addEvent("newPlaySound",true)
addEventHandler("newPlaySound",root,newPlaySound)

-- [[ CONVERT NUMBER ]] --

function formatNumber(number)
	while true do
		number,k = string.gsub(number,"^(-?%d+)(%d%d%d)", '%1,%2')
		if(k == 0)then
			break
		end
	end
	return number
end