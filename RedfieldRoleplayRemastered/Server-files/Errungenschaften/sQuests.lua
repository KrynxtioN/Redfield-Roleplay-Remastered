-- [[ PEDS ERSTELLEN ]] --

local Counter = 0
local LastPedIDs = {}

function Questsystem.createPed()
	local PedID = math.random(1,#Questsystem["PedCoordinates"])
	local tbl = Questsystem["PedCoordinates"][PedID]
	if(not(LastPedIDs[PedID]))then
		Counter = Counter + 1
		table.insert(LastPedIDs,PedID)
		Questsystem.peds[PedID] = createPed(110,tbl[1],tbl[2],tbl[3],tbl[4])
		setElementData(Questsystem.peds[PedID],"QuestPedID",PedID)
		setElementData(Questsystem.peds[PedID],"QuestID",math.random(1,#Questsystem["Names"]))
		setElementData(Questsystem.peds[PedID],"Name",loc(_,"Errungenschaften_3"))
		if(Counter < 2)then
			Questsystem.createPed()
			setTimer(function()
				Counter = 0
				Questsystem.createPed()
			end,3600000,1)
		end
	else Questsystem.createPed() end
end
Questsystem.createPed()

-- [[ QUEST ANNEHMEN ]] --

addEvent("Questsystem.accept",true)
addEventHandler("Questsystem.accept",root,function()
	local QuestID = getElementData(client,"QuestID")
	local QuestPedID = getElementData(client,"QuestPedID")
	if(isElement(Questsystem.peds[QuestPedID]))then
		local result = dbPoll(dbQuery(handler,"SELECT * FROM quests WHERE Username = '"..getPlayerName(client).."' AND QuestID = '"..QuestID.."'"),-1)
		if(#result == 0)then
			destroyElement(Questsystem.peds[QuestPedID])
			infobox(client,loc(client,"Errungenschaften_4"),"info")
			dbExec(handler,"INSERT INTO quests (Username,QuestID,QuestStufe,Item,Menge) VALUES ('"..getPlayerName(client).."','"..QuestID.."','1','"..Questsystem["Names"][QuestID][3].."','"..Questsystem["Names"][QuestID][2].."')")
			triggerClientEvent(client,"setWindowDatas",client)
			triggerClientEvent(client,"newPlaySound",client,"QuestAccepted.mp3")
			outputLog(getPlayerName(client).." hat Quest Nr. "..QuestID.." angenommen.","Errungenschaften")
		else infobox(client,loc(client,"Errungenschaften_5"),"error")end
	else infobox(client,loc(client,"Errungenschaften_6"),"error")end
end)

-- [[ QUEST DATAS AUSGEBEN ]] --

function Questsystem.getDatas(player)
	local result = dbPoll(dbQuery(handler,"SELECT * FROM quests WHERE Username = '"..getPlayerName(client).."'"),-1)
	local tbl = {}
	
	if(#result >= 1)then
		for _,v in pairs(result)do
			if(v["QuestStufe"] > #Questsystem["Beschreibungen"][v["QuestID"]])then
				v["QuestStufe"] = "/"
			end
			table.insert(tbl,{Questsystem["Names"][v["QuestID"]][1],v["QuestStufe"],v["ID"]})
		end
	end
	triggerClientEvent(client,"Questsystem.setDatas",client,tbl)
end
addEvent("Questsystem.getDatas",true)
addEventHandler("Questsystem.getDatas",root,Questsystem.getDatas)

addEvent("Questsystem.getText",true)
addEventHandler("Questsystem.getText",root,function(id)
	local Aufgabe = Questsystem["Beschreibungen"][getPlayerData("quests","ID",id,"QuestID")][getPlayerData("quests","ID",id,"QuestStufe")]
	if(not(Aufgabe))then Aufgabe = "Quest erledigt." end
	local VerfuegbareAufgaben = #Questsystem["Beschreibungen"][getPlayerData("quests","ID",id,"QuestID")]
	local Belohnung,Menge = getPlayerData("quests","ID",id,"Item"),getPlayerData("quests","ID",id,"Menge")
	local text = loc(client,"Errungenschaften_7"):format(Aufgabe,VerfuegbareAufgaben,Belohnung,Menge)
	triggerClientEvent(client,"Questsystem.setText",client,text)
end)

-- [[ QUEST STUFE ERHÖHEN ]] --

function Questsystem.addStufe(player,id,stufe)
	local result = dbPoll(dbQuery(handler,"SELECT * FROM quests WHERE Username = '"..getPlayerName(player).."'"),-1)
	if(#result >= 1)then
		for _,v in pairs(result)do
			if(v["QuestID"] == tonumber(id))then
				if(stufe)then
					if(v["QuestStufe"] ~= tonumber(stufe))then
						return false
					end
				end
				dbExec(handler,"UPDATE quests SET QuestStufe = '"..v["QuestStufe"] + 1 .."' WHERE Username = '"..getPlayerName(player).."' AND QuestID = '"..id.."'")
				infobox(player,loc(player,"Errungenschaften_8"),"info")
				triggerClientEvent(player,"newPlaySound",player,"QuestFinished.mp3")
				break
			end
		end
	end
end

-- [[ BELOHNUNG FORDERN ]] --

addEvent("Questsystem.belohnung",true)
addEventHandler("Questsystem.belohnung",root,function(id)
	local stufen = getPlayerData("quests","ID",id,"QuestStufe")
	if(stufen > #Questsystem["Beschreibungen"][getPlayerData("quests","ID",id,"QuestID")])then
		local Belohnung,Menge = getPlayerData("quests","ID",id,"Item"),getPlayerData("quests","ID",id,"Menge")
		setElementData(client,Belohnung,getElementData(client,Belohnung)+Menge)
		infobox(client,loc(client,"Errungenschaften_9"):format(Belohnung,Menge),"info")
		dbExec(handler,"DELETE FROM quests WHERE ID = '"..id.."'")
		Questsystem.getDatas(client)
		triggerClientEvent(client,"newPlaySound",client,"Achievement.mp3")
		outputLog(getPlayerName(client).." hat für eine erledigte Quest "..Belohnung.." "..Menge.."x bekommen.","Errungenschaften")
		setPlayerStatus(client,3)
	else infobox(client,loc(client,"Errungenschaften_10"),"error")end
end)