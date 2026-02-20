-- [[ KISTE VOM FAHRZEUG SCHMEISSEN ]] --

function Warenhaus.dropCrate(id)
	if(isElement(Warenhaus.crates[id]) and isElement(Warenhaus.vehicle))then
		local x,y,z = getElementVelocity(Warenhaus.vehicle)
		detachElements(Warenhaus.crates[id])
		setElementVelocity(Warenhaus.crates[id],x,y,z + 0.2)
		if(getVehicleOccupant(Warenhaus.vehicle))then
			if(Warenhaus.kisten - 1 > 0)then
				infobox(getVehicleOccupant(Warenhaus.vehicle),loc(getVehicleOccupant(Warenhaus.vehicle),"Fraktionen_200"):format(Warenhaus.kisten - 1),"error")
			else
				infobox(getVehicleOccupant(Warenhaus.vehicle),loc(getVehicleOccupant(Warenhaus.vehicle),"Fraktionen_201"),"error")
			end
		end
		setTimer(function(id)
			if(isElement(Warenhaus.crates[id]))then
				destroyElement(Warenhaus.crates[id])
			end
		end,7500,1,id)
	end
end

-- [[ STARTEN ]] --

addEvent("Warenhaus.start",true)
addEventHandler("Warenhaus.start",root,function()
	if(isEvil(client))then
		if(getStateFactionMemberOnline() >= 2)then
			if(isAktionPause(client))then
				if(isAktionAktiv(client))then
					if(hasMoney(client,5000))then
						takeMoney(client,5000)
						changeAktionAktiv()
						Warenhaus.vehicle = createVehicle(456,1421.7349853516,-1347.0494384766,13.963488578796,0,0,0)
						setVehicleVariant(Warenhaus.vehicle,1,1)
						warpPedIntoVehicle(client,Warenhaus.vehicle)
						infobox(client,loc(client,"Fraktionen_202"),"info")
						for i,v in ipairs(Warenhaus["CratePositions"])do
							Warenhaus.crates[i] = createObject(2912,0,0,0)
							attachElements(Warenhaus.crates[i],Warenhaus.vehicle,v[1],v[2],v[3])
							setObjectScale(Warenhaus.crates[i],1.6)
						end
						Warenhaus.kisten = 8
						triggerClientEvent(client,"setWindowDatas",client)
						triggerClientEvent(client,"Warenhaus.createMarker",client,"marker")
						createBreakingNews("Fraktionen_203")
						outputLog("[Warenhausraub]: "..getPlayerName(client).." hat einen Warenhausraub gestartet.","Fraktionen")
						
						Warenhaus.refreshTimer = setTimer(function()
							Warenhaus.refresh()
						end,1800000,1)
						
						addEventHandler("onVehicleEnter",Warenhaus.vehicle,function(player)
							if(getPedOccupiedVehicleSeat(player) == 0)then
								if(isEvil(player))then
									triggerClientEvent(player,"Warenhaus.createMarker",player,"create")
								end
							end
						end)
						
						addEventHandler("onVehicleExit",Warenhaus.vehicle,function(player)
							triggerClientEvent(player,"Warenhaus.createMarker",player)
						end)
						
						addEventHandler("onVehicleExplode",Warenhaus.vehicle,function(player)
							Warenhaus.refresh()
							createBreakingNews("Fraktionen_204")
						end)
						
						addEventHandler("onVehicleDamage",Warenhaus.vehicle,function(loss)
							local health = tonumber(getElementHealth(source))
							if(health < 300)then id = 0 elseif(health < 400)then id = 1 elseif(health < 500)then id = 2 elseif(health < 600)then id = 3 elseif(health < 700)then id = 4 elseif(health < 800)then id = 5 elseif(health < 900)then id = 6 elseif(health < 1000)then id = 7 end
							
							if(id)then
								if(Warenhaus.kisten > id)then
									Warenhaus.dropCrate(Warenhaus.kisten)
									Warenhaus.kisten = Warenhaus.kisten - 1
								end
							end
						end)
					end
				end
			end
		else infobox(client,loc(client,"Fraktionen_209"),"error")end
	else infobox(client,loc(client,"Fraktionen_205"),"error")end
end)

-- [[ ABGEBEN ]] --

addEvent("Warenhaus.abgabe",true)
addEventHandler("Warenhaus.abgabe",root,function()
	local money = getAktionsMoney(Warenhaus.kisten * 2500)
	infobox(client,loc(client,"Fraktionen_206"):format(Warenhaus.kisten,money),"info")
	addToLager(getElementData(client,"Fraktion"),"Geld",money,"fraktionslager")
	if(Warenhaus.kisten >= 8)then
		outputChatBox(loc(client,"Fraktionen_207"),client,255,255,255,true)
		giveWeapon(client,35,1,true)
	end
	outputLog("[Warenhausraub]: "..getPlayerName(client).." hat den Transporter mit "..Warenhaus.kisten.." abgegeben.","Fraktionen")
	Warenhaus.refresh()
	createBreakingNews("Fraktionen_208")
end)

-- [[ REFRESH ]] --

function Warenhaus.refresh()
	for i = 1,#Warenhaus["CratePositions"] do
		if(isElement(Warenhaus.crates[i]))then
			destroyElement(Warenhaus.crates[i])
		end
	end
	for _,v in pairs(getElementsByType("player"))do
		triggerClientEvent(v,"Warenhaus.createMarker",v)
	end
	if(isElement(Warenhaus.vehicle))then destroyElement(Warenhaus.vehicle)end
	if(isTimer(Warenhaus.refreshTimer))then killTimer(Warenhaus.refreshTimer)end
	changeAktionAktiv()
	changeAktionPause()
end

-- [[ WAS PASSIERT, WENN DER SPIELER STIRBT ]] --

addEventHandler("onPlayerWasted",root,function()
	triggerClientEvent(source,"Warenhaus.createMarker",source)
end)