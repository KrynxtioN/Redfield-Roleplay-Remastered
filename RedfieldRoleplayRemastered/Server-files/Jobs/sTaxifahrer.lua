-- [[ FAHRZEUGE ERSTELLEN ]] --

for _,v in pairs(Taxifahrer["Vehicles"])do
	local veh = createVehicle(420,v[1],v[2],v[3],v[4],v[5],v[6],"Taxi")
	setElementData(veh,"Jobfahrzeuge",true)
	
	addEventHandler("onVehicleEnter",veh,function(player)
		if(getPedOccupiedVehicleSeat(player) == 0)then
			if(getElementData(player,"Job") == "Taxifahrer")then
				if(hasPlayerLicense(player,420))then
					setElementData(player,"ImTaxijob",true)
					Taxifahrer.refreshPedPositions(player)
				end
			else
				exitVehicle(player)
				infobox(player,loc(player,"Jobs_94"),"error")
			end
		else
			if(getElementType(player) == "player")then
				Taxifahrer.payTimer[player] = setTimer(function(player,veh)
					local fahrer = getVehicleOccupant(veh,0)
					if(fahrer)then
						if(hasMoney(player,2))then
							takeMoney(player,2)
							setElementData(fahrer,"Geld",getElementData(fahrer,"Geld")+2)
						else
							exitVehicle(player)
							infobox(player,loc(player,"Jobs_95"),"error")
						end
					end
				end,1000,1,player,source)
			end
		end
	end)
	
	addEventHandler("onVehicleExit",veh,function(player)
		Taxifahrer.destroyElements(player,source)
	end)
end

-- [[ PEDS ERSTELLEN ]] --

function Taxifahrer.createPeds()
	for i,v in ipairs(Taxifahrer["Peds"])do
		if(not(isElement(Taxifahrer.peds[i])))then
			Taxifahrer.peds[i] = createPed(100,v[1],v[2],v[3],v[4])
			setElementData(Taxifahrer.peds[i],"Taxiped",true)
			setElementData(Taxifahrer.peds[i],"InTaxi",false)
			setElementData(Taxifahrer.peds[i],"TaxiID",i)
			setElementFrozen(Taxifahrer.peds[i],true)
			
			addEventHandler("onPedWasted",Taxifahrer.peds[i],function()
				for _,v in pairs(getElementsByType("player"))do
					if(getElementData(v,"ImTaxijob") == true)then
						Taxifahrer.refreshPedPositions(v)
					end
				end
			end)
		end
	end
	
	for _,v in pairs(getElementsByType("player"))do
		if(getElementData(v,"ImTaxijob") == true)then
			Taxifahrer.refreshPedPositions(v)
		end
	end
	
	setTimer(Taxifahrer.createPeds,900000,1)
end
setTimer(Taxifahrer.createPeds,2000,1)

function Taxifahrer.refreshPedPositions(player)
	local tbl = {}
	for _,v in pairs(getElementsByType("ped"))do
		if(getElementData(v,"Taxiped") == true and getElementData(v,"InTaxi") == false and not(isPedDead(v)))then
			local x,y,z = getElementPosition(v)
			table.insert(tbl,{getElementData(v,"TaxiID"),x,y,z})
		end
	end
	triggerClientEvent(player,"Taxifahrer.createBlips",player,tbl)
end

addEvent("Taxifahrer.destroyPed",true)
addEventHandler("Taxifahrer.destroyPed",root,function()
	for _,v in pairs(getElementsByType("ped"))do
		if(getElementData(v,"Taxiped") and getElementData(v,"InTaxi") == true)then
			if(getPedOccupiedVehicle(v) == getPedOccupiedVehicle(client))then
				destroyElement(v)
				break
			end
		end
	end
	setElementData(client,"TaxiPedID",nil)
end)

-- [[ ELEMENTE ZERSTÖREN ]] --

function Taxifahrer.destroyElements(player,veh)
	if(isTimer(Taxifahrer.payTimer[player]))then
		killTimer(Taxifahrer.payTimer[player])
	end
	if(getElementData(player,"ImTaxijob") == true)then
		if(veh)then
			respawnVehicle(veh)
		end
	end
	setElementData(player,"ImTaxijob",false)
	triggerClientEvent(player,"Taxifahrer.destroyElements",player)
	if(getElementData(player,"TaxiPedID") ~= nil)then
		local ID = getElementData(player,"TaxiPedID")
		if(isElement(Taxifahrer.peds[ID]))then
			destroyElement(Taxifahrer.peds[ID])
		end
	end
	setElementData(player,"TaxiPedID",nil)
end

-- [[ WAS PASSIERT, WENN DER SPIELER QUITTET / STIRBT ]] --

addEventHandler("onPlayerQuit",root,function() Taxifahrer.destroyElements(source,getPedOccupiedVehicle(source)) end)
addEventHandler("onPlayerWasted",root,function() Taxifahrer.destroyElements(source,getPedOccupiedVehicle(source)) end)