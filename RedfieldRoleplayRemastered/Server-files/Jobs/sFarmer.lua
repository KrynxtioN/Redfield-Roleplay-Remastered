-- [[ MARKER ERSTELLEN ]] --

function Farmer.load()
	for _,v in pairs(Farmer["Fahrzeuge"])do
		Farmer.vehicle = createVehicle(v[1],v[2],v[3],v[4],v[5],v[6],v[7])
		setElementFrozen(Farmer.vehicle,true)
		setVehicleColor(Farmer.vehicle,71,45,23)
		setElementData(Farmer.vehicle,"FarmerOwner","nil")
		setElementData(Farmer.vehicle,"Jobfahrzeuge",true)
		
		addEventHandler("onVehicleEnter",Farmer.vehicle,function(player)
			if(getPedOccupiedVehicleSeat(player) == 0)then
				if(getElementData(player,"Job") == "Farmer")then
					if(hasPlayerLicense(player,getElementModel(source)))then
						setElementData(player,"ImFarmerjob",true)
						setElementFrozen(source,false)
						setElementData(source,"FarmerOwner",getPlayerName(player))
						triggerClientEvent(player,"Farmer.createMarker",player,"create")
						triggerClientEvent(player,"Information.dxDraw",player,Farmer["Texte"][getElementModel(source)],"create")
					end
				else
					exitVehicle(player)
					infobox(player,loc(player,"Jobs_44"),"error")
				end
			end
		end)
		
		addEventHandler("onVehicleExit",Farmer.vehicle,function(player)
			if(getElementData(player,"ImFarmerjob") == true)then
				Farmer.destroy(player)
			end
		end)
	end
	
	for i,v in pairs(Farmer["Marker"])do
		Farmer.marker = createMarker(v[1],v[2],v[3],"cylinder",3,255,0,0,0)
		setElementData(Farmer.marker,"FarmerID",i)
		setElementData(Farmer.marker,"FarmerType","Heuballen")
		Farmer.heuballen = createObject(1454,v[1],v[2],v[3] + 0.9,0,0,0)
		setElementData(Farmer.heuballen,"FarmerID",i)
		setElementCollisionsEnabled(Farmer.heuballen,false)
		
		addEventHandler("onMarkerHit",Farmer.marker,function(player)
			if(getElementType(player) == "vehicle")then
				local player = getVehicleOccupant(player,0)
				local FarmerID = getElementData(source,"FarmerID")
				local x,y,z = getElementPosition(player)
				local sx,sy,sz = getElementPosition(source)
				
				if(getElementData(source,"FarmerType") == "Heuballen")then
					if(not(isElement(Farmer.ball[player])))then
						if(getElementModel(getPedOccupiedVehicle(player)) == 478)then
							for _,v in pairs(getElementsByType("object"))do
								if(getElementModel(v) == 1454)then
									if(getElementData(v,"FarmerID") == FarmerID)then
										destroyElement(v)
									end
								end
							end
							setElementData(source,"FarmerType","Leer")
							Farmer.ball[player] = createObject(1454,x,y,z,0,0,0)
							setElementCollisionsEnabled(Farmer.ball[player],false)
							attachElements(Farmer.ball[player],getPedOccupiedVehicle(player),0,-1.5,0.8)
							
							for _,v in pairs(getElementsByType("marker"))do
								if(getElementData(v,"FarmerID"))then
									if(getElementData(v,"FarmerID") == FarmerID)then
										setElementAlpha(v,255)
									end
								end
							end
						end
					else infobox(player,loc(player,"Jobs_45"),"error")end
				elseif(getElementData(source,"FarmerType") == "Weizen")then
					if(getElementModel(getPedOccupiedVehicle(player)) == 532)then
						giveJobMoney(player,4)
						setElementData(source,"FarmerType","Heuballen")
						for _,v in pairs(getElementsByType("object"))do
							if(getElementModel(v) == 818)then
								if(getElementData(v,"FarmerID") == FarmerID)then
									destroyElement(v)
								end
							end
						end
						Farmer.heuballen = createObject(1454,sx,sy,sz + 0.9,0,0,0)
						setElementCollisionsEnabled(Farmer.heuballen,false)
						setElementData(Farmer.heuballen,"FarmerID",FarmerID)
						setElementData(player,"FarmerPunkte",getElementData(player,"FarmerPunkte")+1)
					end
				elseif(getElementData(source,"FarmerType") == "Leer")then
					if(getElementModel(getPedOccupiedVehicle(player)) == 531)then
						giveJobMoney(player,6)
						setElementData(source,"FarmerType","Weizen")
						Farmer.weizen = createObject(818,sx,sy,sz,0,0,0)
						setElementData(Farmer.weizen,"FarmerID",FarmerID)
						for _,v in pairs(getElementsByType("marker"))do
							if(getElementData(v,"FarmerID"))then
								if(getElementData(v,"FarmerID") == FarmerID)then
									setElementAlpha(v,0)
								end
							end
						end
						setElementData(player,"FarmerPunkte",getElementData(player,"FarmerPunkte")+1)
					end
				end
			end
		end)
	end
end
Farmer.load()

-- [[ ABGABE ]] --

addEvent("Farmer.abgabe",true)
addEventHandler("Farmer.abgabe",root,function()
	local veh = getPedOccupiedVehicle(client)
	if(isElement(Farmer.ball[client]))then
		destroyElement(Farmer.ball[client])
		giveJobMoney(client,250)
		setElementData(player,"FarmerPunkte",getElementData(player,"FarmerPunkte")+1)
	else infobox(client,loc(client,"Jobs_46"),"error")end
end)

-- [[ ELEMENTE ZERSTÖREN ]] --

function Farmer.destroy(player)
	if(getElementData(player,"ImFarmerjob") == true)then
		triggerClientEvent(player,"Information.dxDraw",player,_,"destroy")
	end
	triggerClientEvent(player,"Farmer.createMarker",player)
	if(isElement(Farmer.ball[player]))then destroyElement(Farmer.ball[player])end
	for _,v in pairs(getElementsByType("vehicle"))do
		if(getElementData(v,"FarmerOwner") == getPlayerName(player))then
			respawnVehicle(v)
			setElementFrozen(v,true)
			setElementData(v,"FarmerOwner","nil")
		end
	end
	setElementData(player,"ImFarmerjob",false)
end

-- [[ WAS PASSIERT, WENN SPIELER STIRBT / QUITTET ]] --

addEventHandler("onPlayerQuit",root,function() Farmer.destroy(source)end)
addEventHandler("onPlayerWasted",root,function() Farmer.destroy(source)end)