-- [[ TAZER ]] --

TazerTimer = {}

addEvent("TazerPlayer",true)
addEventHandler("TazerPlayer",root,function(player)
	if(isTimer(TazerTimer[player]))then killTimer(TazerTimer[player])end
	toggleAllControls(player,false,true,false)
	setPedAnimation(player,"CRACK","crckdeth2")
	TazerTimer[player] = setTimer(function(player)
		if(isElement(player))then
			setPedAnimation(player)
			toggleAllControls(player,true,true,false)
		end
	end,10000,1,player)
end)

-- [[ ENTWAFFNEN ]] --

addEvent("Staatsfraktionen.entwaffnen",true)
addEventHandler("Staatsfraktionen.entwaffnen",root,function()
	if(isStateFaction(client) and isStaatDuty(client))then
		local target = getPlayerFromName(getElementData(client,"InteraktionPlayer"))
		if(existPlayer(target))then
			local x,y,z = getElementPosition(target)
			if(getDistanceBetweenPoints3D(x,y,z,getElementPosition(client)) <= 5)then
				takeAllWeapons(target)
				infobox(client,loc(client,"Fraktionen_227"):format(getPlayerName(target)),"info")
				infobox(target,loc(target,"Fraktionen_228"):format(getPlayerName(client)),"error")
			else infobox(client,loc(client,"Fraktionen_229"),"error")end
		end
	end
end)

-- [[ DURCHSUCHEN ]] --

addEvent("Staatsfraktionen.durchsuchen",true)
addEventHandler("Staatsfraktionen.durchsuchen",root,function()
	if(isStateFaction(client) and isStaatDuty(client))then
		local target = getPlayerFromName(getElementData(client,"InteraktionPlayer"))
		if(existPlayer(target))then
			local x,y,z = getElementPosition(target)
			if(getDistanceBetweenPoints3D(x,y,z,getElementPosition(client)) <= 5)then
				infobox(client,loc(client,"Fraktionen_230"):format(getPlayerName(target)),"info")
				infobox(target,loc(target,"Fraktionen_231"):format(getPlayerName(client)),"error")
				local drogen = getElementData(target,"Gras")
				local mats = getElementData(target,"Materialien")
				outputChatBox(loc(client,"Fraktionen_232"):format(getPlayerName(target)),client,255,255,255,true)
				outputChatBox(loc(client,"Fraktionen_233"):format(drogen,mats),client,255,255,255)
			else infobox(client,loc(client,"Fraktionen_234"),"error")end
		end
	end
end)

-- [[ ILLEGALE ITEMS ABNEHMEN ]] --

addEvent("Staatsfraktionen.takeillegal",true)
addEventHandler("Staatsfraktionen.takeillegal",root,function()
	if(isStateFaction(client) and isStaatDuty(client))then
		local target = getPlayerFromName(getElementData(client,"InteraktionPlayer"))
		if(existPlayer(target))then
			local x,y,z = getElementPosition(target)
			if(getDistanceBetweenPoints3D(x,y,z,getElementPosition(client)) <= 5)then
				infobox(client,loc(client,"Fraktionen_235"):format(getPlayerName(target)),"info")
				infobox(target,loc(target,"Fraktionen_236"):format(getPlayerName(client)),"error")
				setElementData(target,"Gras",0)
				setElementData(target,"Materialien",0)
			else infobox(client,loc(client,"Fraktionen_237"),"error")end
		end
	end
end)

-- [[ PA-NOTE VERGEBEN ]] --

addEvent("Staatsfraktionen.policeAcademyNote",true)
addEventHandler("Staatsfraktionen.policeAcademyNote",root,function(note)
	if(isStateFaction(client) and isStaatDuty(client))then
		local target = getPlayerFromName(getElementData(client,"InteraktionPlayer"))
		if(existPlayer(target))then
			local x,y,z = getElementPosition(target)
			if(getDistanceBetweenPoints3D(x,y,z,getElementPosition(client)) <= 5)then
				if(tonumber(note) >= 1 and tonumber(note) <= 100)then
					setElementData(client,"PANote",note)
					infobox(client,loc(client,"Fraktionen_238"):format(getPlayerName(target),note),"info")
					infobox(target,loc(target,"Fraktionen_239"):format(getPlayerName(client),note),"info")
				else infobox(client,loc(client,"Fraktionen_240"),"error")end
			else infobox(client,loc(client,"Fraktionen_241"),"error")end
		end
	end
end)

