-- [[ INFOBOX ANZEIGEN LASSEN ]] --

function infobox(text,type,r,g,b)
	if(isTimer(infoboxTimer))then killTimer(infoboxTimer)end
	if(infoboxState == false)then
		infoboxState = true
		addEventHandler("onClientRender",root,dxDrawInfobox)
		if(fileExists("Files/Sounds/Infobox.wav"))then
			playSound("Files/Sounds/Infobox.wav")
		end
	end
	infoboxText = text
	if(type == "owncolor")then
		if(not(r) or not(g) or not(b))then r,g,b = 255,255,255 end
		infoboxColor = {r,g,b}
	else
		infoboxColor = {Colors[type][1],Colors[type][2],Colors[type][3]}
	end
	
	infoboxTimer = setTimer(function()
		removeEventHandler("onClientRender",root,dxDrawInfobox)
		infoboxState = false
	end,7500,1)
end
addEvent("infobox",true)
addEventHandler("infobox",root,infobox)

function dxDrawInfobox()
	if(isWindowOpen())then coord = {0,0} else coord = {43,85} end
	if(not(isPlayerMapVisible(localPlayer)))then
		if(fileExists("Files/Images/Infobox.png"))then
			dxDrawImage(542*(x/1440), -2 + coord[1]*(y/900), 356*(x/1440), 179*(y/900), "Files/Images/Infobox.png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
			dxDrawText(infoboxText, 562*(x/1440), 45 + coord[2]*(y/900), 774*(x/1440), 161*(y/900), tocolor(infoboxColor[1],infoboxColor[2],infoboxColor[3], 255), 1.00*(x/1440), "default-bold", "center", "center", false, true, true, false, false)
		end
	end
end