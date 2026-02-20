-- [[ ITEM BENUTZEN ]] --

local ZigarettenTimer = {}

addEvent("Inventar.use",true)
addEventHandler("Inventar.use",root,function(item)
	if(tonumber(getElementData(client,item)) >= 1)then
		if(item == "Aepfel" or item == "Burger" or item == "Limonade" or item == "Orangen" or item == "Pizza")then
			if(getElementData(client,"Hunger") < 100)then
				if(item ~= "Limonade")then addHunger(client,50) else playerDrink(client) end
				infobox(client,loc(client,"Systeme_281"),"info")
				setElementData(client,item,getElementData(client,item)-1)
			else infobox(client,loc(client,"Systeme_282"),"error")end
		elseif(item == "Apfelsamen" or item == "Orangensamen" or item == "Hanfsamen")then
			if(getElementData(client,"amAnpflanzen") ~= true)then
				Pflanzensystem.anpflanzen(client,item)
				setElementData(client,item,getElementData(client,item)-1)
			end
		elseif(item == "Benzinkanister")then
			if(isPedInVehicle(client))then
				local veh = getPedOccupiedVehicle(client)
				if(getElementData(veh,"Benzin") < 100)then
					setElementData(veh,"Benzin",100)
					infobox(client,loc(client,"Systeme_283"),"info")
					setElementData(client,item,getElementData(client,item)-1)
				else infobox(client,loc(client,"Systeme_284"),"error")end
			end
		elseif(item == "Medikits")then
			if(getElementHealth(client) < 100)then
				setElementHealth(client,100)
				setElementData(client,item,getElementData(client,item)-1)
				infobox(client,loc(client,"Systeme_285"),"info")
			end
		elseif(item == "Taucheranzug")then
			Tauchen.useSuit(client)
		elseif(item == "Repairkits")then
			if(isPedInVehicle(client))then
				local veh = getPedOccupiedVehicle(client)
				fixVehicle(veh)
				infobox(client,loc(client,"Systeme_286"),"info")
				setElementData(client,item,getElementData(client,item)-1)
			end
		elseif(item == "Automatensprengkit")then
			setElementData(client,"AutomatensprengkitStatus",true)
			infobox(client,loc(client,"Systeme_287"),"info")
		elseif(item == "Schatztruhe")then
			setElementData(client,"Schatztruhe",getElementData(client,"Schatztruhe")-1)
			local rnd = math.random(1,3)
			if(math.random(1,75) > 1)then
				if(rnd == 1)then
					setElementData(client,"Spitzhacke",getElementData(client,"Spitzhacke")+5)
					infobox(client,loc(client,"Systeme_288"),"info")
				elseif(rnd == 2)then
					local mats = math.random(5,15)
					setElementData(client,"Materialien",getElementData(client,"Materialien")+mats)
					infobox(client,loc(client,"Systeme_289"):format(mats),"info")
				elseif(rnd == 3)then
					local gras = math.random(5,15)
					setElementData(client,"Gras",getElementData(client,"Gras")+gras)
					infobox(client,loc(client,"Systeme_290"):format(gras),"info")
				end
			else
				Sammelkarten.addKarte(client,math.random(1,25))
			end
		elseif(item == "Wuerfel")then
			meCMD(client,"hat eine "..math.random(1,6).." gewürfelt.")
			for _,v in pairs(getElementsByType("player"))do
				if(getElementData(v,"loggedin") == 1)then
					local x,y,z = getElementPosition(client)
					if(getDistanceBetweenPoints3D(x,y,z,getElementPosition(v)) <= 20)then
						outputChatBox(loc(v,"Systeme_291"):format(getPlayerName(client),math.random(1,6)),v,200,0,200)
					end
				end
			end
		elseif(item == "Sammelkartenalbum")then
			triggerClientEvent(client,"Inventar.openInventar",client,"no")
			Sammelkarten.openAlbum(client)
		elseif(item == "Zigaretten")then
			setElementData(client,item,getElementData(client,item)-1)
			if(not(isTimer(ZigarettenTimer[client])))then
				toggleAllControls(client,false)
				setElementFrozen(client,true)
				setPedAnimation(client,"lowrider","m_smkstnd_loop")
				ZigarettenTimer[client] = setTimer(function(client)
					addHunger(client,15)
					setPedAnimation(client)
					setElementFrozen(client,false)
					toggleAllControls(client,true)
				end,6000,1,client)
			end
		elseif(item == "Bomben")then
			Bombe.legen(client)
		elseif(item == "Craftingpanel")then
			triggerClientEvent(client,"Inventar.openInventar",client,"no")
			triggerClientEvent(client,"Craftingsystem.openWindow",client)
		elseif(item == "Gras")then
			if(getElementData(client,item) >= 2)then
				triggerClientEvent(client,"useGras",client)
				infobox(client,loc(client,"Systeme_292"),"info")
				setElementData(client,item,getElementData(client,item)-2)
			else infobox(client,loc(client,"Systeme_293"),"error")end
		end
		triggerClientEvent(client,"Inventar.refresh",client)
	end
end)

-- [[ WAS PASSIERT, WENN SPIELER STIRBT / QUITTET ]] --

addEventHandler("onPlayerQuit",root,function()
	if(isTimer(ZigarettenTimer[source]))then
		killTimer(ZigarettenTimer[source])
	end
end)

addEventHandler("onPlayerWasted",root,function()
	if(isTimer(ZigarettenTimer[source]))then
		killTimer(ZigarettenTimer[source])
	end
end)