-- [[ BESTELLUNGEN-PICKUP ]] --

Trucker.bestellungen = createPickup(-540.39758300781,-508.56134033203,25.5234375,3,1239,50)

addEventHandler("onPickupHit",Trucker.bestellungen,function(player)
	if(not(isPedInVehicle(player)) and getElementDimension(player) == getElementDimension(source))then
		if(getElementData(player,"Unternehmen") == 4 and isUnternehmenDuty(player))then
			local tbl = {}
			local result = dbPoll(dbQuery(handler,"SELECT * FROM trucker"),-1)
			if(#result >= 1)then
				for _,v in pairs(result)do
					table.insert(tbl,{v["ID"],v["Name"],v["Artikel"],v["Menge"],v["Kosten"],v["Lieferungstyp"]})
				end
			end
			triggerClientEvent(player,"Trucker.openBestellungenWindow",player,tbl)
		end
	end
end)

-- [[ LADEZONEN ]] --

for _,v in pairs(Trucker["Marker"])do
	local marker = createMarker(v[1],v[2],v[3],"cylinder",4,0,0,200,100)
	
	addEventHandler("onMarkerHit",marker,function(player)
		if(getElementType(player) == "vehicle")then
			local player = getVehicleOccupant(player,0)
			if(player)then
				if(getElementData(player,"Unternehmen") == 4 and isUnternehmenDuty(player))then
					local veh = getPedOccupiedVehicle(player)
					if(getElementData(veh,"Besitzer") == "Trucker")then
						local Model = getElementModel(veh)
						local BestellungID = getElementData(player,"TruckerBestellungID")
						if(BestellungID)then
							local Type = Trucker[BestellungID][2]
							local Artikel,Menge = Trucker[BestellungID][3],Trucker[BestellungID][4]
							if(Trucker[BestellungID][6] == false)then
								if(Type == "Kleiner Transport")then
									if(Model == 609 or Model == 456 or Model == 414)then
										infobox(player,loc(player,"Unternehmen_92"),"info")
										Trucker[BestellungID][6] = true
										setElementData(veh,"TruckerBestellungID",BestellungID)
									else infobox(player,loc(player,"Unternehmen_93"),"error")end
								elseif(Type == "Mittlerer Transport")then
									if(Model == 578)then
										infobox(player,loc(player,"Unternehmen_94"),"info")
										Trucker[BestellungID][6] = true
										setElementData(veh,"TruckerBestellungID",BestellungID)
									else infobox(player,loc(player,"Unternehmen_93"),"error")end
								elseif(Type == "Großer Transport")then
									if(Model == 403)then
										local anhaenger = getVehicleTowedByVehicle(veh)
										if(anhaenger)then
											infobox(player,loc(player,"Unternehmen_92"),"info")
											Trucker[BestellungID][6] = true
											setElementData(veh,"TruckerBestellungID",BestellungID)
										else infobox(player,loc(player,"Unternehmen_95"),"error")end
									else infobox(player,loc(player,"Unternehmen_96"),"error")end
								elseif(Type == "Fahrzeugtransport")then
									if(Model == 443)then
										infobox(player,loc(player,"Unternehmen_97"),"info")
										Trucker[BestellungID][6] = true
										setElementData(veh,"TruckerBestellungID",BestellungID)
									else infobox(player,loc(player,"Unternehmen_98"),"error")end
								end
							else infobox(player,loc(player,"Unternehmen_99"),"error")end
						else infobox(player,loc(player,"Unternehmen_100"),"error")end
					end
				end
			end
		end
	end)
end

-- [[ BESTELLUNG BEARBEITEN ]] --

addEvent("Trucker.lieferungBearbeiten",true)
addEventHandler("Trucker.lieferungBearbeiten",root,function(id,type,artikel,menge,name)
	if(not(getElementData(client,"TruckerBestellungID")))then
		local id = tonumber(id)
		if(not(Trucker[id]) or not(Trucker[id][1]))then Trucker[id] = {false,type,artikel,menge,getPlayerName(client),false} end
		if(Trucker[id][1] == false)then
			setElementData(client,"TruckerBestellungID",id)
			setElementData(client,"TruckerBestellungName",name)
			Trucker[id][1] = true
			if(type == "Kleiner Transport")then
				infobox(client,loc(client,"Unternehmen_101"),"info")
			elseif(type == "Mittlerer Transport")then
				infobox(client,loc(client,"Unternehmen_102"),"info")
			elseif(type == "Großer Transport")then
				infobox(client,loc(client,"Unternehmen_103"),"info")
			elseif(type == "Fahrzeugtransport")then
				infobox(client,loc(client,"Unternehmen_104"),"info")
			end
			triggerClientEvent(client,"setWindowDatas",client)
			local x,y,z = getPlayerData("business","Databasename",name,"Spawnx"),getPlayerData("business","Databasename",name,"Spawny"),getPlayerData("business","Databasename",name,"Spawnz")
			triggerClientEvent(client,"Trucker.createBlip",client,"create",x,y,z)
		else infobox(client,loc(client,"Unternehmen_105"):format(Trucker[id][5]),"error")end
	else infobox(client,loc(client,"Unternehmen_106"),"error")end
end)

-- [[ BESTELLUNG ABGEBEN ]] --

addEvent("Trucker.lieferungAbgabe",true)
addEventHandler("Trucker.lieferungAbgabe",root,function()
	local SaveBiz = getElementData(client,"SaveBiz")
	local tabelle = getPlayerData("business","Databasename",SaveBiz,"Tabelle")
	local BestellungID = getElementData(client,"TruckerBestellungID")
	local Artikel,Menge = Trucker[BestellungID][3],Trucker[BestellungID][4]
	
	for _,v in pairs(getElementsByType("vehicle"))do
		if(getElementData(v,"TruckerBestellungID") and getElementData(v,"TruckerBestellungID") == BestellungID)then
			local vx,vy,vz = getElementPosition(v)
			local px,py,pz = getElementData(client,"BizPosX"),getElementData(client,"BizPosY"),getElementData(client,"BizPosZ")
			if(getDistanceBetweenPoints3D(vx,vy,vz,px,py,pz) > 15)then
				infobox(client,loc(client,"Unternehmen_107"),"error")
				return false
			else
				if(getElementModel(v) == 403)then
					local anhaenger = getVehicleTowedByVehicle(v)
					if(not(anhaenger))then
						infobox(client,loc(client,"Unternehmen_108"),"error")
						return false
					end
				end
			end
			break
		end
	end
	
	addToLager(4,"Geld",getPlayerData("trucker","ID",BestellungID,"Kosten"),"unternehmenlager")
	dbExec(handler,"UPDATE "..tabelle.." SET "..Artikel.." = '"..getPlayerData(tabelle,"Name",SaveBiz,Artikel) + Menge.."' WHERE Name = '"..SaveBiz.."'")
	infobox(client,loc(client,"Unternehmen_109"),"info")
	dbExec(handler,"DELETE FROM trucker WHERE ID = '"..BestellungID.."'")
	setElementData(client,"Geld",getElementData(client,"Geld")+500)
	triggerClientEvent(client,"setWindowDatas",client)
	
	Trucker.lieferungAbbrechen(client)
end)

-- [[ WAS PASSIERT, WENN DER SPIELER STIRBT / QUITTET ]] --

function Trucker.lieferungAbbrechen(player)
	local BestellungID = getElementData(player,"TruckerBestellungID")
	if(BestellungID)then
		for _,v in pairs(getElementsByType("vehicle"))do
			if(getElementData(v,"TruckerBestellungID") and getElementData(v,"TruckerBestellungID") == BestellungID)then
				setElementData(v,"TruckerBestellungID",nil)
				break
			end
		end
		Trucker[BestellungID] = {}
	end
	setElementData(player,"TruckerBestellungID",nil)
	setElementData(player,"TruckerBestellungName",nil)
	triggerClientEvent(player,"Trucker.createBlip",player)
end

addEventHandler("onPlayerQuit",root,function() Trucker.lieferungAbbrechen(source) end)
addEventHandler("onPlayerWasted",root,function() Trucker.lieferungAbbrechen(source) end)

-- [[ TRAILER ENTFREEZEN ]] --

addEventHandler("onTrailerAttach",root,function()
	setElementFrozen(source,false)
end)