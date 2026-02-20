function Waffenschein.warpPlayerIntoGunlicensePruefung(player)
	local id = 0
	for i,v in ipairs(Waffenschein["Spawnpositions"])do
		if(v[4] == false)then
			v[4] = true
			id = i
			break
		end
	end
	if(id > 0)then
		local tbl = Waffenschein["Spawnpositions"][id]
		setElementPosition(player,tbl[1],tbl[2],tbl[3])
		setPedRotation(player,270)
		setElementInterior(player,0)
		setElementFrozen(player,true)
		takeAllWeapons(player)
		setElementData(player,"isInShootingRange",true)
		setElementData(player,"hits",0)
		giveWeapon(player,24,250,true)
		triggerClientEvent(player,"Waffenschein.showShootingsStats",player,"create")
		setElementData(player,"ShootingrangeID",id)
		infobox(player,loc(player,"Systeme_275"),"info")
	end
end

function Waffenschein.calcTargetsSpeed(element, tY)
	local x, y, z = getElementPosition ( element )
	local distance = getDistanceBetweenPoints2D ( x, tY, x, y )
	
	local speed = distance*200
	
	return speed, x, z
end

function Waffenschein.onTargetHit(object)
	if not isElement(object) then return false end
	if client ~= source then return false end
	if getElementData(object, "hitAble")==false then return false end
	setElementData(object, "hitAble", true)
	
	local times = getRealTime()
	local hits = getElementData(source, "hits")
	if hits == nil then hits = 0 end
	if hits == false then hits = 0 end
	hits = hits + 1
	
	if(hits == 30)then
		local time = times.timestamp-getElementData(source, "sTime")
		local totalammo2 = getPedTotalAmmo(source)	
		local acc = math.floor(30*100/(250-totalammo2))
		if(acc >= 80)then
			infobox(source,loc(source,"Systeme_276"):format(hits,acc),"info")
			setElementData(source,"WaffenscheinPraxis",1)
		else
			infobox(source,loc(source,"Systeme_277"):format(hits,acc),"error")
		end
		setElementData(source,"isInShootingRange",false)
		Waffenschein["Spawnpositions"][getElementData(source,"ShootingrangeID")][4] = false
		setElementData(source,"ShootingrangeID",nil)
		triggerClientEvent(source,"Waffenschein.showShootingsStats",source,"destroy")
		takeAllWeapons(source)
		setElementPosition(source,242.50312805176,118.03457641602,1003.21875)
		setPedRotation(source,180)
		setElementInterior(source,10)
		setElementFrozen(source,false)
	elseif(hits == 1)then
		setElementData(source, "sTime", times.timestamp)
		setElementData(source, "hits", hits)
	else
		setElementData(source, "hits", hits)
	end
	
	local x, y, z = getElementPosition ( object )
	stopObject(object)
	moveObject(object, 200, x, y, z, 90)
	setTimer(Waffenschein.reactivateTarget, 2000, 1, object)
	killTimer(getElementData(object, "timer"))
	setElementData(object, "hitAble", false)
end
addEvent("Waffenschein.onTargetHit", true)
addEventHandler("Waffenschein.onTargetHit", getRootElement(), Waffenschein.onTargetHit)

function Waffenschein.reactivateTarget(object)
	if not isElement(object) then return false end
	local x, y, z = getElementPosition ( object )
	stopObject(object)
	moveObject(object, 200, x, y, z, -90)
	setTimer(Waffenschein.moveTargetOtherSide, 201, 1, object, math.random(0,1))
	setTimer(setElementData, 202, 1, object, "hitAble", true)
end

function Waffenschein.moveTargetOtherSide(object, side)
	if not isElement(object) then return false end
	if(side == 1)then
		local moveTime, x, z = Waffenschein.calcTargetsSpeed(object, -2457)
		stopObject(object)
		moveObject(object, moveTime, x,  -2457, z)
		moveTime = moveTime - math.random(1,1000)
		if moveTime < 50 then moveTime = 50 end
		local timer = setTimer(Waffenschein.moveTargetOtherSide, moveTime, 1, object, 0)
		setElementData(object, "timer", timer)
	else
		local moveTime, x, z = Waffenschein.calcTargetsSpeed(object, -2478)
		stopObject(object)
		moveObject(object, moveTime, x,  -2478, z)
		
		moveTime = moveTime - math.random(1,1000)
		if moveTime<50 then moveTime = 50 end
		local timer = setTimer(Waffenschein.moveTargetOtherSide, moveTime, 1, object, 1)
		setElementData(object, "timer", timer)
	end
end

local target = {}
function addTargets()
	if(isElement(target[0]))then killTargets() end
		
	target[0] = createObject(1585, -7163.3999023438, -2466.1000976562, 31.39999961853, 0, 0, 90)
	target[1] = createObject(1585, -7180.7001953125, -2462.1999511719, 31.39999961853, 0, 0, 90)
	target[2] = createObject(1585, -7169.8999023438, -2465.1000976562, 31.39999961853, 0, 0, 90)
	target[3] = createObject(1585, -7176.8999023438, -2465.1000976562, 31.39999961853, 0, 0, 90)
	target[4] = createObject(1585, -7165.7001953125, -2462.1999511719, 31.39999961853, 0, 0, 90)
	target[5] = createObject(1585, -7170.3999023438, -2466.1000976562, 31.39999961853, 0, 0, 90)
		
	for i = 0, 5, 1 do 
		Waffenschein.moveTargetOtherSide(target[i], math.random(0,1))
		setElementData(target[i], "target", true)
		setElementData(target[i], "hitAble", true)
	end
end
addTargets()

function killTargets()
	for i = 0, 5, 1 do 
		local timer = getElementData(target[i], "timer")
		if(isTimer(timer))then killTimer(timer) end
		
		setElementData(target[i], "target", nil)
		setElementData(target[i], "hitAble", nil)
		destroyElement(target[i])
	end
end

function Waffenschein.resetPosition(player)
	local ShootingrangeID = getElementData(player,"ShootingrangeID")
	if(ShootingrangeID and ShootingrangeID ~= nil)then
		Waffenschein["Spawnpositions"][ShootingrangeID][4] = false
		setElementData(player,"ShootingrangeID",nil)
	end
end

addEventHandler("onPlayerQuit",root,function() Waffenschein.resetPosition(source) end)
addEventHandler("onPlayerWasted",root,function() Waffenschein.resetPosition(source) end)