-- [[ MEGAPHON ]] --

addCommandHandler("m",function(player,cmd,...)
	if(isStateFaction(player) and isStaatDuty(player))then
		if(isPedInVehicle(player))then
			local veh = getPedOccupiedVehicle(player)
			local besitzer = getElementData(veh,"Besitzer")
			if(besitzer == "SFPD" or besitzer == "FBI" or besitzer == "Army")then
				local text = table.concat({...}," ")
				for _,v in pairs(getElementsByType("player"))do
					local x,y,z = getElementPosition(v)
					if(getDistanceBetweenPoints3D(x,y,z,getElementPosition(player)) <= 30)then
						outputChatBox(loc(v,"Fraktionen_242"):format(getPlayerName(player),text),v,250,250,0)
					end
				end
			end
		end
	end
end)

-- [[ FESSELN / ENTFESSELN ]] --

addCommandHandler("cuff",function(player,cmd,target)
	if(isStateFaction(player) and isStaatDuty(player))then
		if(target)then
			local target = getPlayerFromName(target)
			if(existPlayer(target))then
				local x,y,z = getElementPosition(target)
				if(getDistanceBetweenPoints3D(x,y,z,getElementPosition(player)) <= 10)then
					if(not(target == player))then
						if(getElementData(target,"tied") == true)then
							toggleAllControls(target,true)
							setElementData(target,"tied",false)
							infobox(target,loc(target,"Fraktionen_243"):format(getPlayerName(player)),"info")
							infobox(player,loc(player,"Fraktionen_244"):format(getPlayerName(target)),"info")
						else
							toggleAllControls(target,false)
							setElementData(target,"tied",true)
							infobox(target,loc(target,"Fraktionen_245"):format(getPlayerName(player)),"error")
							infobox(player,loc(player,"Fraktionen_246"):format(getPlayerName(target)),"info")
						end
					else infobox(client,loc(client,"Fraktionen_247"),"error")end
				else infobox(client,loc(client,"Fraktionen_248"),"error")end
			end
		else infobox(client,loc(client,"Fraktionen_249"),"error")end
	end
end)

-- [[ ZUM TAZER WECHSELN / ZUR DEAGLE WECHSELN ]] --

function Staatsfraktionen.tazer(player)
	if(isStaatDuty(player) and isStaatDuty(player))then
		if(getElementData(player,"tazer") ~= true)then
			if(getPedWeapon(player) == 24)then
				Staatsfraktionen.saveDeagleSchuss[player] = getPedTotalAmmo(player)
				takeWeapon(player,24)
				giveWeapon(player,23,999,true)
				infobox(player,loc(player,"Fraktionen_250"),"info")
				setElementData(player,"tazer",true)
			else infobox(player,loc(player,"Fraktionen_251"),"error")end
		else
			if(getPedWeapon(player) == 23)then
				takeWeapon(player,23)
				giveWeapon(player,24,Staatsfraktionen.saveDeagleSchuss[player],true)
				infobox(player,loc(player,"Fraktionen_252"),"info")
				setElementData(player,"tazer",false)
			else infobox(player,loc(player,"Fraktionen_253"),"error")end
		end
	end
end

-- [[ HILFE ANFORDERN ]] --

function Staatsfraktionen.needhelp(player)
	if(isStateFaction(player) and isStaatDuty(player))then
		if(getElementInterior(player) == 0 and getElementDimension(player) == 0)then
			if(not(isElement(Staatsfraktionen.needhelpBlip[player])))then
				for _,v in pairs(getElementsByType("player"))do
					if(getElementData(v,"loggedin") == 1)then
						if(isStateFaction(v))then
							outputChatBox(loc(v,"Fraktionen_254"):format(getPlayerName(player)),v,250,250,0)
						end
					end
				end
				Staatsfraktionen.needhelpBlip[player] = createBlipAttachedTo(player,41)
				setElementVisibleTo(Staatsfraktionen.needhelpBlip[player],root,false)
				setTimer(function(blip)
					if(isElement(blip))then
						destroyElement(blip)
					end
				end,20000,1,Staatsfraktionen.needhelpBlip[player])
				
				for _,v in pairs(getElementsByType("player"))do
					if(isStateFaction(v) and isStaatDuty(v) and getPlayerName(v) ~= getPlayerName(player))then
						setElementVisibleTo(Staatsfraktionen.needhelpBlip[player],v,true)
					end
				end
			else infobox(player,loc(player,"Fraktionen_255"),"error")end
		end
	end
end