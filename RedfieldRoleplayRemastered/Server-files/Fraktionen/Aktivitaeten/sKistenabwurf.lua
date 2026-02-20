-- [[ KISTE ERSTELLEN ]] --

setTimer(function()
	if(not(isElement(Kistenabwurf.chest)))then
		local rnd = math.random(1,#Kistenabwurf["Pos"])
		local tbl = Kistenabwurf["Pos"][rnd]
		local x,y,z = tbl[1],tbl[2],tbl[3]
		createBreakingNews("Fraktionen_168")
		Kistenabwurf.blip = createBlip(x,y,z,41)
		Kistenabwurf.chestSchirm = createObject(2903,x,y,z + 1000)
		Kistenabwurf.chest = createObject(3577,x,y,z + 1000)
		Kistenabwurf.sphere = createColSphere(x,y,z + 1,4)
		moveObject(Kistenabwurf.chest,60000,x,y,z)
		moveObject(Kistenabwurf.chestSchirm,60000,x,y,z + 6.7)
		setTimer(function()
			destroyElement(Kistenabwurf.blip)
		end,15000,1)
		setTimer(function()
			destroyElement(Kistenabwurf.chestSchirm)
		end,60000,1)
		addEventHandler("onColShapeHit",Kistenabwurf.sphere,Kistenabwurf.giveItems)
	end
end,3600000,0)

-- [[ KISTE EINSAMMELN ]] --

function Kistenabwurf.giveItems(player)
	if(not(isPedInVehicle(player)))then
		local waffe = math.random(1,#Kistenabwurf["Waffen"])
		local item = math.random(1,#Kistenabwurf["Items"])
		giveWeapon(player,Kistenabwurf["Waffen"][waffe][2],Kistenabwurf["Waffen"][waffe][3],true)
		setElementData(player,Kistenabwurf["Items"][item][3],getElementData(player,Kistenabwurf["Items"][item][3])+Kistenabwurf["Items"][item][2])
		infobox(player,loc(player,"Fraktionen_169"):format(Kistenabwurf["Waffen"][waffe][3],Kistenabwurf["Waffen"][waffen][1],Kistenabwurf["Items"][item][2],Kistenabwurf["Items"][item][1]),"info")
		Kistenabwurf.destroy()
	end
end

-- [[ ELEMENTE ZERSTÖREN ]] --

function Kistenabwurf.destroy()
	if(isElement(Kistenabwurf.blip))then destroyElement(Kistenabwurf.blip)end
	if(isElement(Kistenabwurf.sphere))then destroyElement(Kistenabwurf.sphere)end
	if(isElement(Kistenabwurf.chest))then destroyElement(Kistenabwurf.chest)end
end