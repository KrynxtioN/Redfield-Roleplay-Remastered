local ShowBeduerfnisse = true
local HUDRender = false

-- [[ HUD COMPONENTEN AUSBLENDEN ]] --

for _,v in pairs(Components)do setPlayerHudComponentVisible(v,false)end

-- [[ DAS HUD ]] --

function dxDrawHUD()
	if(isWindowOpen() and not(isPlayerMapVisible(localPlayer)))then
		if(fileExists("Files/Images/HUD/Waffen/1337.png"))then
			local Money = getElementData(localPlayer,"Geld")
			local Health,Armor = getElementHealth(localPlayer),getPedArmor(localPlayer)
			local Wanteds = getElementData(localPlayer,"Wanteds")
			local time = getRealTime()
			local minute,hour = time.minute,time.hour
			if(minute < 10)then minute = "0"..minute end
			if(hour < 10)then hour = "0"..hour end
			local px,py,pz = getElementPosition(localPlayer)
			local Zone = getZoneName(px,py,pz)
			if(getElementData(localPlayer,"Lobby") ~= "Reallife")then Money = 0 end

			dxDrawRectangle(1116*(x/1440), 10*(y/900), 314*(x/1440), 21*(y/900), tocolor(17, 17, 17, 255), false)
			dxDrawText(time.monthday.. "." ..time.month+1 .. "." ..time.year+1900 ..", "..hour.. ":" ..minute.." "..loc("Anzeigen_4").." - "..Zone, 1116*(x/1440), 10*(y/900), 1430*(x/1440), 31*(y/900), tocolor(255, 255, 255, 255), 1.00*(x/1440), "default-bold", "center", "center", false, false, false, false, false) -- Uhrzeit und Ort
			dxDrawRectangle(1116*(x/1440), 31*(y/900), 314*(x/1440), 116*(y/900), tocolor(17, 17, 17, 175), false)
			dxDrawImage(1338*(x/1440), 41*(y/900), 82*(x/1440), 73*(y/900), "Files/Images/HUD/Waffen/"..tostring(getPedWeapon(localPlayer))..".png", 0, 0, 0, tocolor(255, 255, 255, 255), false) -- Waffen-Icon
			dxDrawText(getPedAmmoInClip(localPlayer).." - "..getPedTotalAmmo(localPlayer) - getPedAmmoInClip(localPlayer), 1338*(x/1440), 117*(y/900), 1420*(x/1440), 130*(y/900), tocolor(255, 255, 255, 255), 1.00*(x/1440), "default-bold", "center", "center", false, false, false, false, false) -- Munitionsanzeige
			dxDrawRectangle(1116*(x/1440), 151*(y/900), 314*(x/1440), 26*(y/900), tocolor(17, 17, 17, 175), false)
			dxDrawImage(1126*(x/1440), 41*(y/900), 25*(x/1440), 23*(y/900), "Files/Images/HUD/Health.png", 0, 0, 0, tocolor(255, 255, 255, 255), false) -- Leben
			dxDrawImage(1126*(x/1440), 74*(y/900), 25*(x/1440), 23*(y/900), "Files/Images/HUD/Armor.png", 0, 0, 0, tocolor(255, 255, 255, 255), false) -- Weste
			dxDrawImage(1126*(x/1440), 107*(y/900), 25*(x/1440), 23*(y/900), "Files/Images/HUD/Oxygen.png", 0, 0, 0, tocolor(255, 255, 255, 255), false) -- Oxygen
			dxDrawRectangle(1161*(x/1440), 41*(y/900), 167*(x/1440), 13*(y/900), tocolor(255, 0, 0, 255), false)
			dxDrawRectangle(1161*(x/1440), 54*(y/900), 167*(x/1440), 10*(y/900), tocolor(195, 0, 0, 255), false)
			dxDrawText(math.floor(Health).."%", 1161*(x/1440), 41*(y/900), 1328*(x/1440), 64*(y/900), tocolor(255, 255, 255, 255), 1.00*(x/1440), "default-bold", "center", "center", false, false, false, false, false)
			dxDrawRectangle(1161*(x/1440), 74*(y/900), 167*(x/1440), 13*(y/900), tocolor(100, 100, 100, 255), false)
			dxDrawRectangle(1161*(x/1440), 87*(y/900), 167*(x/1440), 10*(y/900), tocolor(79, 79, 79, 255), false)
			dxDrawRectangle(1161*(x/1440), 107*(y/900), 167*(x/1440), 13*(y/900), tocolor(0, 57, 186, 255), false)
			dxDrawRectangle(1161*(x/1440), 120*(y/900), 167*(x/1440), 10*(y/900), tocolor(0, 49, 161, 255), false)
			dxDrawText(math.floor(Armor).."%", 1161*(x/1440), 74*(y/900), 1328*(x/1440), 97*(y/900), tocolor(255, 255, 255, 255), 1.00*(x/1440), "default-bold", "center", "center", false, false, false, false, false)
			dxDrawText(math.floor(getPedOxygenLevel(localPlayer)/10).."%", 1161*(x/1440), 107*(y/900), 1328*(x/1440), 130*(y/900), tocolor(255, 255, 255, 255), 1.00*(x/1440), "default-bold", "center", "center", false, false, false, false, false)
			dxDrawText("   $"..formatNumber(Money), 1116*(x/1440), 151*(y/900), 1430*(x/1440), 177*(y/900), tocolor(0, 255, 0, 255), 1.20*(x/1440), "default-bold", "center", "center", false, false, false, false, false) -- Geld
			
			if(Wanteds and Wanteds >= 1)then
				dxDrawImage(1116*(x/1440), 151*(y/900), 30*(x/1440), 26*(y/900), "Files/Images/HUD/Wanted.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
				dxDrawText(Wanteds, 1116*(x/1440), 151*(y/900), 1146*(x/1440), 177*(y/900), tocolor(0, 0, 0, 255), 1.00*(x/1440), "default-bold", "center", "center", false, false, false, false, false)
			end
			
			if(ShowBeduerfnisse == true and getElementData(localPlayer,"Lobby") == "Reallife")then
				local Hunger,Harndrang,Energie = getElementData(localPlayer,"Hunger"),getElementData(localPlayer,"Harndrang"),getElementData(localPlayer,"Energie")
				if(Hunger <= 15)then Hunger = loc("Anzeigen_5") else Hunger = Hunger.."%" end
				if(Harndrang >= 85)then Harndrang = loc("Anzeigen_6") else Harndrang = Harndrang.."%" end
				if(Energie <= 15)then Energie = loc("Anzeigen_7") else Energie = Energie.."%" end
				local Level = getElementData(localPlayer,"Level")+1
				local nextLevel = Levelsystem.needExp*Level
				local Erfahrungspunkte = getElementData(localPlayer,"Erfahrungspunkte")
			
				dxDrawRectangle(1231*(x/1440), 181*(y/900), 199*(x/1440), 26*(y/900), tocolor(17, 17, 17, 175), false)
				dxDrawRectangle(1231*(x/1440), 211*(y/900), 199*(x/1440), 26*(y/900), tocolor(17, 17, 17, 175), false)
				dxDrawRectangle(1231*(x/1440), 241*(y/900), 199*(x/1440), 26*(y/900), tocolor(17, 17, 17, 175), false)
				dxDrawRectangle(1241*(x/1440), 187*(y/900), 179*(x/1440), 14*(y/900), tocolor(0, 0, 0, 255), false) -- Hunger
				dxDrawRectangle(1241*(x/1440), 247*(y/900), 179*(x/1440), 14*(y/900), tocolor(0, 0, 0, 255), false) -- Energie
				dxDrawRectangle(1241*(x/1440), 217*(y/900), 179*(x/1440), 14*(y/900), tocolor(0, 0, 0, 255), false) -- Harndrang
				dxDrawRectangle(1241*(x/1440), 217*(y/900), 179*getElementData(localPlayer,"Harndrang")/100*(x/1440), 14*(y/900), tocolor(255, 255, 0, 255), false) -- Harndrang
				dxDrawRectangle(1241*(x/1440), 247*(y/900), 179*getElementData(localPlayer,"Energie")/100*(x/1440), 14*(y/900), tocolor(253, 90, 1, 255), false) -- Energie
				dxDrawRectangle(1241*(x/1440), 187*(y/900), 179*getElementData(localPlayer,"Hunger")/100*(x/1440), 14*(y/900), tocolor(0, 255, 0, 255), false) -- Hunger
				dxDrawImage(1192*(x/1440), 181*(y/900), 29*(x/1440), 26*(y/900), "Files/Images/HUD/Food.png", 0, 0, 0, tocolor(255, 255, 255, 255), false) -- Hunger
				dxDrawImage(1192*(x/1440), 211*(y/900), 29*(x/1440), 26*(y/900), "Files/Images/HUD/Harndrang.png", 0, 0, 0, tocolor(255, 255, 255, 255), false) -- Harndrang
				dxDrawImage(1192*(x/1440), 241*(y/900), 29*(x/1440), 26*(y/900), "Files/Images/HUD/Energie.png", 0, 0, 0, tocolor(255, 255, 255, 255), false) -- Energie
				dxDrawText(Hunger, 1241*(x/1440), 187*(y/900), 1420*(x/1440), 201*(y/900), tocolor(255, 255, 255, 255), 1.00*(x/1440), "default-bold", "center", "center", false, false, false, false, false) -- Hunger
				dxDrawText(Harndrang, 1241*(x/1440), 217*(y/900), 1420*(x/1440), 231*(y/900), tocolor(255, 255, 255, 255), 1.00*(x/1440), "default-bold", "center", "center", false, false, false, false, false) -- Harndrang
				dxDrawText(Energie, 1241*(x/1440), 247*(y/900), 1420*(x/1440), 261*(y/900), tocolor(255, 255, 255, 255), 1.00*(x/1440), "default-bold", "center", "center", false, false, false, false, false) -- Energie
				dxDrawRectangle(1231*(x/1440), 271*(y/900), 199*(x/1440), 26*(y/900), tocolor(17, 17, 17, 175), false)
				dxDrawImage(1192*(x/1440), 271*(y/900), 29*(x/1440), 26*(y/900), "Files/Images/HUD/Erfahrungspunkte.png", 0, 0, 0, tocolor(255, 255, 255, 255), false) -- Energie
				dxDrawRectangle(1241*(x/1440), 277*(y/900), 179*(x/1440), 14*(y/900), tocolor(0, 0, 0, 255), false) -- Erfahrungspunkte
				dxDrawRectangle(1241*(x/1440), 277*(y/900), 179*getElementData(localPlayer,"Erfahrungspunkte")/nextLevel*(x/1440), 14*(y/900), tocolor(172, 5, 178, 255), false) -- Erfahrungspunkte
				dxDrawText(Erfahrungspunkte.."/"..nextLevel, 1241*(x/1440), 277*(y/900), 1420*(x/1440), 291*(y/900), tocolor(255, 255, 255, 255), 1.00*(x/1440), "default-bold", "center", "center", false, false, false, false, false) -- Erfahrungspunkte
			end
				
			for _,v in pairs(Components)do setPlayerHudComponentVisible(v,false)end
		end
	end
end

-- [[ EVENT ZUM LADEN DES HUDS ]] --

function dxDrawHUDFunction()
	if(HUDRender == false)then
		addEventHandler("onClientRender",root,dxDrawHUD)
		HUDRender = true
	end
end
addEvent("dxDrawHUD",true)
addEventHandler("dxDrawHUD",root,dxDrawHUDFunction)

-- [[ BEDÜRFNISSE EIN- UND AUSBLENDEN ]] --

bindKey("b","down",function()
	if(isWindowOpen() and not(isPlayerMapVisible(localPlayer)))then
		if(ShowBeduerfnisse == false)then
			ShowBeduerfnisse = true
		else
			ShowBeduerfnisse = false
		end
	end
end)