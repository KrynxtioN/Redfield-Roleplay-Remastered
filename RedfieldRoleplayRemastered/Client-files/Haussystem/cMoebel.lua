-- [[ MÖBEL IM INTERIOR DEAKTIVIEREN ]] --

for i = 1, 4 do setInteriorFurnitureEnabled(i, false)end

-- [[ OBJEKT ERSTELLEN ]] --

function Moebel.createObject(model)
	if(isElement(Moebel.object))then
		setElementModel(Moebel.object,model)
	else
		local x,y,z = getElementPosition(localPlayer)
		Moebel.object = createObject(model,x,y,z)
		setElementDoubleSided(Moebel.object,true)
		setElementInterior(Moebel.object,getElementInterior(localPlayer))
		setElementDimension(Moebel.object,getElementDimension(localPlayer))
		setElementCollisionsEnabled(Moebel.object,false)
		setElementDoubleSided(Moebel.object,true)
		
		bindKey("backspace","down",Moebel.beenden)
		addEventHandler("onClientKey",root,Moebel.moveObject)
		bindKey("lshift","down",Moebel.shift)
		Moebel.text = loc("Haussystem_28")
		addEventHandler("onClientRender",root,Moebel.information)
		bindKey("enter","down",Moebel.platzieren)
		setElementFrozen(localPlayer,true)
	end
end

-- [[ OBJEKT BEWEGEN ]] --

function Moebel.moveObject(button,press)
	if(press and button)then
		local x,y,z = getElementPosition(Moebel.object)
		local rx,ry,rz = getElementRotation(Moebel.object)

		if(button == "pgup")then
			setElementPosition(Moebel.object,x,y,z+Moebel.cord)
		elseif(button == "pgdn")then
			setElementPosition(Moebel.object,x,y,z-Moebel.cord)
		elseif(button == "mouse_wheel_up")then
			setElementRotation(Moebel.object,rx,ry,rz+1)
		elseif(button == "mouse_wheel_down")then
			setElementRotation(Moebel.object,rx,ry,rz-1)
		elseif(button == "arrow_u")then
			setElementPosition(Moebel.object,x,y+Moebel.cord,z)
		elseif(button == "arrow_d")then
			setElementPosition(Moebel.object,x,y-Moebel.cord,z)
		elseif(button == "arrow_l")then
			setElementPosition(Moebel.object,x-Moebel.cord,y,z)
		elseif(button == "arrow_r")then
			setElementPosition(Moebel.object,x+Moebel.cord,y,z)
		end
	end
end

function Moebel.shift()
	if(Moebel.cord == 0.1)then Moebel.cord = 0.01 else Moebel.cord = 0.1 end
end

-- [[ BEENDEN ]] --
function Moebel.beenden()
	destroyElement(Moebel.object)
	unbindKey("backspace","down",Moebel.beenden)
	setCameraTarget(localPlayer)
	setElementFrozen(localPlayer,false)
	setElementAlpha(localPlayer,255)
	removeEventHandler("onClientRender",root,Moebel.rotate)
	removeEventHandler("onClientRender",root,Moebel.information)
	unbindKey("backspace","down",Moebel.beenden)
	removeEventHandler("onClientKey",root,Moebel.moveObject)
	unbindKey("lshift","down",Moebel.shift)
	unbindKey("enter","down",Moebel.platzieren)
	unbindKey("arrow_r","down",Moebel.right)
	unbindKey("arrow_l","down",Moebel.left)
	unbindKey("enter","down",Moebel.buy)
	setWindowDatas()
end

-- [[ OBJEKT IM SHOP ANZEIGEN ]] --

addEvent("Moebel.showObject",true)
addEventHandler("Moebel.showObject",root,function()
	Moebel.id = 1
	setWindowDatas(_,"keinblur")
	Moebel.object = createObject(Moebel["Moebel"][Moebel.id][1],1404.4140625,-1625.1745605469,15.563164710999,0,0,0)
	setElementAlpha(Moebel.object,255)
	setElementDoubleSided(Moebel.object,true)
	setCameraMatrix(1404.2889404297,-1614.6159667969,15.194399833679,1404.3015136719,-1615.6146240234,15.144135475159)
	setElementAlpha(localPlayer,0)
	bindKey("arrow_r","down",Moebel.right)
	bindKey("arrow_l","down",Moebel.left)
	bindKey("enter","down",Moebel.buy)
	bindKey("backspace","down",Moebel.beenden)
	setElementFrozen(localPlayer,true)
	addEventHandler("onClientRender",root,Moebel.rotate)
	addEventHandler("onClientRender",root,Moebel.information)
	Moebel.text = loc("Haussystem_29"):format(Moebel["Moebel"][Moebel.id][2],Moebel.preis)
end)

-- [[ OBJEKT PLATZIEREN ]] --

function Moebel.platzieren()
	local x,y,z = getElementPosition(Moebel.object)
	local rx,ry,rz = getElementRotation(Moebel.object)
	triggerServerEvent("Moebel.platzieren",localPlayer,getElementModel(Moebel.object),x,y,z,rz,getElementData(localPlayer,"MoebelName"))
	Moebel.beenden()
end

-- [[ MÖBELN WECHSELN ]] --

function Moebel.right()
	if(Moebel.id < #Moebel["Moebel"])then
		Moebel.id = Moebel.id + 1
		setElementModel(Moebel.object,Moebel["Moebel"][Moebel.id][1])
		Moebel.text = loc("Haussystem_29"):format(Moebel["Moebel"][Moebel.id][2],Moebel.preis)
		setElementAlpha(Moebel.object,255)
	end
end

function Moebel.left()
	if(Moebel.id > 1)then
		Moebel.id = Moebel.id - 1
		setElementModel(Moebel.object,Moebel["Moebel"][Moebel.id][1])
		Moebel.text = loc("Haussystem_29"):format(Moebel["Moebel"][Moebel.id][2],Moebel.preis)
		setElementAlpha(Moebel.object,255)
	end
end

-- [[ KAUFEN ]] --

function Moebel.buy()
	triggerServerEvent("Moebel.buy",localPlayer,Moebel["Moebel"][Moebel.id][1],Moebel["Moebel"][Moebel.id][2])
end

-- [[ OBJEKT ROTIEREN ]] --

function Moebel.rotate()
	local x,y,z = getElementRotation(Moebel.object)
	setElementRotation(Moebel.object,0,0,z+1)
end

-- [[ PREIS ANZEIGEN UND AKTUALISIEREN ]] --

function Moebel.information()
    dxDrawText(Moebel.text, 399*(x/1440), 46*(y/900), 1037*(x/1440), 134*(y/900), tocolor(255, 255, 255, 255), 1.20*(x/1440), "default-bold", "center", "center", false, false, false, false, false)
end

addEvent("Moebel.refreshPreis",true)
addEventHandler("Moebel.refreshPreis",root,function(preis)
	Moebel.preis = preis
end)