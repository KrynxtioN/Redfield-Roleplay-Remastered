-- [[ MARKER ERSTELLEN ]] --

local result = dbPoll(dbQuery(handler,"SELECT * FROM tankstellen"),-1)

if(#result >= 1)then
	for i,v in pairs(result)do
		local marker = createMarker(v["Tankmarkerx"],v["Tankmarkery"],v["Tankmarkerz"],"cylinder",3,255,0,0,25)
		setElementData(marker,"TankstellenName",v["Name"])
		
		addEventHandler("onMarkerHit",marker,function(player)
			if(getElementType(player) == "vehicle")then
				local player = getVehicleOccupant(player,0)
				if(getElementDimension(player) == getElementDimension(source))then
					if(getPedOccupiedVehicleSeat(player) == 0)then
						local Name = getElementData(source,"TankstellenName")
						triggerClientEvent(player,"Tankstellen.openWindow",player,getPlayerData("tankstellenshop","Name",Name,"Liter"),getPlayerData("tankstellenshop","Name",Name,"LiterPreis"))
						setElementData(player,"TankstellenName",Name)
					end
				end
			end
		end)
	end
end

-- [[ TANKEN ]] --

addEvent("Tankstellen.server",true)
addEventHandler("Tankstellen.server",root,function(type,liter)
	local kosten = false
	local hasEnoughMoney = false
	local liter = tonumber(liter)
	local veh = getPedOccupiedVehicle(client)
	
	local Name = getElementData(client,"TankstellenName")
	
	local volltanken = 100 - getElementData(veh,"Benzin")
	local old = getPlayerData("tankstellenshop","Name",Name,"Liter")
	local preis = getPlayerData("tankstellenshop","Name",Name,"LiterPreis")
	
	if(type == "Volltanken")then
		if(volltanken >= 1)then
			if(getPlayerData("business","Databasename",Name,"Besitzer") ~= "Niemand")then
				if(old < volltanken)then
					infobox(client,loc(client,"Fahrzeugsystem_134"),"error")
					return false
				end
			end
			kosten = volltanken*preis
			if(hasMoney(client,kosten))then
				liter = volltanken
				hasEnoughMoney = true
			end
		else infobox(client,loc(client,"Fahrzeugsystem_135"),"error")end
	else
		if(liter <= volltanken)then
			if(getPlayerData("business","Databasename",Name,"Besitzer") ~= "Niemand")then
				if(old < liter)then
					infobox(client,loc(client,"Fahrzeugsystem_136"),"error")
					return false
				end
			end
			kosten = liter*preis
			if(hasMoney(client,liter*preis))then
				liter = liter
				hasEnoughMoney = true
			end
		else infobox(client,loc(client,"Fahrzeugsystem_137"),"error")end
	end
	
	if(kosten ~= false and hasEnoughMoney == true)then
		setElementData(veh,"Tankvorgang",true)
		if(isTimer(Tankstellen[client]))then killTimer(Tankstellen[client])end
		Tankstellen[client] = setTimer(function(client,veh,Name,old,liter)
			setElementData(veh,"Tankvorgang",false)
			if(isElement(client))then
				if(hasMoney(client,kosten))then
					if(getPlayerData("business","Databasename",Name,"Besitzer") ~= "Niemand")then
						dbExec(handler,"UPDATE tankstellenshop SET Liter = '"..old-liter.."' WHERE Name = '"..Name.."'")
						addBizKasse(Name,kosten)
					end
					takeMoney(client,kosten)
					local veh = getPedOccupiedVehicle(client)
					setElementData(veh,"Benzin",getElementData(veh,"Benzin")+liter)
					infobox(client,loc(client,"Fahrzeugsystem_138"),"info")
					setElementFrozen(veh,false)
					setPlayerAchievement(client,22)
				end
			end
		end,liter*150,1,client,veh,Name,old,liter)
		infobox(client,loc(client,"Fahrzeugsystem_139"),"info")
		triggerClientEvent(client,"setWindowDatas",client)
		outputLog(getPlayerName(client).." hat für $"..kosten.." getankt.","Fahrzeugsystem")
		setTimer(function(client)
			if(isElement(client))then
				setElementFrozen(getPedOccupiedVehicle(client),true)
			end
		end,50,1,client)
	end
end)