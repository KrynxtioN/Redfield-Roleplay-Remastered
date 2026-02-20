setWeaponProperty(33,"poor","weapon_range",250)
setWeaponProperty(33,"std","weapon_range",250)
setWeaponProperty(33,"pro","weapon_range",200)
setWeaponProperty(31,"pro","weapon_range",100)
setWeaponProperty(31,"pro","accuracy",0.9)
setWeaponProperty(24,"pro","accuracy",1.6)

weaponDamages = {
	[0] = { [3] = 5, [4] = 5, [5] = 5, [6] = 5, [7] = 5, [8] = 5, [9] = 5 },
	[4] = { [3] = 10, [4] = 20, [5] = 5, [6] = 5, [7] = 5, [8] = 5, [9] = 20 }, 
	[8] = { [3] = 20, [4] = 20, [5] = 20, [6] = 20, [7] = 20, [8] = 20, [9] = 25 },
	[22] = { [3] = 10, [4] = 10, [5] = 8, [6] = 8, [7] = 8, [8] = 8, [9] = 15 }, 
	[23] = { [3] = 10, [4] = 10, [5] = 8, [6] = 8, [7] = 8, [8] = 8, [9] = 15 }, 
	[24] = { [3] = 49, [4] = 40, [5] = 29, [6] = 29, [7] = 35, [8] = 35, [9] = 75 }, 
	[25] = { [3] = 25, [4] = 25, [5] = 20, [6] = 20, [7] = 20, [8] = 20, [9] = 35 }, 
	[26] = { [3] = 30, [4] = 30, [5] = 20, [6] = 20, [7] = 20, [8] = 20, [9] = 40 }, 
	[27] = { [3] = 30, [4] = 30, [5] = 20, [6] = 20, [7] = 20, [8] = 20, [9] = 40 }, 
	[28] = { [3] = 8, [4] = 8, [5] = 5, [6] = 5, [7] = 5, [8] = 5, [9] = 10 }, 
	[29] = { [3] = 9, [4] = 9, [5] = 8, [6] = 8, [7] = 8, [8] = 8, [9] = 12 }, 
	[32] = { [3] = 8, [4] = 8, [5] = 5, [6] = 5, [7] = 5, [8] = 5, [9] = 10 }, 
	[30] = { [3] = 10, [4] = 10, [5] = 8, [6] = 8, [7] = 8, [8] = 8, [9] = 14 }, 
	[31] = { [3] = 9, [4] = 9, [5] = 7, [6] = 7, [7] = 7, [8] = 7, [9] = 12 }, 
	[33] = { [3] = 15, [4] = 15, [5] = 12, [6] = 12, [7] = 12, [8] = 12, [9] = 20 }, 
	[34] = { [3] = 15, [4] = 15, [5] = 12, [6] = 12, [7] = 12, [8] = 12, [9] = 200 }, 
	[35] = { [3] = 80, [4] = 80, [5] = 50, [6] = 50, [7] = 50, [8] = 50, [9] = 130 }, 
	[36] = { [3] = 80, [4] = 80, [5] = 50, [6] = 50, [7] = 50, [8] = 50, [9] = 130 }, 
	[37] = { [3] = 8, [4] = 8, [5] = 5, [6] = 5, [7] = 5, [8] = 5, [9] = 12 }, 
	[38] = { [3] = 8, [4] = 8, [5] = 6, [6] = 6, [7] = 6, [8] = 6, [9] = 12 }, 
	[16] = { [3] = 80, [4] = 80, [5] = 50, [6] = 50, [7] = 50, [8] = 50, [9] = 130 }, 
	[17] = { [3] = 5, [4] = 5, [5] = 5, [6] = 5, [7] = 5, [8] = 5, [9] = 5 }, 
	[18] = { [3] = 5, [4] = 5, [5] = 5, [6] = 5, [7] = 5, [8] = 5, [9] = 5 }, 
	[39] = { [3] = 100, [4] = 100, [5] = 100, [6] = 100, [7] = 100, [8] = 100, [9] = 100 }
}
Koerperteile = {
	[3] = "Rumpf",
	[4] = "Arsch",
	[5] = "Linker Arm",
	[6] = "Rechter Arm",
	[7] = "Linkes Bein",
	[8] = "Rechtes Bein",
	[9] = "Kopf",
}

