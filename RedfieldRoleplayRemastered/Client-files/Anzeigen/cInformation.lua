-- [[ DIE ANZEIGE ]] --

function Information.renderDxDraw()
	if(isWindowOpen())then
		if(not(isPlayerMapVisible(localPlayer)))then
			if(fileExists("Files/Images/HUD/Info.png"))then
				dxDrawRectangle(1116*(x/1440), 307*(y/900), 314*(x/1440), 62*(y/900), tocolor(17, 17, 17, 200), false)
				dxDrawText(Information.text, 1182*(x/1440), 317*(y/900), 1420*(x/1440), 359*(y/900), tocolor(255, 255, 255, 255), 1.00*(x/1440), "default-bold", "center", "center", false, true, false, false, false)
				dxDrawImage(1126*(x/1440), 317*(y/900), 46*(x/1440), 42*(y/900), "Files/Images/HUD/Info.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
			end
		end
	end
end

-- [[ DIE ANZEIGE EINBLENDEN / AUSBLENDEN ]] --

function Information.dxDraw(text,type)
	if(text)then Information.text = text end
	if(type)then
		if(type == "create")then
			if(Information.render == false)then
				addEventHandler("onClientRender",root,Information.renderDxDraw)
				Information.render = true
			end
		else
			removeEventHandler("onClientRender",root,Information.renderDxDraw)
			Information.render = false
		end
	end
end
addEvent("Information.dxDraw",true)
addEventHandler("Information.dxDraw",root,Information.dxDraw)