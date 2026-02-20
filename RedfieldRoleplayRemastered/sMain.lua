local Restart = false
handler = dbConnect("mysql","dbname=redfieldroleplay;host=127.0.0.1","root","")

if(handler)then
	outputDebugString("Datenbankverbindung erfolgreich.")
else
	outputDebugString("Datenbankverbindung fehlgeschlagen.")
end

outputDebugString(Serverinfos.name.." "..Serverinfos.version.." GELADEN!")
setFPSLimit(65)
setGameType(Serverinfos.name.." "..Serverinfos.version)
removeWorldModel(4220,50,1370.6406, -1643.4453, 33.1797) -- Möbelhaus-Lichter

local time = getRealTime()
setTime(time.hour,time.minute)
setMinuteDuration(60000)

if(daytable[time.weekday+1] == "So")then
	dbExec(handler,"UPDATE accounts SET OnlineTime = '0' AND OnlineTimeAFK = '0'")
end

function getSecTime(duration)
	local time = getRealTime()
	local year = time.year
	local day = time.yearday
	local hour = time.hour
	local minute = time.minute
	local total = year*365*24*60+day*24*60+(hour+duration)*60+minute
	
	return total
end

-- [[ SCHWARZE BRETTER LADEN ]] --

local result = dbPoll(dbQuery(handler,"SELECT * FROM schwarzesbrett"),-1)

