-- [[ DAS FENSTER ]] --

addEvent("Restaurants.openWindow",true)
addEventHandler("Restaurants.openWindow",root,function(type)
	if(isWindowOpen())then
		if(getElementInterior(localPlayer) == 5)then
			setElementData(localPlayer,"Restaurant","pizzeria")
			setElementData(localPlayer,"Restaurant2","Pizzeria")
		end
		if(getElementInterior(localPlayer) == 9)then
			setElementData(localPlayer,"Restaurant","cluckinbell")
			setElementData(localPlayer,"Restaurant2","CluckinBell")
		end
		if(getElementInterior(localPlayer) == 10)then
			setElementData(localPlayer,"Restaurant","burgershot")
			setElementData(localPlayer,"Restaurant2","Burgershot")
		end
		if(getElementInterior(localPlayer) == 17)then
			setElementData(localPlayer,"Restaurant","donutladen")
			setElementData(localPlayer,"Restaurant2","Donutladen")
		end
		Restaurants.id = 1
		Restaurants.createObject()
		addEventHandler("onClientRender",root,Restaurants.dxDraw)
		setWindowDatas(_,true)
		setElementAlpha(localPlayer,0)
		bindKey("arrow_l","down",Restaurants.left)
		bindKey("arrow_r","down",Restaurants.right)
		bindKey("enter","down",Restaurants.buy)
		bindKey("backspace","down",Restaurants.close)
	end
end)

-- [[ DEN PREIS ANZEIGEN ]] --

function Restaurants.dxDraw()
	if(Restaurants.preis and Restaurants.lagerbestand)then
		dxDrawText(loc("Shops_56"):format(Restaurants.preis,Restaurants.lagerbestand), 430*(x/1440), 76*(y/900), 1010*(x/1440), 142*(y/900), tocolor(255, 255, 255, 255), 1.50, "default-bold", "center", "center", false, false, false, false, false)
	end
end

-- [[ DAS OBJEKT ERSTELLEN ]] --

function Restaurants.createObject()
	if(isElement(Restaurants.object))then destroyElement(Restaurants.object)end
	local tbl = Restaurants[getElementData(localPlayer,"Restaurant")]
	Restaurants.object = createObject(tbl["Objects"][Restaurants.id],tbl["Position"][1],tbl["Position"][2],tbl["Position"][3],tbl["Position"][4],tbl["Position"][5],tbl["Position"][6])
	setCameraMatrix(tbl["Matrix"][1],tbl["Matrix"][2],tbl["Matrix"][3],tbl["Matrix"][4],tbl["Matrix"][5],tbl["Matrix"][6])
	setElementInterior(Restaurants.object,getElementInterior(localPlayer))
	setElementDimension(Restaurants.object,getElementDimension(localPlayer))
	triggerServerEvent("Restaurants.getDatas",localPlayer,tbl["Objects"][Restaurants.id])
end

-- [[ GERICHT WECHSELN ]] --

addEvent("Restaurants.refreshText",true)
addEventHandler("Restaurants.refreshText",root,function(preis,lager)
	Restaurants.preis = preis
	Restaurants.lagerbestand = lager
end)

function Restaurants.left()
	if(Restaurants.id > 1)then
		Restaurants.id = Restaurants.id - 1
		Restaurants.createObject()
	end
end

function Restaurants.right()
	if(Restaurants.id < 4)then
		Restaurants.id = Restaurants.id + 1
		Restaurants.createObject()
	end
end

-- [[ KAUFEN ]] --

function Restaurants.buy()
	local tbl = Restaurants[getElementData(localPlayer,"Restaurant")]
	triggerServerEvent("Restaurants.buy",localPlayer,Restaurants[getElementData(localPlayer,"Restaurant")]["Objects"][Restaurants.id])
	triggerServerEvent("Restaurants.getDatas",localPlayer,tbl["Objects"][Restaurants.id])
end

-- [[ SCHLIESSEN ]] --

function Restaurants.close()
	setElementAlpha(localPlayer,255)
	setCameraTarget(localPlayer)
	destroyElement(Restaurants.object)
	unbindKey("arrow_l","down",Restaurants.left)
	unbindKey("arrow_r","down",Restaurants.right)
	unbindKey("enter","down",Restaurants.buy)
	unbindKey("backspace","down",Restaurants.close)
	setWindowDatas()
	removeEventHandler("onClientRender",root,Restaurants.dxDraw)
end