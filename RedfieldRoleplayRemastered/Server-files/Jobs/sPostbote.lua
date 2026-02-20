-- [[ JOB STARTEN (LEVEL 1) ]] --

addEvent("Postbote.level1",true)
addEventHandler("Postbote.level1",root,function()
	if(hasPlayerLicense(player,498))then
		if(not(isElement(Postbote.veh[client])))then
			if(not(isElement(Postbote.paket[client])))then
				bindKey(client,"num_0","down",Postbote.finish)
				Postbote.veh[client] = createVehicle(498,-1973.0102539063,1048.7092285156,55.921455383301,0,0,90)
				setElementData(Postbote.veh[client],"PostbotenOwner",getPlayerName(client))
				setElementData(Postbote.veh[client],"Pakete",25)
				warpPedIntoVehicle(client,Postbote.veh[client])
				setVehicleColor(Postbote.veh[client],255,255,0)
				setElementData(client,"Paket",false)
				triggerClientEvent(client,"Postbote.createElements",client)
				
				addEventHandler("onVehicleEnter",Postbote.veh[client],function(player)
					if(getPedOccupiedVehicleSeat(player) == 0)then
						if(getElementData(source,"PostbotenOwner") ~= getPlayerName(player))then
							infobox(player,loc(player,"Jobs_80"),"error")
							exitVehicle(player)
						end
					end
				end)
			else infobox(client,loc(client,"Jobs_81"),"error")end
		else infobox(client,loc(client,"Jobs_83"),"error")end
	end
end)

-- [[ PAKET ABGEBEN ]] --

addEvent("Postbote.paketAbgeben",true)
addEventHandler("Postbote.paketAbgeben",root,function()
	if(isElement(Postbote.paket[client]))then
		giveJobMoney(client,math.random(40,65))
		destroyElement(Postbote.paket[client])
		setElementData(client,"Paket",false)
		setElementData(client,"PostbotePunkte",getElementData(client,"PostbotePunkte")+1)
	else infobox(client,loc(client,"Jobs_83"),"error")end
end)

-- [[ PAKET NEHMEN ]] --

function Postbote.takePaket(player)
	if(not(isElement(Postbote.paket[player])))then
		if(getElementData(Postbote.veh[player],"Pakete") >= 1)then
			local pakete = getElementData(Postbote.veh[player],"Pakete")
			setElementData(Postbote.veh[player],"Pakete",pakete-1)
			infobox(player,loc(player,"Jobs_84"):format(pakete-1),"info")
			if(pakete == 0)then infobox(player,loc(player,"Jobs_85"),"info")end
			Postbote.paket[player] = createObject(3014,0,0,0,0,0,0)
			attachElements(Postbote.paket[player],player,-0.1,0.5,0,0,0,0)
			setElementCollisionsEnabled(Postbote.paket[player],false)
			setElementData(player,"Paket",true)
		else infobox(player,loc(player,"Jobs_86"),"error")end
	else infobox(player,loc(player,"Jobs_87"),"error")end
end

-- [[ PAKETE AUFLADEN ]] --

addEvent("Postbote.paketeAufladen",true)
addEventHandler("Postbote.paketeAufladen",root,function()
	if(isPedInVehicle(client))then
		if(getPedOccupiedVehicle(client) == Postbote.veh[client])then
			if(getElementData(Postbote.veh[client],"Pakete") < 25)then
				setElementData(Postbote.veh[client],"Pakete",25)
				infobox(client,loc(client,"Jobs_88"),"info")
			else infobox(client,loc(client,"Jobs_89"),"error")end
		end
	end
end)

-- [[ JOB BEENDEN ]] --

function Postbote.finish(player)
	unbindKey(player,"num_0","down",Postbote.finish)
	if(isElement(Postbote.paket[player]))then destroyElement(Postbote.paket[player])end
	if(isElement(Postbote.veh[player]))then destroyElement(Postbote.veh[player])end
	setElementData(player,"Paket",false)
	triggerClientEvent(player,"Postbote.destroyMarker",player)
end

-- [[ WAS PASSIERT, WENN SPIELER STIRBT / QUITTET ]] --

addEventHandler("onPlayerQuit",root,function() Postbote.finish(source)end)
addEventHandler("onPlayerWasted",root,function() Postbote.finish(source)end)