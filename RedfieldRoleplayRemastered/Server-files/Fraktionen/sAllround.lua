-- [[ TABELLEN ]] --

local Evil = {4,6,7,8,9}
local Staat = {1,2,3}

-- [[ ONLINEMITGLIEDER ZÄHLEN ]] --

function getMembersOnline(type,id)
	local counter = 0
	for _,v in pairs(getElementsByType("player"))do
		if(getElementData(v,type) == id)then
			counter = counter + 1
		end
	end
	return counter
end

-- [[ STAATSFRAKTIONISTEN ONLINE ZÄHLEN ]] --

function getStateFactionMemberOnline()
	local counter = 0
	for _,v in pairs(getElementsByType("player"))do
		if(isStateFaction(v) and getElementData(v,"AFK") ~= true)then
			counter = counter + 1
		end
	end
	return counter
end

-- [[ GANGMITGLIEDER ONLINE ZÄHLEN ]] --

function getGangFactionMemberOnline()
	local counter = 0
	for _,v in pairs(getElementsByType("player"))do
		if(isEvil(v) and getElementData(v,"AFK") ~= true)then
			counter = counter + 1
		end
	end
	return counter
end

-- [[ IST SPIELER STAATSFRAKTIONIST? ]] --

function isStateFaction(player)
	local var = false
	local faction = getElementData(player,"Fraktion")
	for _,v in pairs(Staat)do
		if(getElementData(player,"Fraktion") == v)then
			var = true
		end
	end
	return var
end

-- [[ IST SPIELER BÖSER FRAKTIONISTE? ]] --

function isEvil(player)
	local var = false
	local faction = getElementData(player,"Fraktion")
	for _,v in pairs(Evil)do
		if(getElementData(player,"Fraktion") == v)then
			var = true
		end
	end
	return var
end

-- [[ NACHRICHT VERSENDEN ]] --

function sendMessage(typ,id,text,r,g,b)
	if(not(r))then r,g,b = 255,255,255 end
	for _,v in pairs(getElementsByType("player"))do
		if(getElementData(v,typ) == id)then
			outputChatBox(text,v,r,g,b,true)
		end
	end
end

-- [[ AKTIONSSTATUS ÄNDERN ]] --

function changeAktionAktiv()
	if(Fraktionssystem.aktionAktiv == true)then
		Fraktionssystem.aktionAktiv = false
	else
		Fraktionssystem.aktionAktiv = true
	end
end

function changeAktionPause()
	if(isTimer(changeAktionPauseTimer))then killTimer(changeAktionPauseTimer)end
	Fraktionssystem.aktionPause = true
	changeAktionPauseTimer = setTimer(function()
		Fraktionssystem.aktionPause = false
	end,900000,1)
end

-- [[ IST AKTION AKTIV / AKTIONSPAUSE? ]] --

function isAktionPause(player)
	if(Fraktionssystem.aktionPause == false)then
		return true
	else
		infobox(player,loc(player,"Fraktionen_267"),"error")
		return false
	end
end

function isAktionAktiv(player)
	if(Fraktionssystem.aktionAktiv == false)then
		return true
	else
		infobox(player,loc(player,"Fraktionen_268"),"error")
		return false
	end
end

-- [[ FRAKTIONSSKIN VERGEBEN ]] --

function giveFactionSkin(player)
	local faction = getElementData(player,"Fraktion")
	local rang = getElementData(player,"Fraktionrang")
	setElementModel(player,Fraktionssystem["Skins"][faction][rang+1])
	if(isEvil(player))then setElementData(player,"Skin",getElementModel(player))end
end

-- [[ FSKIN ]] --

addCommandHandler("fskin",function(player)
	if(isEvil(player))then
		if(getElementModel(player) == 0)then
			setElementModel(player,getElementData(player,"Skin"))
			infobox(player,loc(player,"Fraktionen_269"),"info")
		else
			setElementModel(player,0)
			infobox(player,loc(player,"Fraktionen_270"),"error")
			CJSkinshop.setClothes(player)
		end
	end
end)

-- [[ AKTIONSMONEY ]] --

function getAktionsMoney(money,type)
	local counter = 0
	if(type == "Staatsfraktion")then
		for _,v in pairs(getElementsByType("player"))do
			if(getElementData(v,"loggedin") == 1)then
				if(isEvil(v))then
					counter = counter + 1
				end
			end
		end
	elseif(type == "Gang")then
		for _,v in pairs(getElementsByType("player"))do
			if(getElementData(v,"loggedin") == 1)then
				if(isStateFaction(v))then
					counter = counter + 1
				end
			end
		end
	end
	return money + (counter * 1500)
end

-- [[ RESPAWNBUTTONS ]] --

for _,v in pairs(Fraktionssystem["Respawnbutton"])do
	local object = createObject(2886,v[1],v[2],v[3],v[4],v[5],v[6])
	setElementData(object,"Respawnbutton",true)
	setElementData(object,"RespawnButtonType",v[7])
	setElementData(object,"RespawnButtonID",v[8])
end

-- [[ ZIVIZEIT ]] --

function setPlayerZivizeit(player,type)
	local LastInvite = getPlayerData("userdata","Username",getPlayerName(player),"Last"..type.."Invite")
	if(getRealTime().timestamp < LastInvite+2592000000)then
		setElementData(player,type.."Zivizeit",getRealTime().timestamp)
	end
end

function hasPlayerZivizeit(player,type,target)
	local Zivizeit = getPlayerData("userdata","Username",getPlayerName(player),type.."Zivizeit")
	if(Zivizeit == 0 or Zivizeit >= Zivizeit+259200000)then
		return true
	else
		infobox(player,loc(player,"Fraktionen_271"),"error")
		if(target)then
			local target = getPlayerFromName(target)
			if(existPlayer(_,target))then
				infobox(target,loc(target,"Fraktionen_272"),"error")
			end
		end
		return false
	end
end