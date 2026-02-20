-- [[ MOD LADEN ]] --

function loadKKKMod()
	if(fileExists("Files/Mods/KKK.dff"))then
		KKKTXD = engineLoadTXD("Files/Mods/KKK.txd")
		engineImportTXD(KKKTXD,89)
		KKKDFF = engineLoadDFF("Files/Mods/KKK.dff")
		engineReplaceModel(KKKDFF,89)
	else
		setTimer(loadKKKMod,1000,1)
	end
end
setTimer(loadKKKMod,5000,1)

-- [[ PEDS SIND NUR DA, WENN MAN IN DER COLSPHERE IST ]] --

KuKluxKlan.colSphere = createColSphere(-2805.6889648438,-1536.4293212891,139.2890625,250)

addEventHandler("onClientColShapeHit",KuKluxKlan.colSphere,function(player)
	if(player == localPlayer)then
		if(getElementDimension(localPlayer) == getElementDimension(KuKluxKlan.colSphere))then
			KuKluxKlan.createPeds("create")
		end
	end
end)

addEventHandler("onClientColShapeLeave",KuKluxKlan.colSphere,function(player)
	if(player == localPlayer)then
		if(getElementDimension(localPlayer) == getElementDimension(KuKluxKlan.colSphere))then
			KuKluxKlan.createPeds()
		end
	end
end)

-- [[ PEDS ERSTELLEN / LÖSCHEN ]] --

function KuKluxKlan.createPeds(type)
	KuKluxKlan.run = false
	KuKluxKlan.points = 0
	KuKluxKlan.alpha = 255
	for i = 1,#KuKluxKlan["Peds"] do
		if(isElement(KuKluxKlan[i]))then
			destroyElement(KuKluxKlan[i])
		end
	end
	removeEventHandler("onClientPreRender",root,KuKluxKlan.follow)
	if(type)then
		for i,v in ipairs(KuKluxKlan["Peds"])do
			KuKluxKlan[i] = createPed(v[1],v[2],v[3],v[4],v[5])
			addEventHandler("onClientPedDamage",KuKluxKlan[i],function()
				cancelEvent()
			end)
		end
		addEventHandler("onClientPreRender",root,KuKluxKlan.follow)
	end
end

-- [[ PEDS SPIELER FOLGEN LASSEN ]] --

function KuKluxKlan.follow()
	if(hasPlayerBlackSkin())then
		if(isPedOnGround(localPlayer))then
			local x,y,z = getElementPosition(localPlayer)
			for i = 1,#KuKluxKlan["Peds"] do
				local px,py,pz = getElementPosition(KuKluxKlan[i])
				setPedRotation(KuKluxKlan[i],findRotation(px,py,x,y))
				if(getDistanceBetweenPoints3D(px,py,pz,x,y,z) <= 5 or KuKluxKlan.run == true)then
					triggerServerEvent("setPlayerAchievement",localPlayer,localPlayer,10)
					KuKluxKlan.run = true
					setPedRotation(KuKluxKlan[i],findRotation(px,py,x,y))
					setPedControlState(KuKluxKlan[i],"forwards",true)
					setElementAlpha(KuKluxKlan[i],KuKluxKlan.alpha)
				end
				setPedControlState(KuKluxKlan[i],"sprint",true)
			end
			if(KuKluxKlan.run == true)then
				KuKluxKlan.points = KuKluxKlan.points + 1
				if(KuKluxKlan.points >= 200)then
					KuKluxKlan.alpha = KuKluxKlan.alpha - 5
					if(KuKluxKlan.alpha == 0)then
						KuKluxKlan.createPeds()
					end
				end
			end
		end
	end
end

-- [[ HAT SPIELER SCHWARZEN SKIN? ]] --

function hasPlayerBlackSkin()
	local state = false
	for _,v in pairs(KuKluxKlan["BlackSkins"])do
		if(getElementModel(localPlayer) == v)then
			state = true
			break
		end
	end
	return state
end