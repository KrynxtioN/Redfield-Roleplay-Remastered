local sm = {}
sm.moov = 0
sm.object1,sm.object2 = nil,nil
sm.render = false
 
function removeCamHandler()
	if(sm.moov == 1)then
		sm.moov = 0
	end
end
addEvent("removeCamHandler",true)
addEventHandler("removeCamHandler",root,removeCamHandler)
 
function camRender()
	if(sm.moov == 1)then
		local x1,y1,z1 = getElementPosition(sm.object1)
		local x2,y2,z2 = getElementPosition(sm.object2)
		setCameraMatrix(x1,y1,z1,x2,y2,z2)
		sm.render = true
	else
		removeEventHandler("onClientPreRender",root,camRender)
		if(isElement(sm.object1))then destroyElement(sm.object1)end
		if(isElement(sm.object2))then destroyElement(sm.object2)end
		if(isTimer(sm.timer1))then killTimer(sm.timer1)end
		if(isTimer(sm.timer2))then killTimer(sm.timer2)end
		if(isTimer(sm.timer3))then killTimer(sm.timer3)end
		sm.render = false
	end
end
 
function smoothMoveCamera(x1,y1,z1,x1t,y1t,z1t,x2,y2,z2,x2t,y2t,z2t,time)
	if(sm.moov == 1)then return false end
	sm.object1 = createObject(1337,x1,y1,z1)
	sm.object2 = createObject(1337,x1t,y1t,z1t)
	setElementAlpha(sm.object1,0)
	setElementAlpha(sm.object2,0)
	setObjectScale(sm.object1,0.01)
	setObjectScale(sm.object2,0.01)
	moveObject(sm.object1,time,x2,y2,z2,0,0,0,"InOutQuad")
	moveObject(sm.object2,time,x2t,y2t,z2t,0,0,0,"InOutQuad")
	sm.moov = 1
	sm.timer1 = setTimer(removeCamHandler,time,1)
	sm.timer2 = setTimer(destroyElement,time,1,sm.object1)
	sm.timer3 = setTimer(destroyElement,time,1,sm.object2)
	if(sm.render == false)then
		addEventHandler("onClientPreRender",root,camRender)
	end
	return true
end