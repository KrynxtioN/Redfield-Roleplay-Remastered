-- [[ INTRO BEGINNEN ]] --

function Intro.beginn()
	Intro.lastTick = getTickCount()
	Intro.id = Intro.id + 1
	if(Intro.id > #Intro["Texte"])then
		fadeCamera(false)
		setTimer(function()
			fadeCamera(true)
			setPlayerHudComponentVisible("all",true)
			removeEventHandler("onClientRender",root,Intro.dxDraw)
			setCameraTarget(localPlayer)
			Sequenzen.ende()
		end,1500,1)
	else
		local tbl = Intro["Texte"][Intro.id]
		local cam = Intro["Kamera"][Intro.id]
		if(Intro.id <= 1)then
			setElementData(localPlayer,"ImIntro",true)
			showChat(false)
			addEventHandler("onClientRender",root,Intro.dxDraw)
			setPlayerHudComponentVisible("all",false)
			setCameraMatrix(cam[1],cam[2],cam[3],cam[4],cam[5],cam[6])
			Sequenzen.beginn()
			showChat(false)
		end
		setTimer(function()
			Intro.beginn()
		end,tbl[3],1)
		smoothMoveCamera(cam[1],cam[2],cam[3],cam[4],cam[5],cam[6],cam[7],cam[8],cam[9],cam[10],cam[11],cam[12],tbl[3]-500)
	end
end
addEvent("Intro.beginn",true)
addEventHandler("Intro.beginn",root,Intro.beginn)

-- [[ TEXT ]] --

function Intro.dxDraw()
	local x1,y1,x2 = interpolateBetween(0,0-500,0,0,0,0,(getTickCount()-Intro.lastTick)/(Intro.lastTick+1000-Intro.lastTick),"InOutQuad")
    dxDrawRectangle(0*(x/1440), 0*(y/900), 1440*(x/1440), 127*(y/900), tocolor(0, 0, 0, 255), false)
    dxDrawRectangle(0*(x/1440), 900*(y/900), 1440*(x/1440), -127*(y/900), tocolor(0, 0, 0, 255), false)
	if(Intro["Texte"][Intro.id])then
		dxDrawText(Intro["Texte"][Intro.id][1], 0*(x/1440), y1*(y/900), 1317*(x/1440), 127*(y/900), tocolor(255, 255, 255, 255), 3.00*(x/1440), "arial", "center", "center", false, false, false, false, false)
		--dxDrawImage(1317*(x/1440), y1+10*(y/900), 113*(x/1440), 107*(y/900), "Files/Images/Intro/"..Intro["Texte"][Intro.id][2]..".png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
	end
end