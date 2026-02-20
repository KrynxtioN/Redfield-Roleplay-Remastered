-- [[ TABELLEN ]] --

local Database = {"achievements","aussichtspunkte","status","graffitis","waffenbox","sammelobjekte"}

local Datas = {
	"TaucherPoints","TaucherLevel","OxygenFlasche","Taucheranzug","Hanfsamen","Gras","Angelhaken","Pokale","Level","Erfahrungspunkte","Angel","OnlineTime","OnlineTimeAFK","Graffitis","Aussichtspunkte","Adminlevel","WaffenscheinTheorie","WaffenscheinPraxis","Kreditkarte","Wanteds","Jailtime","Fraktion","Fraktionrang","Unternehmen","Unternehmenrang","Firma","Firmarang","Jobgehaltsbonus","Geld","Bankgeld","Pfandflaschen","Kills","Tode","Spielstunden","Aepfel","Apfelsamen","Orangen","Orangensamen","Hunger","Harndrang","Energie","Aids","Ostereier","Kuerbisse","Geschenke","Raketen","FraktionWarns","UnternehmenWarns","Repairkits","BewertungPositiv","BewertungMittel","BewertungSchlecht","Job","Jobmoney","FuehrerscheinPraxis","LKWScheinPraxis","Limonade","Koeder","Defusekits","Bomben","FirmaWarns","StVo","Autologin","ZugfuehrerPunkte","SozialerStatus","Gemuted","Schwarzpulver","Fisch","Wuerfel","Materialien","Kondome","Benzinkanister","Medikits","Handy","Casinochips","Burger","Huehnchen","Pizza","Ghostface","Holz","MotorradscheinPraxis","BootscheinPraxis","TraktorscheinPraxis","HelikopterscheinPraxis","FlugscheinAPraxis","FlugscheinBPraxis","Handynummer","Warns","BoxerPunkte","Intro","Tutorial","Prison","FuehrerscheinTheorie","MotorradscheinTheorie","BootscheinTheorie","TraktorscheinTheorie","HelikopterscheinTheorie","FlugscheinATheorie","FlugscheinBTheorie","PizzalieferantPunkte","BusfahrerPunkte","MeeresreinigerPunkte","PilotPunkte","MuellmannPunkte","PostbotePunkte","HolzfaellerPunkte","SchrottplatzmitarbeiterPunkte","FarmerPunkte","TaxifahrerPunkte","GabelstaplerfahrerPunkte","PANote","Muskeln","TutorialTask","TutorialFinished","Skin","Schulden","Ehepartner","ArchaeologenLexikon","Schutzmechanismus","Raketentreibstoff","Personalausweis","Arbeitsgenehmigung","Bankpin","Automatensprengkit","Mondsteine","Spitzhacke","Schatztruhe","Sammelkartenalbum","Bonuspunkte","WaffenskillsPistol","WaffenskillsShotgun","WaffenskillsMaschinenpistole","WaffenskillsSturmgewehr","President","Golderz","Goldbarren","HoehlenforscherPunkte","Futter","Wasser","Spielzeug","Medizin","BronzeTicket","SilverTicket","GoldTicket","RubinTicket","Zigaretten","Language","Craftingpanel","Hotdogs","Eis","Hitsound","GangwarDamage","GangwarKills","HUD","Scoreboard","Fett","PresidentGewaehlt","LastFraktionInvite","LastUnternehmenInvite","LastFirmaInvite","FraktionZivizeit","UnternehmenZivizeit","FirmaZivizeit"}
	
-- [[ DATAS AUS DATENBANK HOLEN ]] --

function getPlayerData(from,where,name,data)
	if(from and where and name and data)then
		local sql = dbQuery(handler,"SELECT * FROM "..from.." WHERE "..where.." = '"..name.."'")
		if(sql)then
			local rows = dbPoll(sql,-1)
			for _,v in pairs(rows)do
				return v[data]
			end
		end
	end
end
	
-- [[ CHECKEN OB ACCOUNT EXISTIERT ]] --

