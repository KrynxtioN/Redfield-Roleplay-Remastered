-- [[ RUNDFAHRTMARKER ERSTELLEN ]] --

function Rundfahrt.createMarker()
	Rundfahrt.id = Rundfahrt.id + 1
	if(Rundfahrt.id > #Rundfahrt["Marker"])then
		fadeCamera(false)
		removeEventHandler("onClientRender",root,Rundfahrt.dxDraw)
		setElementData(localPlayer,"elementClicked",false)
		setTimer(function()
			triggerServerEvent("Rundfahrt.server",localPlayer)
			fadeCamera(true)
			setCameraMatrix(-2644.4426269531,1195.4787597656,68.26416015625,-2717.2998046875,1261.9624023438,51.779697418213)
			smoothMoveCamera(-2644.4426269531,1195.4787597656,68.26416015625,-2717.2998046875,1261.9624023438,51.779697418213,-2688.9123535156,1225.5075683594,58.338687896729,-2715.8754882813,1318.1049804688,31.905750274658,7500)
			
			GUIEditor.window[1] = guiCreateWindow(491, 289, 483, 185, loc("Tutorial_1"), false,"nocross")

			GUIEditor.label[1] = guiCreateLabel(10, 28, 463, 110, loc("Tutorial_2"), false, GUIEditor.window[1])
			GUIEditor.button[1] = guiCreateButton(173, 148, 137, 27, loc("Tutorial_3"), false, GUIEditor.window[1])
			setWindowDatas(1)
			
			addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
				removeCamHandler()
				setWindowDatas()
				triggerServerEvent("Rundfahrt.ende",localPlayer)
				setElementData(localPlayer,"ImIntro",false)
			end,false)
		end,2000,1)
	else
		local tbl = Rundfahrt["Marker"][Rundfahrt.id]
		Rundfahrt.marker = createMarker(tbl[1],tbl[2],tbl[3]-1,"cylinder",4,255,0,0,150)
		Rundfahrt.blip = createBlip(tbl[1],tbl[2],tbl[3],0,2,255,0,0)
		setElementDimension(Rundfahrt.marker,getElementDimension(localPlayer))
		setElementDimension(Rundfahrt.blip,getElementDimension(localPlayer))
		if(Rundfahrt.id == 19)then setMarkerColor(Rundfahrt.marker,0,255,0,150)end
		
		addEventHandler("onClientMarkerHit",Rundfahrt.marker,function(player)
			if(player == localPlayer)then
				local x,y,z = getElementPosition(source)
				setElementData(localPlayer,"RundfahrtX",x)
				setElementData(localPlayer,"RundfahrtY",y)
				setElementData(localPlayer,"RundfahrtZ",z)
				Rundfahrt.text = Rundfahrt["Texte"][Rundfahrt.id]
				if(Rundfahrt.id <= 1)then
					addEventHandler("onClientRender",root,Rundfahrt.dxDraw)
				end
				destroyElement(Rundfahrt.marker)
				destroyElement(Rundfahrt.blip)
				Rundfahrt.createMarker()
			end
		end)
	end
end

-- [[ RUNDFAHRTTEXT ]] --

function Rundfahrt.dxDraw()
    dxDrawRectangle(456*(x/1440), 710*(y/900), 529*(x/1440), 180*(y/900), tocolor(17,17,17, 150), false)
    dxDrawRectangle(456*(x/1440), 710*(y/900), 529*(x/1440), 17*(y/900), tocolor(17,17,17, 255), false)
    dxDrawText("Rundfahrt", 456*(x/1440), 710*(y/900), 985*(x/1440), 727*(y/900), tocolor(255, 255, 255, 255), 1.00*(x/1440), "default-bold", "center", "center", false, false, false, false, false)
    dxDrawText(Rundfahrt.text, 466*(x/1440), 737*(y/900), 975*(x/1440), 880*(y/900), tocolor(255, 255, 255, 255), 1.00*(x/1440), "default-bold", "center", "center", false, true, false, false, false)
end

-- [[ RUNDFAHRT ÜBERSPRINGEN ]] --

addEvent("Rundfahrt.skip",true)
addEventHandler("Rundfahrt.skip",root,function()
	setElementData(localPlayer,"elementClicked",false)
	GUIEditor.window[1] = guiCreateWindow(722, 312, 345, 151, loc("Tutorial_4"), false, "nocross")

    GUIEditor.label[1] = guiCreateLabel(10, 27, 325, 83, loc("Tutorial_5"), false, GUIEditor.window[1])
    GUIEditor.button[1] = guiCreateButton(10, 120, 160, 21, loc("Tutorial_6"), false, GUIEditor.window[1])
    GUIEditor.button[2] = guiCreateButton(177, 120, 158, 21, loc("Tutorial_7"), false, GUIEditor.window[1])
	setWindowDatas(1)
		
	addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
		if(isElement(Rundfahrt.marker))then destroyElement(Rundfahrt.marker)end
		if(isElement(Rundfahrt.blip))then destroyElement(Rundfahrt.blip)end
		removeCamHandler()
		setWindowDatas()
		triggerServerEvent("Rundfahrt.server",localPlayer)
		triggerServerEvent("Rundfahrt.ende",localPlayer)
		setElementData(localPlayer,"ImIntro",false)
		setElementData(localPlayer,"elementClicked",true)
	end,false)
	
	addEventHandler("onClientGUIClick",GUIEditor.button[2],function()
		setWindowDatas()
		setElementData(localPlayer,"elementClicked",true)
	end,false)
end)