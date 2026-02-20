-- [[ BREAKING NEWS ]] --

addEvent("createBreakingNews",true)
addEventHandler("createBreakingNews",root,function(text)
	if(isTimer(BreakingNews.timer))then killTimer(BreakingNews.timer)end
	BreakingNews.text = loc(text)
	if(isWindowOpen() and not(isPlayerMapVisible(localPlayer)))then
		if(BreakingNews.state ~= true)then
			addEventHandler("onClientRender",root,BreakingNews.dxDraw)
		end
		BreakingNews.state = true
		BreakingNews.timer = setTimer(function()
			removeEventHandler("onClientRender",root,BreakingNews.dxDraw)
			BreakingNews.state = false
		end,15000,1)
	else outputChatBox("#fa6400[BREAKING NEWS] #ffffff"..BreakingNews.text,255,255,255,true)end
end)

function BreakingNews.dxDraw()
	if(isWindowOpen())then coord = {0,0} else coord = {43,85} end
	if(not(isPlayerMapVisible(localPlayer)))then
		if(fileExists("Files/Images/BreakingNews.png"))then
			dxDrawImage(542*(x/1440), -2 + coord[1]*(y/900), 356*(x/1440), 179*(y/900), "Files/Images/BreakingNews.png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
			dxDrawText(BreakingNews.text, 562*(x/1440), 45 + coord[2]*(y/900), 774*(x/1440), 161*(y/900), tocolor(255,0,0, 255), 1.00*(x/1440), "default-bold", "center", "center", false, true, true, false, false)
		end
	end
end