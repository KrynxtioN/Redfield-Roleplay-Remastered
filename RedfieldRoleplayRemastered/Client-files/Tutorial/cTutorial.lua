-- [[ NÄCHSTE TUTORIALAUFGABE ANZEIGEN ]] --

local render = false

function Tutorial.createNextTask()
	if(isElement(Tutorial.blip))then destroyElement(Tutorial.blip)end
	local TutorialTask = getElementData(localPlayer,"TutorialTask")
	if(TutorialTask < #Tutorial)then
		local tbl = Tutorial[tonumber(TutorialTask)]
		if(tbl[3] and tbl[4] and tbl[5])then
			Tutorial.blip = createBlip(tbl[3],tbl[4],tbl[5],0,2,255,255,0)
		end
		if(render == false)then
			render = true
			addEventHandler("onClientRender",root,Tutorial.dxDraw)
		end
	else
		if(getElementData(localPlayer,"TutorialFinished") == 0)then
			infobox(loc("Tutorial_9"),"info")
			removeEventHandler("onClientRender",root,Tutorial.dxDraw)
			setElementData(localPlayer,"TutorialFinished",1)
			setElementData(localPlayer,"Handy",1)
			setElementData(localPlayer,"Sammelkartenalbum",1)
			setElementData(localPlayer,"Craftingpanel",1)
			triggerServerEvent("setPlayerStatus",localPlayer,localPlayer,1)
			triggerServerEvent("setPlayerAchievement",localPlayer,localPlayer,2)
			triggerServerEvent("givePlayerHandynummer",localPlayer,localPlayer)
		end
	end
end
addEvent("Tutorial.createNextTask",true)
addEventHandler("Tutorial.createNextTask",root,Tutorial.createNextTask)

function Tutorial.dxDraw()
	if(isWindowOpen() and not(isPlayerMapVisible(localPlayer)) and Payday.state == false and Job.info == false)then
        dxDrawRectangle(10*(x/1440), 399*(y/900), 268*(x/1440), 102*(y/900), tocolor(17, 17, 17, 150), false)
        dxDrawRectangle(10*(x/1440), 399*(y/900), 268*(x/1440), 17*(y/900), tocolor(17, 17, 17, 255), false)
        dxDrawText(loc("Tutorial_12"), 10*(x/1440), 398*(y/900), 278*(x/1440), 416*(y/900), tocolor(255, 255, 255, 255), 1.00*(x/1440), "default-bold", "center", "center", false, false, false, false, false)
        dxDrawText(loc("Tutorial_10"):format(Tutorial[getElementData(localPlayer,"TutorialTask")][1],Tutorial[getElementData(localPlayer,"TutorialTask")][2]), 20*(x/1440), 426*(y/900), 268*(x/1440), 491*(y/900), tocolor(255, 255, 255, 255), 1.00*(x/1440), "default-bold", "center", "center", false, true, false, false, false)
    end
end