-- [[ LEBEN ABZIEHEN ]] --

addEvent("damageCalcServer",true)
addEventHandler("damageCalcServer",root,function(attacker,weapon,bodypart,loss,player)
	triggerClientEvent(player,"showBloodFlash",player)
	local basicDMG = weaponDamages[weapon][bodypart]
	local x1,y1,z1 = getElementPosition(attacker)
	local x2,y2,z2 = getElementPosition(player)
	local dist = getDistanceBetweenPoints3D(x1,y1,z1,x2,y2,z2)
	local multiply = 1
	if(weapon == 24 and dist <= 1)then multiply = 0.5 end
	damagePlayer(player,basicDMG*multiply,attacker,weapon)
	if(getElementData(attacker,"ImGangwar") == true and getElementData(player,"ImGangwar") == true and getElementData(player,"ImGangwarGestorben") ~= true and tonumber(getElementData(attacker,"Fraktion")) ~= tonumber(getElementData(player,"Fraktion")))then
		triggerClientEvent(attacker,"showDMGAnzeige",attacker,getPlayerName(player),basicDMG*multiply,Koerperteile[bodypart])
		setElementData(attacker,"TemporaerGWDamage",getElementData(attacker,"TemporaerGWDamage")+basicDMG*multiply)
		setElementData(attacker,"GangwarDamage",getElementData(attacker,"GangwarDamage")+basicDMG*multiply)
	end
end)

function damagePlayer(player,amount,damager,weapon)
	local armor = getPedArmor(player)
	local health = getElementHealth(player)
	if(armor > 0)then
		if(armor >= amount)then
			setPedArmor(player,armor - amount)
		else
			setPedArmor(player,0)
			local amount = math.abs(armor - amount)
			setElementHealth(player,health - amount)
			if(getElementHealth(player) - amount <= 0)then
				killPed(player)
				checkStuffAfterDeath(damager,player)
			end
		end
	else
		if(health - amount <= 0)then
			killPed(player)
			checkStuffAfterDeath(damager,player)
		end
		setElementHealth(player,health - amount)
	end
end

