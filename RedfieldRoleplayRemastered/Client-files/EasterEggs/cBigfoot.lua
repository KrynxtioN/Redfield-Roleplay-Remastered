-- [[ MOD LADEN ]] --

function loadBigfootMod()
	if(fileExists("Files/Mods/Bigfoot.dff"))then
		BigfootTXD = engineLoadTXD("Files/Mods/Bigfoot.txd")
		engineImportTXD(BigfootTXD,10)
		BigfootDFF = engineLoadDFF("Files/Mods/Bigfoot.dff")
		engineReplaceModel(BigfootDFF,10)
	else
		setTimer(loadBigfootMod,1000,1)
	end
end
setTimer(loadBigfootMod,5000,1)

-- [[ PEDS SIND NUR DA, WENN MAN IN DER COLSPHERE IST ]] --

Bigfoot.colSphere = createColSphere(189.44557189941,-539.62188720703,47.085060119629,250)

addEventHandler("onClientColShapeHit",Bigfoot.colSphere,function(player)
	if(player == localPlayer)then
		if(getElementDimension(localPlayer) == getElementDimension(Bigfoot.colSphere))then
			Bigfoot.createPeds("create")
		end
	end
end)

addEventHandler("onClientColShapeLeave",Bigfoot.colSphere,function(player)
	if(player == localPlayer)then
		if(getElementDimension(localPlayer) == getElementDimension(Bigfoot.colSphere))then
			Bigfoot.createPeds()
		end
	end
end)

-- [[ PEDS ERSTELLEN / LÖSCHEN ]] --

function Bigfoot.createPeds(type)
	Bigfoot.run = false
	Bigfoot.points = 0
	Bigfoot.alpha = 255
	for i = 1,#Bigfoot["Peds"] do
		if(isElement(Bigfoot[i]))then
			destroyElement(Bigfoot[i])
		end
	end
	removeEventHandler("onClientPreRender",root,Bigfoot.follow)
	if(type)then
		for i,v in ipairs(Bigfoot["Peds"])do
			Bigfoot[i] = createPed(v[1],v[2],v[3],v[4],v[5])
			addEventHandler("onClientPedDamage",Bigfoot[i],function()
				cancelEvent()
			end)
		end
		addEventHandler("onClientPreRender",root,Bigfoot.follow)
	end
end

-- [[ PEDS SPIELER FOLGEN LASSEN ]] --

function Bigfoot.follow()
	triggerServerEvent("setPlayerAchievement",localPlayer,localPlayer,8)
	local x,y,z = getElementPosition(localPlayer)
	for i = 1,#Bigfoot["Peds"] do
		local px,py,pz = getElementPosition(Bigfoot[i])
		if(getDistanceBetweenPoints3D(px,py,pz,x,y,z) <= 2.5 or Bigfoot.run == true)then
			Bigfoot.run = true
			setPedRotation(Bigfoot[i],findRotation(px,py,x,y))
			setPedControlState(Bigfoot[i],"forwards",true)
			setPedControlState(Bigfoot[i],"fire",true)
			setElementAlpha(Bigfoot[i],Bigfoot.alpha)
		end
		setPedControlState(Bigfoot[i],"sprint",true)
	end
	if(Bigfoot.run == true)then
		Bigfoot.points = Bigfoot.points + 1
		if(Bigfoot.points >= 200)then
			Bigfoot.alpha = Bigfoot.alpha - 5
			if(Bigfoot.alpha == 0)then
				Bigfoot.createPeds()
			end
		end
	end
end