if(#result >= 1)then
	for i,v in pairs(result)do
		local object = createObject(3927,v["Posx"],v["Posy"],v["Posz"],0,0,v["Rotz"])
		setElementData(object,"SchwarzesBrettID",i)
	end
end

-- [[ DATUM UND UHRZEIT AUSGEBEN ]] --

function DatumUhrzeit()
	local time = getRealTime()
	local year,month,day = time.year+1900,time.month+1,time.monthday
	local hour,minute,second = time.hour,time.minute,time.second+1
	return {day,month,year,hour,minute,second}
end

-- [[ EXISTIERT SPIELER? ]] --

function existPlayer(player,target)
	if(isElement(target) and getElementData(target,"loggedin") == 1)then
		return true
	else
		infobox(player,loc(player,"sMain_1"),"error")
		return false
	end
end

-- [[ INFOBOX ]] --

function infobox(player,text,type,r,g,b)
	if(isElement(player))then
		if(r and g and b)then
			triggerClientEvent(player,"infobox",player,text,type,r,g,b)
		else
			triggerClientEvent(player,"infobox",player,text,type)
		end
	end
end

-- [[ PEDS LADEN ]] --

function loadPeds(player)
	local result = dbPoll(dbQuery(handler,"SELECT * FROM peds"),-1)
	if(#result >= 1)then
		local peds = {}
		for _,v in pairs(result)do
			if(v["Deaktiviert"] == 0)then
				table.insert(peds,{v["Model"],v["Spawnx"],v["Spawny"],v["Spawnz"],v["Rotz"],v["Interior"],v["Dimension"],v["CircleSize"],v["Name"],v["Event"],v["Typ"],v["Blip"],v["ID"],v["KannAusgeraubtWerden"]})
			end
		end
		triggerClientEvent(player,"Peds.load",player,peds)
	end
end

-- [[ BLIPS ERSTELLEN ]] --

for _,v in pairs(Blips)do
	createBlip(v[1],v[2],v[3],v[4],_,_,_,_,_,_,100)
end

-- [[ WAS PASSIEREN SOLL, WENN SPIELER QUITTET ]] --

addEventHandler("onPlayerQuit",root,function()
	if(getElementData(source,"Wanteds") >= 1)then
		for _,v in pairs(getElementsByType("player"))do
			if(isStateFaction(v) and isStaatDuty(v))then
				local x,y,z = getElementPosition(v)
				if(getDistanceBetweenPoints3D(x,y,z,getElementPosition(source)) <= 25)then
					local Wanteds = getElementData(source,"Wanteds")
					setElementData(source,"Jailtime",Wanteds*5)
					setElementData(source,"Wanteds",0)
					offlinemessage(getPlayerName(source),loc(source,"sMain_2"):format(Wanteds*5))
					break
				end
			end
		end
	end

	savePlayerDatas(source)
	
	deleteBlaster(source)
	if(isTimer(Tauchen.timer[source]))then killTimer(Tauchen.timer[source])end
	if(getElementData(source,"GaragenID"))then setGarageOpen(getElementData(source,"GaragenID"),true)end
	if(getElementData(source,"loggedin") == 1)then savePlayerDatas(source)end
	if(isTimer(Payday[source]))then killTimer(Payday[source])end
	
	local curWeaponsForSave = "|"
	for i = 1,11 do
		if(i ~= 10)then
			local weapon = getPedWeapon(source,i)
			local ammo = getPedTotalAmmo(source,i)
			if(weapon and ammo)then
				if(weapon >= 1 and ammo >= 1)then
					if(#curWeaponsForSave <= 40)then
						curWeaponsForSave = curWeaponsForSave..weapon..","..ammo.."|"
					end
				end
			end
		end
	end
	if(#curWeaponsForSave >= 5)then
		dbExec(handler,"INSERT INTO logout (Username,Weapons) VALUES ('"..getPlayerName(source).."','"..curWeaponsForSave.."')")
	end
end)

-- [[ NICKCHANGE BLOCKEN ]] --

addEventHandler("onPlayerChangeNick",root,function()
	infobox(source,loc(source,"sMain_3"),"error")
	cancelEvent()
end)

-- [[ CHECKEN, OB SPIELER GEBANNT IST ]] --

function isPlayerBanned(player)
	local result = dbPoll(dbQuery(handler,"SELECT * FROM bans WHERE Username = '"..getPlayerName(player).."'"),-1)
	if(#result >= 1)then
		if(tonumber(result[1]["STime"]) == 0)then
			infobox(player,loc(player,"sMain_4"):format(getPlayerData("bans","Username",getPlayerName(player),"Grund")),"error")
			return false
		else
			if(result[1]["STime"] ~= 0 and result[1]["STime"] - getSecTime(0) <= 0)then
				dbExec(handler,"DELETE FROM bans WHERE Username = '"..getPlayerName(player).."'")
				return true
			else
				local var = math.floor(((result[1]["STime"] - getSecTime(0))/60)*100)/100
				infobox(player,loc(player,"sMain_5"):format(var,getPlayerData("bans","Username",getPlayerName(player),"Grund")),"error")
				return false
			end
		end
	else
		return true
	end
end

-- [[ SCRIPTRESTART ]] --

setTimer(function()
	local time = getRealTime()
	local hours = time.hour
	local minutes = time.minute
	
	if(hours == 05 and minutes >= 55)then
		if(Restart == false)then
			Restart = true
			for _,v in pairs(getElementsByType("player"))do
				if(getElementData(v,"loggedin") == 1)then
					outputChatBox(loc(v,"sMain_6"),v,255,0,0)
				end
			end
			setTimer(function()
				for _,v in pairs(getElementsByType("player"))do
					savePlayerDatas(v)
					kickPlayer(v,"System","Scriptrestart")
				end
				restartResource(getThisResource())
			end,300000,1)
		end
	end
end,60000,0)

-- [[ ANTIKLICKSPAM ]] --

function isAntispamActive(player)
	if(getElementData(player,"Clickspam") == true)then
		return false
	else
		return true
	end
end

function activateAntispam(player)
	setElementData(player,"Clickspam",true)
	setTimer(function(player)
		if(isElement(player))then
			setElementData(player,"Clickspam",false)
		end
	end,1000,1,player)
end

-- [[ BREAKING NEWS ]] --

function createBreakingNews(text)
	for _,v in ipairs(getElementsByType("player"))do
		triggerClientEvent(v,"createBreakingNews",v,text)
	end
end

-- [[ WAS PASSIERT, WENN PED STIRBT ]] --

addEventHandler("onPedWasted",root,function(ammo,killer)
	if(killer)then
		if(getElementData(source,"RobPed") ~= true)then
			givePlayerWanteds(killer,2)
			outputChatBox(loc(killer,"sMain_7"),killer,255,255,0)
			setPlayerAchievement(killer,17)
		end
		setTimer(function(ped)
			destroyElement(ped)
		end,15000,1,source)
	end
end)