function checkStuffAfterDeath(damager,player)
	if(getElementData(damager,"Lobby") == "Reallife")then
		setElementData(damager,"Kills",getElementData(damager,"Kills")+1)
		if(isEvil(damager))then
			if(isPlayerOnBlacklist(getPlayerName(player),getElementData(damager,"Fraktion")))then
				local Faction = getElementData(damager,"Fraktion")
				local result = getPlayerData("fraktionslager","ID",Faction,"Blacklist")
				local OnBlacklist = getPlayerData("fraktionslager","ID",Faction,"OnBlacklist")
				local newResult = ""
				infobox(player,loc(player,"Hitbox_3"):format(Fraktionssystem["Fraktionnamen"][Faction]),"info")
				for i = 1,OnBlacklist do
					local wstring = gettok(result,i,string.byte("|"))
					if(wstring ~= target)then
						newResult = newResult..target.."|"
					end
				end
				infobox(damager,loc(damager,"Hitbox_4"),"error")
				dbExec(handler,"UPDATE fraktionslager SET Blacklist = '"..newResult.."', OnBlacklist = '"..OnBlacklist-1 .."' WHERE ID = '"..Faction.."'")
				refreshBlacklist(Faction)
			end
		end
	end
	if(getElementData(damager,"ImGangwar") == true and getElementData(player,"ImGangwar") == true and getElementData(player,"ImGangwarGestorben") ~= true and tonumber(getElementData(damager,"Fraktion")) ~= tonumber(getElementData(player,"Fraktion")))then
		setElementData(damager,"TemporaerGWKills",getElementData(damager,"TemporaerGWKills")+1)
		setElementData(damager,"GangwarKills",getElementData(damager,"GangwarKills")+1)
	end
	setElementData(player,"ImGangwarGestorben",true)
	if(getElementData(damager,"Lobby") == "Reallife" and getElementData(player,"Lobby") == "Reallife")then
		if(isStateFaction(damager) and isStaatDuty(damager))then
			if(getElementData(player,"Wanteds") >= 1)then
				setElementData(player,"Jailtime",getElementData(player,"Wanteds")*4)
				infobox(damager,getPlayerName(player).." wurde eingesperrt!","info")
				infobox(player,loc(player,"Hitbox_5"):format(getPlayerName(damager),getElementData(player,"Wanteds")*4),"error")
				setElementData(player,"Wanteds",0)
				Polize["PaydayBonus"][getElementData(damager,"Fraktion")] = Polize["PaydayBonus"][getElementData(damager,"Fraktion")] + 1
			end
		end
	end
	if(getElementData(player,"Lobby") == "Deagle-Arena" and getElementData(damager,"Lobby") == "Deagle-Arena")then
		DeagleArena.streak[damager] = DeagleArena.streak[damager] + 1
		if(DeagleArena.streak[damager] >= 3)then
			setElementHealth(damager,100)
			setPedArmor(damager,100)
			DeagleArena.streak[damager] = 0
		end
	end
	if(getElementData(player,"Lobby") == "Reallife" and getElementData(damager,"Lobby") == "Deagle-Arena" and damager ~= player)then
		if(getElementData(damager,"Spielstunden") < 60)then
			dbExec(handler,"INSERT INTO bans (Username,Grund,STime) VALUES ('"..getPlayerName(damager).."','Neulings-sDM','0')")
			outputChatBox(getPlayerName(damager).." wurde vom System permanent gebannt! Grund: Neulings-sDM",root,125,0,0)
			kickPlayer(damager,"System","Neulings-sDM")
		end
	end
end

-- [[ WAFFE WEITERGEBEN ]] --

addCommandHandler("gweapon",function(player,cmd,target)
	if(getElementData(player,"loggedin") == 1)then
		if(target)then
			local target = getPlayerFromName(target)
			if(existPlayer(player,target))then
				local x,y,z = getElementPosition(target)
				if(getDistanceBetweenPoints3D(x,y,z,getElementPosition(player)) <= 5)then
					local weapon = getPedWeapon(player)
					local weaponAmmo = getPedTotalAmmo(player)
					if(weapon ~= nil)then
						takeWeapon(player,weapon)
						giveWeapon(target,weapon,weaponAmmo,true)
						infobox(player,loc(player,"Hitbox_6"):format(getPlayerName(target)),"info")
						infobox(target,loc(target,"Hitbox_7"):format(getPlayerName(player)),"info")
					end
				else infobox(player,loc(player,"Hitbox_8"),"error")end
			end
		else infobox(player,loc(player,"Hitbox_9"),"error")end
	end
end)

-- [[ WAFFEN TEMPORÄR SPEICHERN UND WIEDERGEBEN ]] --

local PlayerWeapons = {}
local PlayerHealth = {}

function savePlayerWeaponsTemporaer(player)
	PlayerWeapons[player] = {}
	PlayerHealth[player] = {getElementHealth(player),getPedArmor(player)}
	for i = 1,11 do
		if(i ~= 10)then
			local weapon = getPedWeapon(player,i)
			local ammo = getPedTotalAmmo(player,i)
			if(weapon and ammo)then
				if(weapon >= 1 and ammo >= 1)then
					table.insert(PlayerWeapons[player],{weapon,ammo})
				end
			end
		end
	end
end

function givePlayerWeaponsTemporaer(player)
	if(PlayerWeapons[player] and #PlayerWeapons[player] >= 1)then
		for _,v in pairs(PlayerWeapons[player])do
			giveWeapon(player,v[1],v[2],true)
		end
	end
	if(PlayerHealth[player][1] and PlayerHealth[player][2])then
		setElementHealth(player,PlayerHealth[player][1])
		setPedArmor(player,PlayerHealth[player][2])
	end
end