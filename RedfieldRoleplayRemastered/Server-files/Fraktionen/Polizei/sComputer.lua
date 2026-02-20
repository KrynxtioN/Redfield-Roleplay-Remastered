-- [[ WANTEDS / STVO-PUNKTE VERGEBEN ]] --

function givePlayerWanteds(player,wanteds)
	setElementData(player,"Wanteds",getElementData(player,"Wanteds")+wanteds)
	if(getElementData(player,"Wanteds") > 6)then setElementData(player,"Wanteds",6)end
end

function givePlayerStVo(player,punkte)
	setElementData(player,"StVo",getElementData(player,"StVo")+punkte)
	if(getElementData(player,"StVo") > 15)then setElementData(player,"StVo",15)end
	if(getElementData(player,"StVo") > 14)then
		outputChatBox(loc(player,"Fraktionen_212"),player,200,200,0)
		outputChatBox(loc(player,"Fraktionen_213"),player,175,175,0)
		setElementData(player,"Fuehrerschein",0)
	end
end

addEvent("Computer.give",true)
addEventHandler("Computer.give",root,function(target,type,reason,menge)
	local text = false
	local menge = tonumber(menge)
	local target = getPlayerFromName(target)
	if(existPlayer(client,target))then
		if(type == "Wanteds")then
			if(getElementData(target,"Wanteds") < 6)then
				text = "Wanted(s)"
				givePlayerWanteds(target,menge)
			else infobox(client,loc(client,"Fraktionen_214"),"error")end
		elseif(type == "StVo")then
			if(getElementData(target,"StVo") < 15)then
				text = "StVo-Punkt(e)"
				givePlayerStVo(target,menge)
			else infobox(client,loc(client,"Fraktionen_215"),"error")end
		end
		if(text ~= false)then
			outputChatBox(loc(target,"Fraktionen_216"):format(getPlayerName(client),menge,text),target,255,255,255,true)
			infobox(client,loc(client,"Fraktionen_217"):format(getPlayerName(target),menge,text,reason),"info")
		end
		triggerClientEvent(target,"loadWantedcomputerPlayer",target)
	end
end)

-- [[ WANTEDS LÖSCHEN ]] --

addEvent("Computer.deleteWanteds",true)
addEventHandler("Computer.deleteWanteds",root,function(target,type)
	local target = getPlayerFromName(target)
	if(existPlayer(client,target))then
		if(type == "Wanteds")then
			infobox(target,loc(target,"Fraktionen_218"):format(getPlayerName(client)),"info")
			infobox(client,loc(client,"Fraktionen_219"):format(getPlayerName(target)),"info")
			setElementData(target,"Wanteds",0)
		elseif(type == "StVo")then
			infobox(target,loc(target,"Fraktionen_220"):format(getPlayerName(client)),"info")
			infobox(client,loc(client,"Fraktionen_221"):format(getPlayerName(target)),"info")
			setElementData(target,"StVo",0)
		end
		triggerClientEvent(target,"loadWantedcomputerPlayer",target)
	end
end)

addCommandHandler("delwanteds",function(player,cmd,target)
	if(isStateFaction(player) and isStaatDuty(player))then
		if(target)then
			local target = getPlayerFromName(target)
			if(existPlayer(player,target))then
				infobox(target,loc(target,"Fraktionen_222"):format(getPlayerName(client)),"info")
				infobox(client,loc(client,"Fraktionen_223"):format(getPlayerName(target)),"info")
				setElementData(target,"Wanteds",0)
				triggerClientEvent(target,"loadWantedcomputerPlayer",target)
			end
		else infobox(player,loc(player,"Fraktionen_224"),"error")end
	end
end)

-- [[ ORTEN ]] --

addEvent("Computer.orten",true)
addEventHandler("Computer.orten",root,function(target)
	local target = getPlayerFromName(target)
	if(existPlayer(client,target))then
		if(getElementInterior(target) == 0 and getElementDimension(target) == 0)then
			if(getElementData(target,"Handy") == 1 and getElementData(target,"Handystatus") == "on")then
				triggerClientEvent(client,"Computer.ortenBlip",client,target)
			else infobox(client,loc(client,"Fraktionen_225"),"error")end
		else infobox(client,loc(client,"Fraktionen_226"),"error")end
	end
end)