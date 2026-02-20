--[[ PEDS ERSTELLEN ]]--

addEvent("Peds.load",true)
addEventHandler("Peds.load",root,function(peds)
	if(#peds >= 1)then
		for i,v in pairs(peds)do
			Peds[i] = {}
			Peds[i].ped = createPed(v[1],v[2],v[3],v[4],v[5])
			Peds[i].colShape = createColCircle(v[2],v[3],v[8])
			setElementInterior(Peds[i].ped,v[6])
			setElementInterior(Peds[i].colShape,v[6])
			setElementDimension(Peds[i].ped,v[7])
			setElementDimension(Peds[i].colShape,v[7])
			setElementFrozen(Peds[i].ped,true)
			setElementData(Peds[i].ped,"Name",v[9])
			setElementData(Peds[i].ped,"PedID",v[13])
			setElementData(Peds[i].ped,"AusraubenMoeglich",0)
			setElementData(Peds[i].ped,"KannAusgeraubtWerden",v[14])
			if(v[12] ~= 0)then
				createBlip(v[2],v[3],v[4],v[12],0,0,0,0,0,0,100)
			end
			
			addEventHandler("onClientPedDamage",Peds[i].ped,function()
				cancelEvent()
			end)
				
			addEventHandler("onClientColShapeHit",Peds[i].colShape,function(player)
				if(player == localPlayer)then
					if(getElementInterior(localPlayer) == getElementInterior(source) and getElementDimension(localPlayer) == getElementDimension(source))then
						if(not(isPedInVehicle(localPlayer)) and isPedOnGround(localPlayer))then
							if(not(getPedAnimation(Peds[i].ped)))then
								setPedAnimation(Peds[i].ped,"PED","IDLE_CHAT")
								if(v[10])then
									if(v[11] == "Server")then
										triggerServerEvent(v[10],localPlayer)
									else
										triggerEvent(v[10],localPlayer)
									end
								end
							end
						end
					end
				end
			end)
				
			addEventHandler("onClientColShapeLeave",Peds[i].colShape,function(player)
				if(player == localPlayer)then
					if(getElementInterior(localPlayer) == getElementInterior(source) and getElementDimension(localPlayer) == getElementDimension(source))then
						setPedAnimation(Peds[i].ped)
					end
				end
			end)
		end
	end
end)

--//Ausrauben
local AusraubenMoney = 0
local LastTarget = nil

addEventHandler("onClientPlayerTarget",root,function(target)
	if(target and isPedAiming(localPlayer))then
		if(getElementType(target) == "ped")then
			if(getPedWeapon(localPlayer) >= 2)then
				local Fraktion = getElementData(localPlayer,"Fraktion")
				if(Fraktion == 6 or Fraktion == 7 or Fraktion == 8 or Fraktion == 9)then
					if(not(isTimer(AusraubenTimer)))then
						if(getElementData(target,"KannAusgeraubtWerden") == 1)then
							if(getElementData(target,"AusraubenMoeglich") == 0)then
								local ID = getElementData(target,"PedID")
								if(isTimer(AusraubenTimer))then killTimer(AusraubenTimer)end
								LastTarget = target
								for _,v in pairs(getElementsByType("player"))do
									if(getElementData(v,"loggedin") == 1)then
										setPedRobanimation(LastTarget)
									end
								end
								AusraubenTimer = setTimer(function()
									local money = math.random(75,125)
									AusraubenMoney = AusraubenMoney + money
									infobox(loc("Peds_1"):format(money),"info")
									setElementData(localPlayer,"Geld",getElementData(localPlayer,"Geld")+money)
									if(AusraubenMoney >= 2500)then
										killTimer(AusraubenTimer)
										infobox(loc("Peds_2"),"error")
										for _,v in pairs(getElementsByType("player"))do
											if(getElementData(localPlayer,"loggedin") == 1)then
												setElementData(LastTarget,"AusraubenMoeglich",1)
												resetPedRobAnimation(LastTarget)
											end
										end
									end
									for _,v in pairs(getElementsByType("player"))do
										if(getElementData(v,"loggedin") == 1)then
											setPedRobanimation(LastTarget)
										end
									end
								end,2500,0)
							else infobox(loc("Peds_3"),"error")end
						end
					end
				end
			end
		end
	else
		if(isTimer(AusraubenTimer))then
			AusraubenMoney = 0
			for _,v in pairs(getElementsByType("player"))do
				if(getElementData(localPlayer,"loggedin") == 1)then
					resetPedRobAnimation(LastTarget)
					setElementData(LastTarget,"AusraubenMoeglich",1)
				end
			end
			killTimer(AusraubenTimer)
		end
		if(LastTarget)then
			for _,v in pairs(getElementsByType("player"))do
				if(getElementData(localPlayer,"loggedin") == 1)then
					resetPedRobAnimation(LastTarget)
					LastTarget = nil
				end
			end
		end
	end
end)

function setPedRobanimation(target)
	if(not(getPedAnimation(target)))then
		setPedAnimation(target,"shop","shp_rob_handsup")
	end
end

function resetPedRobAnimation(target)
	setPedAnimation(target)
end

addEventHandler("onClientPlayerQuit",root,function(player)
	if(player == localPlayer)then
		if(LastTarget)then
			for _,v in pairs(getElementsByType("player"))do
				if(getElementData(localPlayer,"loggedin") == 1)then
					resetPedRobAnimation(LastTarget)
				end
			end
		end
	end
end)

--[[ NAMETAG FÜR PEDS, FAHRZEUGE ETC. ]]--

addEventHandler("onClientRender",root,function()
	-- Fahrzeuge
	if(sellFirmenFahrzeuge and #sellFirmenFahrzeuge >= 1)then
		for _,v in pairs(sellFirmenFahrzeuge)do
			if(getElementDimension(localPlayer) == getElementDimension(v) and getElementInterior(localPlayer) == getElementInterior(v))then
				if(getElementData(v,"Preis") and tonumber(getElementData(v,"Preis")) ~= 0)then
					if(getPedOccupiedVehicle(localPlayer) ~= v)then
						if(isWindowOpen())then
							local px,py,pz = getElementPosition(localPlayer)
							if(getDistanceBetweenPoints3D(px,py,pz,getElementPosition(v)) <= 15)then
								local x,y,z = getElementPosition(v)
								local sx,sy = getScreenFromWorldPosition(x,y,z + 1.7,1000,true)
								if(sx and sy)then
									if(getDistanceBetweenPoints3D(px,py,pz,x,y,z) > 1)then
										scale = 1.5 - (getDistanceBetweenPoints3D(px,py,pz,x,y,z)/70)
									else
										scale = 1.5
									end
									dxDrawText(loc("Peds_4"):format(getElementData(v,"Preis")),sx - 2,sy + 73,sx,sy,tocolor(255,255,255,255),scale,"default-bold","center","center",false,false,true,false,false)
								end
							end
						end
					end
				end
			end
		end
	end
	
	-- Sprunk-Automaten
	for i,v in pairs(Sprunk["Automaten"])do
		if(getElementInterior(localPlayer) == v[7] and getElementDimension(localPlayer) == v[8])then
			if(isWindowOpen())then
				local px,py,pz = getElementPosition(localPlayer)
				local x,y,z = v[1],v[2],v[3]
				if(getDistanceBetweenPoints3D(px,py,pz,x,y,z) <= 5)then
					local sx,sy = getScreenFromWorldPosition(x,y,z + 1.7,1000,true)
					if(sx and sy)then
						if(getDistanceBetweenPoints3D(px,py,pz,x,y,z) > 1)then
							scale = 1.5 - (getDistanceBetweenPoints3D(px,py,pz,x,y,z)/70)
						else
							scale = 1.5
						end
						dxDrawText(loc("Peds_5"):format(Sprunk.dosen,Sprunk.preis),sx - 2,sy + 73,sx,sy,tocolor(255,255,255,255),scale,"default-bold","center","center",false,false,true,false,false)
					end
				end
			end
		end
	end

	-- Peds
	for _,v in pairs(getElementsByType("ped"))do
		if(getElementDimension(localPlayer) == getElementDimension(v) and getElementInterior(localPlayer) == getElementInterior(v))then
			local px,py,pz = getPedBonePosition(v,8)
			local lx,ly,lz = getPedBonePosition(localPlayer,8)
				
			if(getDistanceBetweenPoints3D(px,py,pz,lx,ly,lz) <= 15 and isLineOfSightClear(px,py,pz,lx,ly,lz,true,false,false,true,false))then
				if(getElementData(v,"Name"))then
					if(not(isPedDead(v)))then
						local worldx,worldy = getScreenFromWorldPosition(px,py,pz+0.5,1000,true)
						
						if(getDistanceBetweenPoints3D(px,py,pz,lx,ly,lz) > 1)then
							scale = 0.6 - (getDistanceBetweenPoints3D(px,py,pz,lx,ly,lz)/70)
						else
							scale = 0.6
						end
						
						if(worldx and worldy)then
							if(getElementData(localPlayer,"elementClicked") ~= true or getElementData(v,"IntroPed") == true)then
								dxDrawText(getElementData(v,"Name"),worldx,worldy,worldx,worldy,tocolor(0,0,0),scale,"bankgothic","center","center")
								dxDrawText(getElementData(v,"Name"),worldx-2,worldy-2,worldx,worldy,tocolor(0,255,0),scale,"bankgothic","center","center")
							end
						end
					end
				end
			end
		end
	end
end)

-- [[ FIRMEN FAHRZEUGE ]] --

addEvent("setSellFirmenFahrzeuge",true)
addEventHandler("setSellFirmenFahrzeuge",root,function(tbl)
	sellFirmenFahrzeuge = tbl
end)