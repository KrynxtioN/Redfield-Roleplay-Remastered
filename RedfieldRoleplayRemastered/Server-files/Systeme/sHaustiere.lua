-- [[ HAUSTIERDATAS ]] --

local Datas = {"Model","Name","Laune","Gesundheit","Hunger","Durst","LauneTime","HungerTime","DurstTime","Level","Erfahrungspunkte"}

-- [[ HAUSTIERE LADEN ]] --

local result = dbPoll(dbQuery(handler,"SELECT * FROM haustiere"),-1)
if(#result >= 1)then
	for _,v in pairs(result)do
		if(v["Platziert"] == 1)then
			Haustiere[v["Besitzer"]] = createPed(v["Model"],v["Spawnx"],v["Spawny"],v["Spawnz"],v["Spawnrotz"])
			setElementData(Haustiere[v["Besitzer"]],"Name",v["Name"].."\nHaustier von "..v["Besitzer"])
			setElementData(Haustiere[v["Besitzer"]],"Besitzer",v["Besitzer"])
			setElementData(Haustiere[v["Besitzer"]],"Haustier",true)
			setElementFrozen(Haustiere[v["Besitzer"]],true)
		end
	end
end

-- [[ HAUSTIER PLATZIEREN ]] --

function Haustiere.place(player)
	local result = dbPoll(dbQuery(handler,"SELECT * FROM haustiere WHERE Besitzer = '"..getPlayerName(player).."'"),-1)
	if(#result >= 1)then
		if(getElementDimension(player) == 0 and getElementInterior(player) == 0)then
			if(not(isElementInWater(player)) and isPedOnGround(player))then
				local player_name = getPlayerName(player)
				if(isElement(Haustiere[player_name]))then destroyElement(Haustiere[player_name])end
				for _,v in pairs(result)do
					local x,y,z = getElementPosition(player)
					local rx,ry,rz = getElementRotation(player)
					Haustiere[player_name] = createPed(v["Model"],x,y,z,rz)
					setElementData(Haustiere[player_name],"Name",v["Name"].."\nHaustier von "..player_name)
					setElementData(Haustiere[player_name],"Haustier",true)
					setElementData(Haustiere[player_name],"Besitzer",player_name)
					setElementFrozen(Haustiere[player_name],true)
					dbExec(handler,"UPDATE haustiere SET Spawnx = '"..x.."', Spawny = '"..y.."', Spawnz = '"..z.."', Spawnrotz = '"..rz.."', Platziert = '1' WHERE Besitzer = '"..player_name.."'")
					setElementData(Haustiere[player_name],"Besitzer",player_name)
				end
			else infobox(player,loc(player,"Systeme_313"),"error")end
		else infobox(player,loc(player,"Systeme_314"),"error")end
	end
end
addCommandHandler("haustier",Haustiere.place)

-- [[ HUNGER ETC. ABZIEHEN ]] --

setTimer(function()
	local result = dbPoll(dbQuery(handler,"SELECT * FROM haustiere"),-1)
	if(#result >= 1)then
		for _,v in pairs(result)do
			local Laune,Gesundheit,Hunger,Durst = v["Laune"]-math.random(1,3),v["Gesundheit"],v["Hunger"]-math.random(1,4),v["Durst"]-math.random(1,5)
			if(Laune < 0)then Laune = 0 end if(Hunger < 0)then Hunger = 0 end if(Durst < 0)then Durst = 0 end
			if(Laune <= 50 or Hunger <= 50 or Durst <= 50)then Gesundheit = Gesundheit - math.random(2,5) end
			if(Gesundheit < 0)then Gesundheit = 0 end
			dbExec(handler,"UPDATE haustiere SET Laune = "..Laune..", Gesundheit = "..Gesundheit..", Hunger = "..Hunger..", DURST = "..Durst.." WHERE Besitzer = '"..v["Besitzer"].."'")
			if(getPlayerData("haustiere","Besitzer",v["Besitzer"],"Gesundheit") == 0)then
				local owner = getPlayerFromName(v["Besitzer"])
				if(existPlayer(_,owner))then
					outputChatBox(loc(owner,"Systeme_315"):format(v["Name"]),owner,255,255,255,true)
				else
					offlinemessage(owner,loc(_,"Systeme_316",owner):format(v["Name"]))
				end
				dbExec(handler,"DELETE FROM haustiere WHERE Besitzer = '"..v["Besitzer"].."'")
				destroyElement(Haustiere[v["Besitzer"]])
			end
		end
	end
end,3600000,0)

-- [[ HAUSTIERDATAS AUSGEBEN LASSEN ]] --

function Haustiere.getDatas(player)
	local tbl = {}
	for _,v in pairs(Datas)do
		local var = getPlayerData("haustiere","Besitzer",getPlayerName(player),v)
		table.insert(tbl,var)
	end
	for i = 7,9 do
		if(tonumber(tbl[i]) ~= 0)then
			tbl[i] = (tbl[i] + 3600) - getRealTime().timestamp
			if(tonumber(tbl[i]) >= 1)then
				tbl[i] = " ("..convertMS(tbl[i]*1000)..")"
			else
				tbl[i] = ""
			end
		else
			tbl[i] = ""
		end
	end
	triggerClientEvent(player,"Haustiere.setDatas",player,tbl)
end
addEvent("Haustiere.getDatas",true)
addEventHandler("Haustiere.getDatas",root,Haustiere.getDatas)

-- [[ SICH UM SEIN HAUSTIER KÜMMERN ]] --

addEvent("Haustiere.server",true)
addEventHandler("Haustiere.server",root,function(type)
	local realtime = getRealTime().timestamp
	if(string.find(type,"Füttern"))then
		local Time = getPlayerData("haustiere","Besitzer",getPlayerName(client),"HungerTime")
		if(tonumber(Time) == 0 or getRealTime().timestamp >= Time + 3600)then
			if(getElementData(client,"Futter") >= 1)then
				dbExec(handler,"UPDATE haustiere SET HungerTime = '"..realtime.."', Hunger = '100' WHERE Besitzer = '"..getPlayerName(client).."'")
				infobox(client,loc(client,"Systeme_317"),"info")
				setElementData(client,"Futter",getElementData(client,"Futter")-1)
				Haustiere.giveExperiencePoints(client)
			else infobox(client,loc(client,"Systeme_318"),"error")end
		else infobox(client,loc(client,"Systeme_319"),"error")end
	elseif(string.find(type,"Trinkbehälter füllen"))then
		local Time = getPlayerData("haustiere","Besitzer",getPlayerName(client),"DurstTime")
		if(tonumber(Time) == 0 or getRealTime().timestamp >= Time + 3600)then
			if(getElementData(client,"Wasser") >= 1)then
				dbExec(handler,"UPDATE haustiere SET DurstTime = '"..realtime.."', Durst = '100' WHERE Besitzer = '"..getPlayerName(client).."'")
				infobox(client,loc(client,"Systeme_320"),"info")
				setElementData(client,"Wasser",getElementData(client,"Wasser")-1)
				Haustiere.giveExperiencePoints(client)
			else infobox(client,loc(client,"Systeme_321"),"error")end
		else infobox(client,loc(client,"Systeme_322"),"error")end
	elseif(string.find(type,"Spielen"))then
		local Time = getPlayerData("haustiere","Besitzer",getPlayerName(client),"LauneTime")
		if(tonumber(Time) == 0 or getRealTime().timestamp >= Time + 3600)then
			if(getElementData(client,"Spielzeug") >= 1)then
				dbExec(handler,"UPDATE haustiere SET LauneTime = '"..realtime.."', Laune = '100' WHERE Besitzer = '"..getPlayerName(client).."'")
				infobox(client,loc(client,"Systeme_323"),"info")
				setElementData(client,"Spielzeug",getElementData(client,"Spielzeug")-1)
				Haustiere.giveExperiencePoints(client)
			else infobox(client,loc(client,"Systeme_324"),"error")end
		else infobox(client,loc(client,"Systeme_325"),"error")end
	elseif(type == "Untersuchen")then
		if(getPlayerData("haustiere","Besitzer",getPlayerName(client),"Gesundheit") < 100)then
			if(getElementData(client,"Medizin") >= 1)then
				dbExec(handler,"UPDATE haustiere SET Gesundheit = '100' WHERE Besitzer = '"..getPlayerName(client).."'")
				infobox(client,loc(client,"Systeme_326"),"info")
				setElementData(client,"Medizin",getElementData(client,"Medizin")-1)
				Haustiere.giveExperiencePoints(client)
			else infobox(client,loc(client,"Systeme_327"),"error")end
		else infobox(client,loc(client,"Systeme_328"),"info")end
	elseif(type == "Beim Schönheitswettbewerb anmelden")then
		if(getPlayerData("haustiere","Besitzer",getPlayerName(client),"Wettbewerb") == 0)then
			infobox(client,loc(client,"Systeme_329"),"info")
			dbExec(handler,"UPDATE haustiere SET Wettbewerb = '1' WHERE Besitzer = '"..getPlayerName(client).."'")
		else infobox(client,loc(client,"Systeme_330"),"error")end
	end
end)

-- [[ HAUSTIER ERFAHRUNGSPUNKTE GEBEN ]] --

function Haustiere.giveExperiencePoints(player)
	local points = getPlayerData("haustiere","Besitzer",getPlayerName(player),"Erfahrungspunkte")
	local level = getPlayerData("haustiere","Besitzer",getPlayerName(player),"Level")
	if(points + 50 >= (level + 1) * Haustiere.pointsProLevel)then
		dbExec(handler,"UPDATE haustiere SET Level = '"..level + 1 .."', Erfahrungspunkte = '0' WHERE Besitzer = '"..getPlayerName(player).."'")
		infobox(player,loc(player,"Systeme_331"),"info")
		Haustiere.getDatas(player)
	else
		dbExec(handler,"UPDATE haustiere SET Erfahrungspunkte = '"..points + 50 .."' WHERE Besitzer = '"..getPlayerName(player).."'")
		Haustiere.getDatas(player)
	end
end

-- [[ SCHÖNHEITSWETTBEWERB ]] --

local time = getRealTime()
if(daytable[time.weekday+1] == "Sa")then
	Haustiere.wettbewerbTimer = setTimer(function()
		if(getRealTime().hour >= 18)then
			killTimer(Haustiere.wettbewerbTimer)
			local result = dbPoll(dbQuery(handler,"SELECT * FROM haustiere ORDER BY Level DESC"),-1)
			if(#result >= 1)then
				for i,v in ipairs(result)do
					local owner = getPlayerFromName(v["Besitzer"])
					for _,v in pairs(getElementsByType("player"))do
						if(getElementData(v,"loggedin") == 1)then
							outputChatBox(loc(v,"Systeme_332"),v,250,150,0)
							outputChatBox(loc(v,"Systeme_333"):format(v["Name"],v["Besitzer"]),v,250,125,0)
							outputChatBox(loc(v,"Systeme_334"):format(v["Level"],v["Besitzer"]),v,250,125,0)
							outputChatBox(loc(v,"Systeme_335"),v,250,150,0)
						end
					end
					dbExec(handler,"UPDATE haustiere SET Level = '0', Erfahrungspunkte = '0'")
					if(existPlayer(_,owner))then
						setElementData(owner,"Geld",getElementData(owner,"Geld")+50000)
						setElementData(owner,"GoldTicket",getElementData(owner,"GoldTicket")+1)
						outputChatBox(loc(owner,"Systeme_336"),owner,255,255,255,true)
					else
						dbExec(handler,"UPDATE accounts SET Geld = '"..getPlayerData("accounts","Username",v["Besitzer"],"Geld") + 50000 .."', GoldTicket = '"..getPlayerData("accounts","Username",v["Besitzer"],"GoldTicket") + 1 .."' WHERE Username = '"..v["Besitzer"].."'")
						offlinemessage(v["Besitzer"],loc(_,"Systeme_337",v["Besitzer"]))
					end
					if(i >= 1)then break end
				end
			end
		end
	end,60000,0)
end