function checkAccount(player)
	local result = dbPoll(dbQuery(handler,"SELECT * FROM accounts WHERE Username = '"..getPlayerName(player).."'"),-1)
	if(#result >= 1)then type = "Einloggen" else type = "Registrieren" end
	triggerClientEvent(player,"Anmeldebereich.openWindow",player,type)
end
addEvent("checkAccount",true)
addEventHandler("checkAccount",root,checkAccount)

-- [[ REGISTRIEREN / EINLOGGEN ]] --

addEvent("Anmeldebereich.server",true)
addEventHandler("Anmeldebereich.server",root,function(password,type,werber,language)
	local hashedPassword = passwordHash(password,"bcrypt",{})
	
	if(type == "Einloggen")then
		local result = dbPoll(dbQuery(handler,"SELECT * FROM accounts WHERE Username = '"..getPlayerName(client).."'"),-1)
		if(#result >= 1)then
			if(passwordVerify(password,hashedPassword))then
				if(isPlayerBanned(client))then
					setPlayerDatasAfterLogin(client)
				end
			else infobox(client,loc(client,"Anmeldebereich_16"),"error")end
		else infobox(client,loc(client,"Anmeldebereich_17"),"error")end
	else
		local result = dbPoll(dbQuery(handler,"SELECT * FROM accounts WHERE Serial = '"..getPlayerSerial(client).."'"),-1)
		if(#result == 0)then
			if(werber and #werber >= 1)then
				local result = dbPoll(dbQuery(handler,"SELECT * FROM accounts WHERE Username = '"..werber.."'"),-1)
				if(#result == 0)then
					infobox(client,loc(client,"Anmeldebereich_18"),"error")
					return false
				end
			end
		
			for _,v in pairs(Database)do
				dbExec(handler,"INSERT INTO "..v.." (Username) VALUES ('"..getPlayerName(client).."')")
			end
			dbExec(handler,"INSERT INTO accounts (Username,Passwort,Serial,Werber,Language) VALUES ('"..getPlayerName(client).."','"..hashedPassword.."','"..getPlayerSerial(client).."','"..werber.."','"..language.."')")
			dbExec(handler,"INSERT INTO bewertungen (Username,Bewerter) VALUES ('"..getPlayerName(client).."','|')")
			CJSkinshop.saveClothes(client)
			setPlayerDatasAfterLogin(client)
			setPlayerAchievement(client,1)
		else infobox(client,loc(client,"Anmeldebereich_19"):format(getPlayerData("accounts","Serial",getPlayerSerial(client),"Username")),"error")end
	end
end)
	
-- [[ DATEN NACH EINLOGGEN SETZEN ]] --

function setPlayerDatasAfterLogin(player)
	for _,v in pairs(Datas)do
		setElementData(player,v,getPlayerData("accounts","Username",getPlayerName(player),v))
	end
	setElementData(player,"Lobby","Reallife")
	setElementData(player,"loggedin",1)
	if(getElementData(player,"Firma") >= 1)then
		setElementData(player,"FirmenName",getPlayerData("firma","ID",getElementData(player,"Firma"),"Name"))
	else
		setElementData(player,"FirmenName","- Keine -")
	end
	setElementData(player,"PlayerID",getPlayerData("accounts","Username",getPlayerName(player),"ID"))
	triggerClientEvent(player,"setWindowDatas",player)
	-- Binds
	bindKey(player,"F10","down",Achievements.openWindow)
	bindKey(player,"x","down",motor_func)
	bindKey(player,"l","down",licht_func)
	bindKey(player,"h","down",Gates.open)
	bindKey(player,"j","down",Haussystem.openWindow)
	bindKey(player,"f","down",Pflanzensystem.ernteHanf)
	bindKey(player,"2","down",Vehicles.park)
	bindKey(player,"f","down",Moebel.deleteObject)
	bindKey(player,"g","down",Vehicles.handbremse)
	bindKey(player,"k","down",Haussystem.klingeln)
	bindKey(player,"F3","down",function(player)
		if(getElementData(player,"Adminlevel") >= 1)then
			local result = dbPoll(dbQuery(handler,"SELECT * FROM schwarzesbrett"),-1)
			local tbl = {}
			for i,v in pairs(result)do
				table.insert(tbl,{i,v["Name"]})
			end
			triggerClientEvent(player,"Adminsystem.openWindow",player,tbl)
		end
	end)
	triggerClientEvent(player,"Tutorial.createNextTask",player)
	setPedFightingStyle(player,getPlayerData("accounts","Username",getPlayerName(player),"Kampfstil"))

	triggerClientEvent(player,"removeCamHandler",player)
	triggerClientEvent(player,"dxDrawHUD",player)
	spawnPlayerNew(player)
	loadPeds(player)
	Sammelobjekte.load(player)
	checkPrison(player)
	checkOfflinemessages(player)
	Moon.addTextures(player)
	Sprunk.setDatas(player)
	Gangtags.loadTextures(player)
	givePlayerWeaponskills(player)
	getSellFirmenFahrzeuge(player)
	RescueTeam.checkEinsatz(player)
	loadVehicles(getPlayerName(player))
	loadGangwarAnzeige(player)
	areBonuscodesActive(player)
	Fabrikwar.loadBlips(player)
	News.check(player)
	Events.isActive(player)
	loadBlacklist(player)
	checkNickchanges(player)
	
	setElementData(player,"AFK",false)
	Chatsystem.team[player] = createTeam(getPlayerName(player))
	setPlayerTeam(player,Chatsystem.team[player])
	setElementData(player,"Handystatus","on")
	setElementData(player,"Telefonpartner",false)
	setElementData(player,"WirdAngerufen",false)
	setElementData(player,"RuftAn",false)
	setElementData(player,"AnTelefonzelle",false)
	refreshFactionMemberBlips(getElementData(player,"Fraktion"))

	local result = dbPoll(dbQuery(handler,"SELECT Weapons FROM logout WHERE Username = '"..getPlayerName(player).."'"),-1)
	if(result and result[1])then
		local weapons = result[1]["Weapons"]
		dbExec(handler,"DELETE FROM logout WHERE Username = '"..getPlayerName(player).."'")
		for i = 1,12 do
			local wstring = gettok(weapons,i,string.byte("|"))
			if(wstring and #wstring >= 3)then
				local weapon = tonumber(gettok(wstring,1,string.byte(",")))
				local ammo = tonumber(gettok(wstring,2,string.byte(",")))
				giveWeapon(player,weapon,ammo,true)
			end
		end
	end
	
	if(getElementData(player,"Adminlevel") >= 1)then
		local result = dbPoll(dbQuery(handler,"SELECT * FROM books WHERE Freigeschaltet = '0'"),-1)
		if(#result >= 1)then
			if(#result > 1)then
				outputChatBox(loc(player,"Anmeldebereich_20"):format(#result),player,255,255,255,true)
			else
				outputChatBox(loc(player,"Anmeldebereich_21"),player,255,255,255,true)
			end
		end
	end

	Payday[player] = setTimer(function(player)
		if(isElement(player))then
			setElementData(player,"Spielstunden",getElementData(player,"Spielstunden")+1)
			setElementData(player,"OnlineTime",getElementData(player,"OnlineTime")+1)
			local result = dbPoll(dbQuery(handler,"SELECT * FROM booksausgeliehen WHERE Username = '"..getPlayerName(player).."'"),-1)
			if(#result >= 1)then
				for _,v in pairs(result)do
					local STime = v["STime"]
					if(STime ~= 0 and STime - getSecTime(0) <= 0)then
						outputChatBox(loc(player,"Anmeldebereich_22"):format(getPlayerData("books","ID",v["BookID"],v["Titel"])),player,255,255,255,true)
						dbExec(handler,"DELETE FROM booksausgeliehen WHERE ID = '"..v["ID"].."'")
					end
				end
			end
			if(math.random(1,3) == 2)then
				if(getElementData(player,"Hunger") > 0)then
					setElementData(player,"Hunger",getElementData(player,"Hunger")-1)
				end
			end
			if(math.random(1,4) == 1)then
				if(getElementData(player,"Energie") > 0)then
					setElementData(player,"Energie",getElementData(player,"Energie")-1)
				end
			end
			if(getElementData(player,"Hunger") <= 15)then
				outputChatBox(loc(player,"Anmeldebereich_23"),player,255,0,0,true)
			end
			if(getElementData(player,"Harndrang") >= 70)then
				outputChatBox(loc(player,"Anmeldebereich_24"),player,255,0,0,true)
			end
			if(getElementData(player,"Energie") <= 15)then
				outputChatBox(loc(player,"Anmeldebereich_25"),player,255,255,255,true)
			end
			if(getElementData(player,"Hunger") == 0)then
				killPed(player)
				outputChatBox(loc(player,"Anmeldebereich_26"),player,255,0,0,true)
				setElementData(player,"Hunger",5)
			end
			if(getElementData(player,"Harndrang") == 100)then
				killPed(player)
				outputChatBox(loc(player,"Anmeldebereich_27"),player,255,0,0,true)
				setElementData(player,"Harndrang",70)
			end
			if(getElementData(player,"Energie") == 0)then
				killPed(player)
				outputChatBox(loc(player,"Anmeldebereich_28"),player,255,255,255,true)
				setElementData(player,"Energie",5)
			end
			
			if(getElementData(player,"Muskeln") > 0)then setElementData(player,"Muskeln",getElementData(player,"Muskeln")-1) end
			if(getElementData(player,"Muskeln") == 0 and getElementData(player,"Fett") < 1000)then
				setElementData(player,"Fett",getElementData(player,"Fett")+1)
			end
			
			local playingtime = getElementData(player,"Spielstunden")
			if(playingtime == 1500 or playingtime == 3000 or playingtime == 6000 or playingtime == 15000 or playingtime == 30000)then
				local werber = getPlayerData("accounts","Username",getPlayerName(player),"Werber")
				if(werber ~= "")then
					local result = dbPoll(dbQuery(handler,"SELECT * FROM accounts WHERE Username = '"..werber.."'"),-1)
					if(#result >= 1)then
						local werberPlayer = getPlayerFromName(werber)
						if(existPlayer(_,werberPlayer))then
							setElementData(werberPlayer,"Geld",getElementData(werberPlayer,"Geld")+playingtime*15)
							outputChatBox(loc(werbePlayer,"Anmeldebereich_29"):format(playingtime*15,getPlayerName(player)),werberPlayer,255,255,255,true)
						else
							local money = getPlayerData("accounts","Username",werber,"Geld")
							dbExec(handler,"UPDATE accounts SET Geld = '"..money + playingtime*15 .."' WHERE Username = '"..werber.."'")
							offlinemessage(werber,loc(_,"Anmeldebereich_30",werber):format(playingtime*15,getPlayerName(player)))
						end
					end
				end
			end
			
			if(not(AFK[player]))then
				if(math.floor(getElementData(player,"Spielstunden")/60) == (getElementData(player,"Spielstunden")/60))then
					local Fraktionsgehalt = 0
					if(getElementData(player,"Fraktion") >= 1)then
						Fraktionsgehalt = getElementData(player,"Fraktionrang") * 500
						local FacMoney = getPlayerData("fraktionslager","ID",getElementData(player,"Fraktion"),"Geld")
						if(FacMoney >= Fraktionsgehalt)then Fraktionsgehalt = Fraktionsgehalt else Fraktionsgehalt = 0 end
						dbExec(handler,"UPDATE fraktionslager SET Geld = '"..FacMoney - Fraktionsgehalt.."' WHERE ID = '"..getElementData(player,"Fraktion").."'")
					end
					local Unternehmensgehalt = 0
					if(getElementData(player,"Unternehmen") >= 1)then
						Unternehmensgehalt = getElementData(player,"Unternehmenrang") * 200
						local UntMoney = getPlayerData("unternehmenlager","ID",getElementData(player,"Unternehmen"),"Geld")
						if(UntMoney >= Unternehmensgehalt)then Unternehmensgehalt = Unternehmensgehalt else Unternehmensgehalt = 0 end
						dbExec(handler,"UPDATE unternehmenlager SET Geld = '"..UntMoney - Unternehmensgehalt.."' WHERE ID = '"..getElementData(player,"Unternehmen").."'")
					end
					local Zinsen = math.floor(getElementData(player,"Bankgeld")/100*0.5)
					if(Zinsen > 10000)then Zinsen = 10000 end
					local Jobgehalt = getElementData(player,"Jobmoney")
					local Pokale = getElementData(player,"Pokale")*15
					local CompleteBonus = math.floor(Pokale)
					local CompleteMoney = Fraktionsgehalt + Unternehmensgehalt + Jobgehalt + CompleteBonus + Zinsen
					
					local counter = 0
					local result = dbPoll(dbQuery(handler,"SELECT * FROM vehicles WHERE Besitzer = '"..getPlayerName(player).."'"),-1)
					local costsProVehicle = 150
					if(#result >= 1)then
						for _,v in pairs(result)do
							counter = counter + 1
						end
					end
					if(counter >= 11)then costsProVehicle = 350 end
					local vehSteuern = counter * costsProVehicle
					local hotelCosts = 0
					
					for i = 1,9 do
						local mieter = Hotel.getPlayerKeys(i)
						for _,v in pairs(mieter)do
							if(v == getPlayerName(player))then
								hotelCosts = hotelCosts + getPlayerData("hotels","ID","MietePreis")
								if(getPlayerData("business","Databasename","Hotel"..i,"Besitzer") ~= "Niemand")then
									addBizKasse("Hotel"..i,getPlayerData("hotels","ID","MietePreis"))
								end
								break
							end
						end
					end
					
					local Miete = 0
					local result = dbPoll(dbQuery(handler,"SELECT * FROM houses"),-1)
					if(#result >= 1)then
						for _,v in pairs(result)do
							if(isMieter(player,v["ID"]))then
								Miete = Miete + getPlayerData("houses","ID",v["ID"],"Mietpreis")
								dbExec(handler,"UPDATE houses SET Hauskasse = '"..getPlayerData("houses","ID",v["ID"],"Hauskasse") + Miete.."' WHERE ID = '"..v["ID"].."'")
							end
						end
					end

					local CompleteCosts = vehSteuern + hotelCosts + Miete
					triggerClientEvent(player,"Payday.dxDraw",player,Fraktionsgehalt,Unternehmensgehalt,Jobgehalt,CompleteBonus,CompleteMoney,vehSteuern,CompleteCosts,Zinsen)
					
					local Schulden = tonumber(getElementData(player,"Schulden"))
					if(Schulden > 0)then
						if(Schulden >= CompleteMoney)then
							setElementData(player,"Schulden",getElementData(player,"Schulden") - CompleteMoney)
						else
							CompleteMoney = CompleteMoney - getElementData(player,"Schulden")
							setElementData(player,"Schulden",0)
							setElementData(player,"Bankgeld",getElementData(player,"Bankgeld") + CompleteMoney)
						end
					else
						setElementData(player,"Bankgeld",getElementData(player,"Bankgeld") + CompleteMoney)
					end
					
					local Bankgeld = tonumber(getElementData(player,"Bankgeld"))
					if(Bankgeld >= CompleteCosts)then
						setElementData(player,"Bankgeld",getElementData(player,"Bankgeld") - CompleteCosts)
					else
						CompleteCosts = CompleteCosts - getElementData(player,"Bankgeld")
						setElementData(player,"Bankgeld",0)
						setElementData(player,"Schulden",getElementData(player,"Schulden") + CompleteCosts)
					end
					setElementData(player,"Jobmoney",0)
					savePlayerDatas(player)
				end
			else
				setElementData(player,"OnlineTimeAFK",getElementData(player,"OnlineTimeAFK")+1)
			end
			if(getElementData(player,"Jailtime") > 0)then
				setElementData(player,"Jailtime",getElementData(player,"Jailtime")-1)
				if(getElementData(player,"Jailtime") == 0)then
					fadeElementInterior(player,0,0,-1605.1999511719,717.5,11.89999961853,0)
					infobox(player,loc(player,"Anmeldebereich_31"),"info")
					triggerClientEvent(player,"Staatsfraktionen.dxDraw",player)
				end
			end
		else
			if(isTimer(Payday[player]))then
				killTimer(Payday[player])
			end
		end
	end,60000,0,player)
	
	if(getElementData(player,"Intro") == 0)then
		setElementDimension(player,getFreeDimension())
		triggerClientEvent(player,"Intro.beginn",player)
	end
	
	if(getElementData(player,"Spielstunden") <= 60)then
		outputChatBox(loc(player,"Anmeldebereich_32"),player,255,255,255,true)
		outputChatBox(loc(player,"Anmeldebereich_33"),player,255,255,255,true)
	end
end

-- [[ SPIELER SPAWNEN ]] --

function spawnPlayerNew(player)
	spawnPlayer(player,getPlayerData("accounts","Username",getPlayerName(player),"Spawnx"),getPlayerData("accounts","Username",getPlayerName(player),"Spawny"),getPlayerData("accounts","Username",getPlayerName(player),"Spawnz"),getPlayerData("accounts","Username",getPlayerName(player),"Spawnrotz"),getPlayerData("accounts","Username",getPlayerName(player),"Skin"),getPlayerData("accounts","Username",getPlayerName(player),"SpawnInterior"),getPlayerData("accounts","Username",getPlayerName(player),"SpawnDimension"))
	setElementFrozen(player,false)
	setCameraTarget(player)
	Polizei.checkGefaengnis(player)
	CJSkinshop.setClothes(player)
end
addEvent("spawnPlayerNew",true)
addEventHandler("spawnPlayerNew",root,spawnPlayerNew)

-- [[ SPIELERDATEN SPEICHERN ]] --

function savePlayerDatas(player)
	if(getElementData(player,"loggedin") == 1)then
		for _,v in pairs(Datas)do
			dbExec(handler,"UPDATE accounts SET "..v.." = '"..getElementData(player,v).."' WHERE Username = '"..getPlayerName(player).."'")
		end
	end
end

-- [[ AUTOLOGIN CHECKEN ]] --

addEvent("checkAutologin",true)
addEventHandler("checkAutologin",root,function()
	if(isPlayerBanned(client))then
		if(getPlayerData("accounts","Username",getPlayerName(client),"Serial") == getPlayerSerial(client))then
			if(getPlayerData("accounts","Username",getPlayerName(client),"Autologin") == 1)then
				setPlayerDatasAfterLogin(client)
			else
				checkAccount(client)
			end
		end
	end
end)

-- [[ WAFFENSKILLS SETZEN ]] --

function givePlayerWeaponskills(player)
	if(getElementData(player,"WaffenskillsPistol") == 1 or getElementData(player,"Lobby") == "Deagle-Arena")then
		setPedStat(player,69,1000)
		setPedStat(player,70,1000)
		setPedStat(player,71,1000)
	else
		setPedStat(player,69,0)
		setPedStat(player,70,0)
		setPedStat(player,71,0)
	end
	if(getElementData(player,"WaffenskillsShotgun") == 1 or getElementData(player,"Lobby") == "Deagle-Arena")then
		setPedStat(player,72,1000)
		setPedStat(player,73,1000)
		setPedStat(player,74,1000)
	else
		setPedStat(player,72,0)
		setPedStat(player,73,0)
		setPedStat(player,74,0)
	end
	if(getElementData(player,"WaffenskillsMaschinenpistole") == 1 or getElementData(player,"Lobby") == "Deagle-Arena")then
		setPedStat(player,75,1000)
		setPedStat(player,76,1000)
	else
		setPedStat(player,75,0)
		setPedStat(player,76,0)
	end
	if(getElementData(player,"WaffenskillsSturmgewehr") == 1 or getElementData(player,"Lobby") == "Deagle-Arena")then
		setPedStat(player,77,1000)
		setPedStat(player,78,1000)
		setPedStat(player,79,1000)
	else
		setPedStat(player,77,0)
		setPedStat(player,78,0)
		setPedStat(player,79,0)
	end
end
addEvent("givePlayerWeaponskills",true)
addEventHandler("givePlayerWeaponskills",root,givePlayerWeaponskills)

-- [[ PINKELN ]] --

local PissTimer = {}

function pissen(player)
	if(getElementData(player,"Harndrang") >= 1)then
		if(not(isTimer(PissTimer[player])))then
			setElementFrozen(player,true)
			setPedAnimation(player,"paulnmac","piss_loop")
			PissTimer[player] = setTimer(function(player)
				if(isElement(player))then
					setElementFrozen(player,false)
					setPedAnimation(player)
					setElementData(player,"Harndrang",0)
					setPlayerAchievement(player,26)
				end
			end,7500,1,player)
			local x,y,z = getElementPosition(player)
			local rx,ry,rz = getElementRotation(player)
			for _,v in pairs(getElementsByType("player"))do
				triggerServerEvent(v,"createUrin",v,x,y,z,rz)
			end
		else infobox(player,"Du urinierst bereits!","error")end
	else infobox(player,"Du musst noch nicht urinieren!","error")end
end
addCommandHandler("piss",pissen)

-- [[ SCHLAFEN ]] --

local SleepTimer = {}

function sleep(player)
	if(getElementData(player,"Energie") < 100)then
		if(not(isTimer(SleepTimer[player])))then
			if(isPedInVehicle(player))then
				local veh = getPedOccupiedVehicle(player)
				fadeCamera(player,false)
				toggleAllControls(player,false)
				SleepTimer[player] = setTimer(function(player,veh)
					if(isElement(player))then
						fadeCamera(player,true)
						toggleAllControls(player,true)
						setElementData(player,"Energie",100)
						setPlayerAchievement(player,27)
					end
				end,7500,1,player,veh)
			else infobox(player,"Nur in einem Fahrzeug möglich!","error")end
		else infobox(player,"Du schläfst bereits!","error")end
	else infobox(player,"Du bist noch fit!","error")end
end
addCommandHandler("sleep",sleep)