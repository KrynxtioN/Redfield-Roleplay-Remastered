Tiefgaragen = {
	--// x,y,z / Spawn außen: x,y,z,rx, Haus-ID

}
	
if(#Tiefgaragen >= 1)then
	for i,v in ipairs(Tiefgaragen)do
		local object = createObject(7245,-2267.6166992188,1833.9609375,154.76930236816,0,0,0)
		setElementDimension(object,i)
		local gate = createObject(980,-2293.9865722656,1836.1103515625,157.74969482422,0,0,270)
		setElementDimension(object,i)
		local teleporter_rein = createMarker(v[1],v[2],v[3],"cylinder",3,0,0,0,175)
		setElementData(teleporter_rein,"TiefgarageID",i)
		setElementData(teleporter_rein,"HouseID",v[8])
		local teleporter_raus = createMarker(-2286.7983398438,1837.2941894531,152.45449829102,"cylinder",5,0,0,0,175)
		setElementDimension(teleporter_raus,i)
		setElementData(teleporter_raus,"TiefgarageID",i)
		
		addEventHandler("onMarkerHit",teleporter_rein,function(player)
			local ID = getElementData(source,"TiefgarageID")
			local HouseID = getElementData(source,"HouseID")
			if(getElementType(player) == "player")then
				if(getElementDimension(player) == getElementDimension(source))then
					if(Haussystem[HouseID][2] == getPlayerName(player) or isMieter(player,HouseID) == true)then
						setElementPosition(player,-2278.2673339844,1831.9000244141,152.27709960938)
						setPedRotation(player,270)
						setElementDimension(player,ID)
					end
				end
			elseif(getElementType(player) == "vehicle")then
				local player = getVehicleOccupant(player,0)
				local veh = getPedOccupiedVehicle(player)
				if(getElementDimension(veh) == getElementDimension(source))then
					if(Haussystem[HouseID][2] == getPlayerName(player) or isMieter(player,HouseID) == true)then
						setElementPosition(veh,-2271.7355957031,1837.2740478516,152.28410339355)
						setElementRotation(veh,0,0,270)
						setElementDimension(veh,ID)
					end
				end
			end
		end)
		
		addEventHandler("onMarkerHit",teleporter_raus,function(player)
			local ID = getElementData(source,"TiefgarageID")
			local x,y,z,rz = Tiefgaragen[ID][4],Tiefgaragen[ID][5],Tiefgaragen[ID][6],Tiefgaragen[ID][7]
			if(getElementType(player) == "player")then
				if(getElementDimension(player) == getElementDimension(source))then
					setElementPosition(player,x,y,z)
					setPedRotation(player,rz)
					setElementDimension(player,0)
				end
			elseif(getElementType(player) == "vehicle")then
				local player = getVehicleOccupant(player,0)
				local veh = getPedOccupiedVehicle(player)
				if(getElementDimension(veh) == getElementDimension(source))then
					setElementPosition(veh,x,y,z)
					setElementRotation(veh,0,0,rz)
					setElementDimension(veh,0)
				end
			end
		end)
	end
end

-- [[ GATES ]] --

HausGates = {
	--// model,x,y,z,rx,ry,rz, Haus-ID

}

if(#HausGates >= 1)then
	for _,v in pairs(HausGates)do
		local object = createObject(v[1],v[2],v[3],v[4],v[5],v[6],v[7])
		setElementData(object,"HouseID",v[8])
		setElementData(object,"Move",false)
		setElementData(object,"Status","Close")
	end
end

addCommandHandler("gate",function(player)
	for _,v in pairs(getElementsByType("object"))do
		if(getElementData(v,"HouseID"))then
			local HouseID = getElementData(v,"HouseID")
			local x,y,z = getElementPosition(v)
			if(getDistanceBetweenPoints3D(x,y,z,getElementPosition(player)) <= 15)then
				if(Haussystem[HouseID][2] == getPlayerName(player) or isMieter(player,HouseID) == true)then
					if(getElementData(v,"Move") ~= true)then
						setElementData(v,"Move",true)
						local x,y,z = getElementPosition(v)
						if(getElementData(v,"Status") == "Close")then
							moveObject(v,4000,x,y,z-7)
							setElementData(v,"Status","Open")
						else
							moveObject(v,4000,x,y,z+7)
							setElementData(v,"Status","Close")
						end
						setTimer(function(v)
							setElementData(v,"Move",false)
						end,4000,1,v)
					end
					break
				end
			end
		end
	end
end)