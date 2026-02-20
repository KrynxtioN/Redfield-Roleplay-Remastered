RaceLobby = {alreadyStarted = false, specNumber = {}, playersToSpectate = {}, RaceLobby.neededForRedo = 0, votedForRedo = 0, activeRedo = nil, activeMap = nil, lastMap = nil}
RaceLobby.players = 0

-- [[ LOBBY JOINEN / VERLASSEN ]] --

addEvent("RaceLobby.join",true)
addEventHandler("RaceLobby.join",root,function(type)
	if(not(type))then
		if(getElementData(client,"Lobby") == "Eingangsbereich")then
			setElementData(client,"Lobby","Race")
			infobox(client,"Du bist nun in der Race-Arena.","info")
			RaceLobby.players = RaceLobby.players + 1
			RaceLobby.startMap()
		end
	else
		setElementData(client,"Lobby","Eingangsbereich")
		infobox(client,"Du hast die Race-Arena verlassen.","error")
		RaceLobby.players = RaceLobby.players - 1
		RaceLobby.stopMap()
	end
end)

function RaceLobby.spawn(player)
	if(RaceLobby.activeRace == false and RaceLobby.wartezeit == false)then
		
	else
		RaceLobby.spectate(player)
	end
end

-- [[ SPECTATEN ]] --

function RaceLobby.activateSpectate(player)
	RaceLobby.specNumber[player] = 1
	bindKey(player,"arrow_l","down",RaceLobby.spectateLeft)
	bindKey(player,"arrow_r","down",RaceLobby.spectateRight)
end

function RaceLobby.spectate(player)
	local id = RaceLobby.specNumber[player]
	local target = getPlayerFromName(RaceLobby.playersToSpectate[id])
	setCameraMatrix(player,target)
end

function RaceLobby.spectateLeft(player)
	if(RaceLobby.specNumber[player] > 1)then
		RaceLobby.specNumber[player] = RaceLobby.specNumber[player] - 1
		RaceLobby.spectate(player)
	end
end

function RaceLobby.spectateRight(player)
	if(RaceLobby.specNumber[player] < #RaceLobby.playersToSpectate[player])then
		RaceLobby.specNumber[player] = RaceLobby.specNumber[player] + 1
		RaceLobby.spectate(player)
	end
end

-- [[ REDO ]] --

addCommandHandler("vr",function(player)
	if(isInRaceLobby(player))then
		if(RaceLobby.activeMap ~= RaceLobby.lastMap)then
			local inRaceLobby = 0
			for _,v in pairs(getElementsByType("player"))do
				if(getElementData(v,"loggedin") == 1 and isInRaceLobby(v))then
					inRaceLobby = inRaceLobby + 1
				end
			end
			if(RaceLobby.neededForRedo == 0)then RaceLobby.neededForRedo = inRaceLobby/2 end
			RaceLobby.votedForRedo = RaceLobby.votedForRedo + 1
			if(RaceLobby.votedForRedo >= RaceLobby.neededForRedo)then
			
			end
		else infobox(player,"Die Map wurde bereits wiederholt!","error")end
	end
end)

-- [[ MAP STARTEN ]] --

function RaceLobby.startMap()
	if(RaceLobby.players >= 1 and RaceLobby.alreadyStarted == false)then
	
	end
end

-- [[ MAP STOPPEN ]] --

function RaceLobby.stopMap()
	if(RaceLobby.players == 0)then
	
	end
end

-- [[ IST SPIELER IN RACE-LOBBY? ]] --

function isInRaceLobby(player)
	if(getElementData(player,"Lobby") == "Race")then
		return true
	else
		return false
	end
end

-- [[ NACHRICHT IN DIE RACE-LOBBY SCHICKEN ]] --

function sendMessageToRaceLobby(text,r,g,b)
	for _,v in pairs(getElementsByType("player"))do
		if(getElementData(v,"loggedin") == 1 and isInRaceLobby(v))then
			outputChatBox(text,v,r,g,b,true)
		end
	end
end

-- [[ WAS PASSIERT, WENN DER SPIELER STIRBT / QUITTET ]] --

addEventHandler("onPlayerQuit",root,function()
	if(isInRaceLobby(source))then
		RaceLobby.players = RaceLobby.players - 1
	end
end)

addEventHandler("onPlayerWasted",root,function()
	if(isInRaceLobby(source))then
		RaceLobby.spectate(source)
	end
end)