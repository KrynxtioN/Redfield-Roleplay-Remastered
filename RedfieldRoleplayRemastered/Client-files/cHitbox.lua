--[[ BLOODSCREEN ]]--

local Bloodscreen
function createBloodscreen()
	if(fileExists("Files/Images/Bloodscreen.png"))then
		Bloodscreen = guiCreateStaticImage(0,0,1,1,"Files/Images/Bloodscreen.png",true)
		guiSetEnabled(Bloodscreen,false)
		guiSetAlpha(Bloodscreen,0)
	else setTimer(createBloodscreen,1000,1)end
end

function showBloodFlash()
	if(isElement(Bloodscreen))then
		guiSetEnabled(Bloodscreen,true)
		if(isTimer(bloodTimer))then killTimer(bloodTimer)end
		bloodTimer = setTimer(bloodFlash,50,0)
		guiSetAlpha(Bloodscreen,1)
	end
end
addEvent("showBloodFlash",true)
addEventHandler("showBloodFlash",root,showBloodFlash)

function bloodFlash()
	if(isElement(Bloodscreen))then
		guiSetEnabled(Bloodscreen,true)
		if(isTimer(bloodTimer))then killTimer(bloodTimer)end
		bloodTimer = setTimer(function()
			local alpha = guiGetAlpha(Bloodscreen)
			if(alpha == 0)then
				killTimer(bloodTimer)
				guiSetEnabled(Bloodscreen,false)
			else
				guiSetAlpha(Bloodscreen,alpha-0.1)
			end
		end,50,0)
		guiSetAlpha(Bloodscreen,1)
	end
end

--[[ SPIELER KRIEGT DAMAGE ]]--

addEventHandler("onClientPlayerDamage",root,function(attacker,weapon,bodypart,loss)
	if(attacker == localPlayer)then
		if(getElementData(attacker,"Hitsound") == 1)then
			if(source ~= localPlayer)then
				local sound = playSound("Files/Sounds/Hitsound.mp3")
				setSoundVolume(sound,0.3)
			end
		end
		if(weaponDamage[weapon])then
			triggerServerEvent("damageCalcServer",localPlayer,attacker,weapon,bodypart,loss,source)
		end
	end
	if(source == localPlayer)then
		if(not(isPedDead(localPlayer)))then
			showBloodFlash()
		end
		if(weaponDamage[weapon])then cancelEvent()end
	end
end)

--[[ PED KRIEGT DAMAGE ]]--

addEventHandler("onClientPedDamage",root,function()
	if(getElementData(source,"Baustelle") == true or getElementData(source,"Taxiped") == true)then
		cancelEvent()
	end
end)

-- [[ REDDOT ]] --

local reddot = 0

function reddot_func()
	if(reddot == 0)then
		reddot = 1
		addEventHandler("onClientRender",root,reddot_render)
		infobox(loc("Hitbox_1"),"info")
	else
		reddot = 0
		removeEventHandler("onClientRender",root,reddot_render)
		infobox(loc("Hitbox_2"),"error")
	end
end
addCommandHandler("reddot",reddot_func)

function reddot_render()
	local weaponslot = getPedWeaponSlot(localPlayer)
	if(weaponslot and weaponslot <= 7 and weaponslot >= 2)then
		if(getPedControlState(localPlayer,"aim_weapon"))then
			local x1,y1,z1 = getPedWeaponMuzzlePosition(localPlayer)
			x1 = x1 + 0.01
			y1 = y1 + 0.01
			z1 = z1 + 0.01
			local x2,y2,z2 = getPedTargetEnd(localPlayer)
			local x3,y3,z3 = getPedTargetCollision(localPlayer)
			if(x3)then
				dxDrawLine3D(x1,y1,z1,x3,y3,z3,tocolor(255,0,0,150),4,false)
			else
				dxDrawLine3D(x1,y1,z1,x2,y2,z2,tocolor(255,0,0,150),4,false)
			end
		end
	end
end

--//DMG Anzeige
local DMGAnzeigeText

addEvent("showDMGAnzeige",true)
addEventHandler("showDMGAnzeige",root,function(player,damage,koerperteil)
	DMGAnzeigeText = player..", "..damage.." Schaden, "..koerperteil
	if(not(isTimer(DMGAnzeigeTimer)))then
		addEventHandler("onClientRender",root,dxDrawDMGAnzeige)
	end
	if(isTimer(DMGAnzeigeTimer))then killTimer(DMGAnzeigeTimer)end
	DMGAnzeigeTimer = setTimer(function()
		removeEventHandler("onClientRender",root,dxDrawDMGAnzeige)
	end)
end)

function dxDrawDMGAnzeige()
	if(isWindowOpen())then
		dxDrawText(DMGAnzeigeText, 594*(x/1440), 860*(y/900), 847*(x/1440), 890*(y/900), tocolor(255, 255, 255, 255), 1.00*(y/900), "default-bold", "center", "center", false, false, false, false, false)
	end
end