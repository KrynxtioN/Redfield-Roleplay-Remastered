local ShowBlacklist = true

addEvent("loadPlayerWithWanteds",true)
addEventHandler("loadPlayerWithWanteds",root,function()
	WantedsBlacklistScroll = 0
	PlayerWithWanteds = {}
	for _,v in pairs(getElementsByType("player"))do
		if(getElementData(v,"loggedin") == 1)then
			if(getElementData(v,"Wanteds") >= 1)then
				table.insert(PlayerWithWanteds,{getPlayerName(v),getElementData(v,"Wanteds")})
			end
		end
	end
	unbindKey("mouse_wheel_up","down",WantedsBlacklistScrollUp)
	unbindKey("mouse_wheel_down","down",WantedsBlacklistScrollDown)
	bindKey("mouse_wheel_up","down",WantedsBlacklistScrollUp)
	bindKey("mouse_wheel_down","down",WantedsBlacklistScrollDown)
end)

addEvent("loadPlayerOnBlacklist",true)
addEventHandler("loadPlayerOnBlacklist",root,function(blacklist)
	WantedsBlacklistScroll = 0
	PlayerOnBlacklist = blacklist
	unbindKey("mouse_wheel_up","down",WantedsBlacklistScrollUp)
	unbindKey("mouse_wheel_down","down",WantedsBlacklistScrollDown)
	bindKey("mouse_wheel_up","down",WantedsBlacklistScrollUp)
	bindKey("mouse_wheel_down","down",WantedsBlacklistScrollDown)
end)

function WantedsBlacklistScrollDown()
	if(isWindowOpen())then
		if(isCursorOnElement(1081*(x/1280), 429*(y/1024), 189*(x/1280), 248*(y/1024)))then
			if(PlayerWithWanteds and WantedsBlacklistScroll <= #PlayerWithWanteds-11 or PlayerOnBlacklist and WantedsBlacklistScroll <= #PlayerOnBlacklist-11)then
				WantedsBlacklistScroll = WantedsBlacklistScroll + 1
			end
		end
	end
end

function WantedsBlacklistScrollUp()
	if(isWindowOpen())then
		if(isCursorOnElement(1081*(x/1280), 429*(y/1024), 189*(x/1280), 248*(y/1024)))then
			if(WantedsBlacklistScroll <= 1)then
				WantedsBlacklistScroll = 0
			else
				WantedsBlacklistScroll = WantedsBlacklistScroll - 1
			end
		end
	end
end

addEventHandler("onClientRender",root,function()
	if(getElementData(localPlayer,"loggedin") == 1 and isWindowOpen())then
		local Faction = tonumber(getElementData(localPlayer,"Fraktion"))
		if(Faction > 0)then
			if(Faction == 1 and getElementData(localPlayer,"FDuty") == true or Faction == 2 and getElementData(localPlayer,"FDuty") == true or Faction == 3 and getElementData(localPlayer,"FDuty") == true)then
				local ID = 0
				if(PlayerWithWanteds and #PlayerWithWanteds >= 1)then
					dxDrawRectangle(1081*(x/1280), 429*(y/1024), 189*(x/1280), 248*(y/1024), tocolor(17, 17, 17, 175), false)
					dxDrawText(loc("Fraktionen_97"), 1091*(x/1280), 439*(y/1024), 1260*(x/1280), 456*(y/1024), tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
					for i = 1 + WantedsBlacklistScroll,12 + WantedsBlacklistScroll do
						if(PlayerWithWanteds[i])then
							dxDrawText(PlayerWithWanteds[i][1].." - "..PlayerWithWanteds[i][2].." Wanteds", 1091*(x/1280), 466 + (ID*17)*(y/1024), 1260*(x/1280), 488 + (ID*17)*(y/1024), tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "center", false, false, false, false, false)
							ID = ID + 1
						end
					end
				end
			elseif(Faction == 4 or Faction == 6 or Faction == 7 or Faction == 8 or Faction == 9)then
				if(ShowBlacklist == true)then
					local ID = 0
					if(PlayerOnBlacklist and #PlayerOnBlacklist >= 1)then
						dxDrawRectangle(1081*(x/1280), 429*(y/1024), 189*(x/1280), 248*(y/1024), tocolor(17, 17, 17, 175), false)
						dxDrawText(loc("Fraktionen_98"), 1091*(x/1280), 439*(y/1024), 1260*(x/1280), 456*(y/1024), tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
						for i = 1 + WantedsBlacklistScroll,11 + WantedsBlacklistScroll do
							if(PlayerOnBlacklist[i])then
								dxDrawText(PlayerOnBlacklist[i], 1091*(x/1280), 466 + (ID*17)*(y/1024), 1260*(x/1280), 488 + (ID*17)*(y/1024), tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "center", false, false, false, false, false)
								ID = ID + 1
							end
						end
					end
				end
			end
		end
	end
end)

addCommandHandler("showblacklist",function()
	if(ShowBlacklist == true)then	
		ShowBlacklist = false
	else
		ShowBlacklist = true
	end
end)