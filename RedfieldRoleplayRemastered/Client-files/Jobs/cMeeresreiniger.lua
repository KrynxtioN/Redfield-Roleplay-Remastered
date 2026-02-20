-- [[ STARTEN (LEVEL 1) ]] --

addEvent("Meeresreiniger.level1",true)
addEventHandler("Meeresreiniger.level1",root,function()
	triggerServerEvent("Meeresreiniger.start",localPlayer)
end)

-- [[ ELEMENTE ERSTELLEN ]] --

addEvent("Meeresreiniger.createElements",true)
addEventHandler("Meeresreiniger.createElements",root,function()
	Meeresreiniger.clean = 0
	Meeresreiniger.marker = createMarker(2495.1459960938,-2268.8237304688,1.0662608146667,"checkpoint",3,255,0,0)
	Meeresreiniger.blip = createBlip(2495.1459960938,-2268.8237304688,1.0662608146667,0,2,255,0,0)
	
	addEventHandler("onClientMarkerHit",Meeresreiniger.marker,function(player)
		if(player == localPlayer)then
			triggerServerEvent("giveJobMoney",localPlayer,localPlayer,math.floor(Meeresreiniger.clean/100*35))
			Meeresreiniger.clean = 0
			setElementData(localPlayer,"MeeresreinigerPunkte",getElementData(localPlayer,"MeeresreinigerPunkte")+math.floor(Meeresreiniger.clean/100*0.5))
		end
	end)
	
	MeeresreinigerX,MeeresreinigerY,MeeresreinigerZ = getElementPosition(localPlayer)
	Meeresreiniger.timer = setTimer(Meeresreiniger.check,1000,0)
	outputChatBox(loc("Jobs_24"),255,255,255,true)
	
	Information.dxDraw(loc("Jobs_25"):format(math.floor(Meeresreiniger.clean)),"create")
	addEventHandler("onClientRender",root,Meeresreiniger.dxDraw)
end)

-- [[ ELEMENTE ZERSTÖREN ]] --

function Meeresreiniger.finish()
	if(isElement(Meeresreiniger.marker))then
		destroyElement(Meeresreiniger.marker)
		removeEventHandler("onClientRender",root,Meeresreiniger.dxDraw)
		Information.dxDraw(_,"destroy")
	end
	if(isElement(Meeresreiniger.blip))then destroyElement(Meeresreiniger.blip)end
	if(isTimer(Meeresreiniger.timer))then killTimer(Meeresreiniger.timer)end
end
addEvent("Meeresreiniger.finish",true)
addEventHandler("Meeresreiniger.finish",root,Meeresreiniger.finish)

-- [[ MÜLL HINZUFÜGEN ]] --

function Meeresreiniger.check()
	MeeresreinigerXNew,MeeresreinigerYNew,MeeresreinigerZNew = getElementPosition(localPlayer)
	local distance = getDistanceBetweenPoints3D(MeeresreinigerX,MeeresreinigerY,MeeresreinigerZ,MeeresreinigerXNew,MeeresreinigerYNew,MeeresreinigerZNew)
	if(Meeresreiniger.clean <= 10000)then
		Meeresreiniger.clean = Meeresreiniger.clean + (distance/2)
		MeeresreinigerX,MeeresreinigerY,MeeresreinigerZ = MeeresreinigerXNew,MeeresreinigerYNew,MeeresreinigerZNew
		if(Meeresreiniger.clean > 10000)then Meeresreiniger.clean = 10000 end
	end
end

-- [[ MÜLLANZEIGE ]] --

function Meeresreiniger.dxDraw()
	Information.dxDraw(loc("Jobs_25"):format(math.floor(Meeresreiniger.clean)))
end