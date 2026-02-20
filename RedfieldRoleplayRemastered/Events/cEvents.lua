local startRender = nil
local function drawBirthdayBalloons()
	local ax,ay = interpolateBetween(0,1000,0,0,-1400,0,(getTickCount() - startRender)/15000,"OutQuad")
	for i = 1,5 do
		dxDrawImage(0 + (i-1)*300*(x/1440), ay*(y/900) , 235*(x/1440), 333*(y/900), "Events/Files/Birthday/Balloon.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
	end
end

function drawBirthdayBalloons()
	if(fileExists("Events/Files/Birthday/yay.mp3"))then
		startRender = getTickCount()
		addEventHandler("onClientRender",root,drawBirthdayBalloons)
		playSound("Events/Files/Birthday/yay.mp3")
	else
		setTimer(drawBirthdayBalloons,1000,1)
	end
end
addEvent("drawBirthdayBalloons",true)
addEventHandler("drawBirthdayBalloons",root,drawBirthdayBalloons)