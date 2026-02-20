-- [[ STARTEN ]] --

addEvent("Boxer.level1",true)
addEvent("Boxer.level2",true)
addEvent("Boxer.level3",true)

addEventHandler("Boxer.level1",root,function() Boxer.start(1)end)
addEventHandler("Boxer.level2",root,function() Boxer.start(2)end)
addEventHandler("Boxer.level3",root,function() Boxer.start(3)end)

function Boxer.start(difficult)
	local dim = getFreeDimension(localPlayer)
	Boxer.ped = createPed(81, 763.03528, 2.42099, 1001.59424)
	setPedStat(Boxer.ped,24,1000)
	setElementHealth(Boxer.ped,Boxer[difficult][2])
	setElementDimension(localPlayer,dim)
	setElementDimension(Boxer.ped,getElementDimension(localPlayer))
	setElementInterior(Boxer.ped,getElementInterior(localPlayer))
	Boxer.walk = Boxer[difficult][3]
	addEventHandler("onClientPreRender",root,Boxer.preRender)
	setElementPosition(localPlayer,758.53174, -1.91252, 1001.59424)
	setElementData(localPlayer,"Boxfight",true)
	Boxer.money = Boxer[difficult][1]
	addEventHandler("onClientPedWasted",Boxer.ped,function()
		Boxer.stopFight("gewonnen")
	end)
end

-- [[ PED KÄMPFEN LASSEN ]] --

function Boxer.preRender()
	local x,y,z = getElementPosition(localPlayer)
	local px,py,pz = getElementPosition(Boxer.ped)
	setPedRotation(Boxer.ped,findRotation(px,py,x,y))
	if(getDistanceBetweenPoints3D(px,py,pz,x,y,z) < 2)then
		setPedControlState(Boxer.ped,"forwards",false)
		setPedControlState(Boxer.ped,"fire",not(getPedControlState(Boxer.ped,"fire")))
	else
		setPedControlState(Boxer.ped,"fire",false)
		setPedControlState(Boxer.ped,"forwards",true)
	end
	setPedControlState(Boxer.ped,"walk",Boxer.walk)
end

-- [[ KAMPF BEENDEN ]] --

function Boxer.stopFight(type,fighting)
	if(isElement(Boxer.ped))then destroyElement(Boxer.ped)end
	setElementData(localPlayer,"Boxfight",false)
	removeEventHandler("onClientPreRender",root,Boxer.preRender)
	if(type ~= "gewonnen")then
		infobox(loc("Jobs_39"),"error")
		triggerServerEvent("Fightstyles.resetFightingstyle",localPlayer)
	else
		infobox(loc("Jobs_40"),"info")
		if(fighting)then
			triggerServerEvent("Fightstyles.saveNewStyle",localPlayer)
		end
		if(not(fighting))then
			setElementData(localPlayer,"Geld",getElementData(localPlayer,"Geld")+Boxer.money)
			setElementPosition(localPlayer,764.71478271484,9.5778760910034,1000.7110595703)
			setElementDimension(localPlayer,1)
			setElementData(localPlayer,"BoxerPunkte",getElementData(localPlayer,"BoxerPunkte")+1)
		end
	end
end
addEvent("Boxer.stopFight",true)
addEventHandler("Boxer.stopFight",root,Boxer.stopFight)