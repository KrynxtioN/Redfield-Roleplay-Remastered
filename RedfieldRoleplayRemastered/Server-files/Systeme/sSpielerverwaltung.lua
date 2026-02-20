-- [[ K/D ZURÜCKSETZEN ]] --

addEvent("Spielerverwaltung.kd",true)
addEventHandler("Spielerverwaltung.kd",root,function()
	if(hasMoney(client,250000))then
		takeMoney(client,250000)
		infobox(client,loc(client,"Systeme_245"),"info")
		setElementData(client,"Kills",0)
		setElementData(client,"Tode",0)
	end
end)

-- [[ SPAWNPUNKT ÄNDERN ]] --

addEvent("Spielerverwaltung.changeSpawn",true)
addEventHandler("Spielerverwaltung.changeSpawn",root,function(name)
	if(name == "Jetziger Standpunkt")then
		x,y,z = getElementPosition(client)
		int,dim = getElementInterior(client),getElementDimension(client)
	else
		if(name == "Fraktion" or name == "Unternehmen")then
			tbl = Spielerverwaltung["Spawns"][name][getElementData(client,name)]
			x,y,z,int,dim = tbl[1],tbl[2],tbl[3],tbl[4],tbl[5]
		else
			tbl = Spielerverwaltung["Spawns"][name]
			x,y,z,int,dim = tbl[1],tbl[2],tbl[3],tbl[4],tbl[5]
		end
	end
	dbExec(handler,"UPDATE accounts SET Spawnx = '"..x.."', Spawny = '"..y.."', Spawnz = '"..z.."', SpawnInterior = '"..int.."', SpawnDimension = '"..dim.."' WHERE Username = '"..getPlayerName(client).."'")
	infobox(client,loc(client,"Systeme_246"),"info")
end)

-- [[ NAME / PASSWORT ÄNDERN ]] --

addEvent("Spielerverwaltung.server",true)
addEventHandler("Spielerverwaltung.server",root,function(type,passwort,var)
	local hashedPassword = passwordHash(passwort,"bcrypt",{})
	if(passwordVerify(passwort,hashedPassword))then
		if(type == "Name ändern")then
			local result = dbPoll(dbQuery(handler,"SELECT * FROM accounts WHERE Username = '"..var.."'"),-1)
			if(#result == 0)then
				local result = dbPoll(dbQuery(handler,"SELECT * FROM nickchanges WHERE NeuerName = '"..var.."'"),-1)
				if(#result == 0)then
					local result = dbPoll(dbQuery(handler,"SELECT * FROM nickchanges WHERE Name = '"..getPlayerName(client).."'"),-1)
					if(#result == 0)then
						local spielstunden = getElementData(client,"Spielstunden")
						if(spielstunden <= 1500)then money = 0 else money = spielstunden*10 end
						if(hasMoney(client,money))then
							takeMoney(client,money)
							infobox(client,loc(client,"Systeme_247"),"info")
							dbExec(handler,"INSERT INTO nickchanges (Name,NeuerName,Status) VALUES ('"..getPlayerName(client).."','"..var.."','0')")
							for _,v in pairs(getElementsByType("player"))do
								if(getElementData(v,"Adminlevel") >= 6)then
									outputChatBox(loc(v,"Systeme_248"),v,255,255,255,true)
								end
							end
						end
					else infobox(client,loc(client,"Systeme_249"),"error")end
				else infobox(client,loc(client,"Systeme_250"),"error")end
			else infobox(client,loc(client,"Systeme_251"),"error")end
		else
			dbExec(handler,"UPDATE accounts SET Passwort = '"..passwordHash(var,"bcrypt",{}).."' WHERE Username = '"..getPlayerName(client).."'")
			infobox(client,loc(client,"Systeme_252"),"info")
		end
	else infobox(client,loc(client,"Systeme_253"),"error")end
end)

-- [[ BONUSCODE EINLÖSEN ]] --

local AktiveBonuscodes = {}
local TemporaerEingeloest = {}

addEvent("Spielerverwaltung.useBonuscode",true)
addEventHandler("Spielerverwaltung.useBonuscode",root,function(code)
	local result = dbPoll(dbQuery(handler,"SELECT * FROM bonuscodes WHERE code = '"..code.."'"),-1)
	if(#result >= 1)then
		local state = false
		local allUser = getPlayerData("bonuscodes","Code",code,"AllUser")
		local used = getPlayerData("bonuscodes","Code",code,"Used")
		for i = 1,used do
			local wstring = gettok(allUser,i,string.byte("|"))
			if(wstring == getPlayerName(client))then
				state = true
				break
			end
		end
		if(state == false)then
			if(not(TemporaerEingeloest[client]))then TemporaerEingeloest[client] = {} end
			--[[ if(code == "Serverumzug")then
				if(not(TemporaerEingeloest[client][code]))then
					
				end
			end]]--
			local allUser = allUser..getPlayerName(client).."|"
			infobox(client,loc(client,"Systeme_254"),"info")
			dbExec(handler,"UPDATE bonuscodes SET Used = '"..used + 1 .."', AllUser = '"..allUser.."' WHERE Code = '"..code.."'")
		else infobox(client,loc(client,"Systeme_255"),"error")end
	else infobox(client,loc(client,"Systeme_256"),"error")end
end)

function areBonuscodesActive(player)
	if(#AktiveBonuscodes >= 1)then
		local counter = 0
		local tbl = {}
		for _,v in pairs(AktiveBonuscodes)do
			local state = false
			local allUser = getPlayerData("bonuscodes","Code",v,"AllUser")
			local used = getPlayerData("bonuscodes","Code",v,"Used")
			for i = 1,used do
				local wstring = gettok(allUser,i,string.byte("|"))
				if(wstring == getPlayerName(player))then
					state = true
					break
				end
			end
			if(state == false)then
				counter = counter + 1
				table.insert(tbl,v)
			end
		end
		if(counter > 0)then
			outputChatBox(loc(player,"Systeme_257"),player,255,255,255)
			for _,v in pairs(tbl)do
				outputChatBox(v,player,200,200,0)
			end
		end
	end
end

-- [[ GEWORBENE SPIELER AUSGEBEN LASSEN ]] --

addEvent("Spielerverwaltung.getGeworbeneSpieler",true)
addEventHandler("Spielerverwaltung.getGeworbeneSpieler",root,function()
	local tbl = {}
	local result = dbPoll(dbQuery(handler,"SELECT * FROM accounts WHERE Werber = '"..getPlayerName(client).."'"),-1)
	if(#result >= 1)then
		for _,v in pairs(result)do
			table.insert(tbl,{v["Username"],v["Spielstunden"]})
		end
	end
	triggerClientEvent(client,"Spielerverwaltung.setGeworbeneSpieler",client,tbl)
end)