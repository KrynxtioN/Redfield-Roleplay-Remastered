function Waffenschein.onClientPlayerWeaponFireFunc(weapon,ammo,ammoInClip,hitX,hitY,hitZ,hitElement)
	if getElementData(localPlayer, "isInShootingRange") == true then
		if(isElement(hitElement))then
			if(getElementData(hitElement, "target") == true)then
				if(getElementData(hitElement, "hitAble") == true)then
					triggerServerEvent("Waffenschein.onTargetHit",localPlayer,hitElement)
				end
			end
		end
	else
	end
end
addEventHandler("onClientPlayerWeaponFire",localPlayer,Waffenschein.onClientPlayerWeaponFireFunc)

function Waffenschein.showStats(type)
	if(type == "create")then
		addEventHandler("onClientRender",root,Waffenschein.drawTime)
	else
		removeEventHandler("onClientRender",root,Waffenschein.drawTime)
	end
end
addEvent("Waffenschein.showShootingsStats", true)
addEventHandler("Waffenschein.showShootingsStats", getRootElement(), Waffenschein.showStats)

function Waffenschein.drawTime()
	if(isWindowOpen())then
		local hits = getElementData(localPlayer, "hits")
		local totalammo2 = getPedTotalAmmo(localPlayer)
		local acc = math.floor(hits*100/(250-totalammo2))

		if(hits > 0)then
			dxDrawText(loc("Systeme_133"):format(hits,acc), 1244*(x/1440), 243*(y/900), 1430*(x/1440), 295*(y/900), tocolor(0, 0, 0, 255), 1.50*(x/1440), "default-bold", "center", "center", false, false, false, false, false)
			dxDrawText(loc("Systeme_134"):format(hits,acc), 1244*(x/1440), 243*(y/900), 1430*(x/1440), 295*(y/900), tocolor(255, 255, 255, 255), 1.50*(x/1440), "default-bold", "center", "center", false, false, false, false, false)
		end
	end
end

addEventHandler("onClientPlayerDamage",localPlayer,function()
	if(getElementData(localPlayer,"isInShootingRange") == true)then
		cancelEvent()
	end
end)