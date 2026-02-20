-- [[ DER HACKPROZESS ]] --

addEvent("Wantedcard.client",true)
addEventHandler("Wantedcard.client",root,function(type)
	if(isTimer(Wantedcard.timer))then killTimer(Wantedcard)end
	Wantedcard.points = 0
	if(Wantedcard.state == true)then
		Wantedcard.state = false
		removeEventHandler("onClientRender",root,Wantedcard.dxDraw)
	end
	if(type)then
		Wantedcard.state = true
		addEventHandler("onClientRender",root,Wantedcard.dxDraw)
		Wantedcard.timer = setTimer(function()
			Wantedcard.points = Wantedcard.points + 1
		end,250,100)
	end
end)

-- [[ ANZEIGE ]] --

function Wantedcard.dxDraw()
	if(isWindowOpen()) and not(isPlayerMapVisible(localPlayer))then
		local x,y,z = getElementPosition(getPedOccupiedVehicle(localPlayer))
		local sx,sy = getScreenFromWorldPosition(x,y,z+1.7,1000,true)
		dxDrawText(Wantedcard.points.."%",sx-2,sy+73,sx,sy,tocolor(255,255,255,255),0.8,"default-bold","center","center",false,false,true,false,false)
		dxDrawRectangle(sx-70,sy+28,137,16,tocolor(0,8,13,255),false)
		dxDrawRectangle(sx-70,sy+28,(1.37*Wantedcard.points),16,tocolor(200,25,0,255),false)
	end
end