-- [[ HAT SPIELER ADMINLEVEL? ]] --

function isAdminLevel(player,level,targetLevel)
	local adminlevel = tonumber(getElementData(player,"Adminlevel"))
	if(adminlevel >= level and targetLevel <= adminlevel)then
		return true
	else
		infobox(player,loc(player,"Adminsystem_93"),"error")
		return false
	end
end

-- [[ ALLGEMEINE FUNKTIONEN ]] --

-- Kicken
addEvent("Adminsystem.kicken",true)
addEventHandler("Adminsystem.kicken",root,function(target,reason)
	local target = getPlayerFromName(target)
	if(existPlayer(client,target))then
		if(isAdminLevel(client,2,getElementData(target,"Adminlevel")))then
			outputLog(getPlayerName(target).." wurde von "..getPlayerName(client).." gekickt! Grund: "..reason,"Adminsystem")
			infobox(client,loc(client,"Adminsystem_94"):format(getPlayerName(target)),"error")
			for _,v in pairs(getElementsByType("player"))do
				if(getElementData(v,"loggedin") == 1)then
					 outputChatBox(loc(v,"Adminsystem_95"):format(getPlayerName(target),getPlayerName(client)),v,root,125,0,0)
				end
			end
			kickPlayer(target,client,reason)
		end
	end
end)

-- Bannen
addEvent("Adminsystem.bannen",true)
addEventHandler("Adminsystem.bannen",root,function(target,reason,time)
	local target = getPlayerFromName(target)
	if(existPlayer(client,target))then
		if(isAdminLevel(client,2,getElementData(target,"Adminlevel")))then
			if(time == 0)then
				for _,v in pairs(getElementsByType("player"))do
					if(getElementData(v,"loggedin") == 1)then
						outputChatBox(loc(v,"Adminsystem_96"):format(getPlayerName(target),getPlayerName(client),reason),v,125,0,0)
					end
				end
				outputLog(getPlayerName(target).." wurde von "..getPlayerName(client).." permanent gebannt! Grund: "..reason,"Adminsystem")
			else
				for _,v in pairs(getElementsByType("player"))do
					if(getElementData(v,"loggedin") == 1)then
						outputChatBox(loc(v,"Adminsystem_97"):format(getPlayerName(target),getPlayerName(client),time,reason),v,125,0,0)
					end
				end
				outputLog(getPlayerName(target).." wurde von "..getPlayerName(player).." für "..time.." Stunden gebannt! Grund: "..reason,"Adminsystem")
			end
			if(time == 0)then time = 0 else time = getSecTime(time)end
			dbExec(handler,"INSERT INTO bans (Username,Grund,STime) VALUES ('"..getPlayerName(target).."','"..reason.."','"..time.."')")
			kickPlayer(target,client,loc(target,"Adminsystem_98"):format(reason))
		end
	end
end)

-- Zum Spieler teleportieren
addEvent("Adminsystem.teleportToPlayer",true)
addEventHandler("Adminsystem.teleportToPlayer",root,function(target)
	local target = getPlayerFromName(target)
	if(existPlayer(client,target))then
		if(not(isPedInVehicle(target)))then
			local x,y,z = getElementPosition(target)
			setElementPosition(client,x+1,y,z)
			setElementInterior(client,getElementInterior(target))
			setElementDimension(client,getElementDimension(target))
		else
			local veh = getPedOccupiedVehicle(target)
			warpPedIntoVehicle(client,veh)
		end
		outputLog(getPlayerName(client).." hat sich zu "..getPlayerName(target).." teleportiert.","Adminsystem")
	end
end)

-- Spieler zu dir teleportieren
addEvent("Adminsystem.teleportPlayerToYou",true)
addEventHandler("Adminsystem.teleportPlayerToYou",root,function(target)
	local target = getPlayerFromName(target)
	if(existPlayer(client,target))then
		local x,y,z = getElementPosition(client)
		if(not(isPedInVehicle(client)))then
			setElementPosition(target,x+1,y,z)
			setElementInterior(target,getElementInterior(client))
			setElementDimension(target,getElementDimension(client))
		else
			local veh = getPedOccupiedVehicle(client)
			setElementPosition(veh,x+1,y,z)
		end
		outputLog(getPlayerName(client).." hat "..getPlayerName(target).." zu sich teleportiert.","Adminsystem")
	end
end)

-- Adminlevel vergeben
addEvent("Adminsystem.giveAdminlevel",true)
addEventHandler("Adminsystem.giveAdminlevel",root,function(target,level)
	local target = getPlayerFromName(target)
	local level = tonumber(level)
	if(existPlayer(client,target))then
		if(isAdminLevel(client,9,getElementData(target,"Adminlevel")))then
			if(Adminsystem["Names"][level])then
				setElementData(target,"Adminlevel",tonumber(level))
				infobox(client,loc(client,"Adminsystem_99"):format(getPlayerName(target),level),"info")
				infobox(target,loc(target,"Adminsystem_100"):format(level),"info")
				outputLog(getPlayerName(client).." hat das Adminlevel von "..getPlayerName(target).." auf "..level.." gesetzt.","Adminsystem")
			else infobox(client,loc(client,"Adminsystem_101"),"error")end
		end
	end
end)

-- Warn vergeben
addEvent("Adminsystem.giveWarn",true)
addEventHandler("Adminsystem.giveWarn",root,function(target,reason)
	local target = getPlayerFromName(target)
	if(existPlayer(client,target))then
		if(isAdminLevel(client,6,getElementData(target,"Adminlevel")))then
			outputChatBox(loc(target,"Adminsystem_102"):format(getPlayerName(client),reason),target,125,0,0)
			infobox(client,loc(client,"Adminsystem_103"):format(getPlayerName(target)),"info")
			setElementData(target,"Warns",getElementData(target,"Warns")+1)
			outputLog(getPlayerName(client).." hat "..getPlayerName(target).." einen Warn gegeben! Grund: "..reason,"Adminsystem")
			if(getElementData(target,"Warns") >= 5)then
				outputLog(getPlayerName(target).." wurde aufgrund von zu vielen Warns vom System gebannt!","Adminsystem")
				for _,v in pairs(getElementsByType("player"))do
					if(getElementData(v,"loggedin") == 1)then
						outputChatBox(loc(v,"Adminsystem_104"):format(getPlayerName(target)),v,125,0,0)
					end
				end
				dbExec(handler,"INSERT INTO bans (Username,Grund,STime) VALUES ('"..getPlayerName(target).."','5 Warns','0')")
				kickPlayer(target,"System",loc(target,"Adminsystem_105"))
			end
		end
	end
end)

-- Warn entfernen
addEvent("Adminsystem.removeWarn",true)
addEventHandler("Adminsystem.removeWarn",root,function(target,reason)
	local target = getPlayerFromName(target)
	if(existPlayer(client,target))then
		if(isAdminLevel(client,6,getElementData(target,"Adminlevel")))then
			if(getElementData(target,"Warns") >= 1)then
				outputChatBox(loc(target,"Adminsystem_106"):format(getPlayerName(client)),target,125,0,0)
				infobox(client,loc(client,"Adminsystem_107"):format(getPlayerName(target)),"info")
				setElementData(target,"Warns",getElementData(target,"Warns")-1)
				outputLog(getPlayerName(client).." hat "..getPlayerName(target).." einen Warn entfernt!","Adminsystem")
			else infobox(client,loc(client,"Adminsystem_108"),"error")end
		end
	end
end)

-- Spectaten
addEvent("Adminsystem.spectaten",true)
addEventHandler("Adminsystem.spectaten",root,function(target)
	local target = getPlayerFromName(target)
	if(existPlayer(client,target))then
		if(isAdminLevel(client,2,getElementData(target,"Adminlevel")))then
			if(getElementData(client,"Spectated") == true)then
				setCameraTarget(client)
				setElementFrozen(client,false)
				setElementData(client,"Spectated",false)
				outputLog(getPlayerName(client).." hat "..getPlayerName(server).." gespectet.","Adminsystem")
			else
				setCameraTarget(client,target)
				setElementFrozen(client,true)
				setElementData(client,"Spectated",true)
			end
		end
	end
end)

-- Chat leeren
addEvent("Adminsystem.clearChat",true)
addEventHandler("Adminsystem.clearChat",root,function()
	clearChatBox()
	infobox(client,loc(client,"Adminsystem_109"),"info")
	outputLog(getPlayerName(client).." hat den Chat geleert.","Adminsystem")
end)

-- Zum Fahrzeug teleportieren
addEvent("Adminsystem.teleportToVehicle",true)
addEventHandler("Adminsystem.teleportToVehicle",root,function(id)
	local id = tonumber(id)
	if(isElement(Vehicles[id]))then
		local x,y,z = getElementPosition(Vehicles[id])
		setElementPosition(client,x,y,z)
		setElementInterior(client,getElementInterior(Vehicles[id]))
		setElementDimension(client,getElementDimension(Vehicles[id]))
		outputLog(getPlayerName(client).." hat sich zu Fahrzeug "..id.." teleportiert.","Adminsystem")
	else infobox(client,loc(client,"Adminsystem_110"),"error")end
end)

-- Fahrzeug zu dir teleportieren
addEvent("Adminsystem.teleportVehicleToYou",true)
addEventHandler("Adminsystem.teleportVehicleToYou",root,function(id)
	local id = tonumber(id)
	if(isElement(Vehicles[id]))then
		local x,y,z = getElementPosition(client)
		setElementPosition(Vehicles[id],x,y,z)
		setElementInterior(Vehicles[id],getElementInterior(client))
		setElementDimension(Vehicles[id],getElementDimension(client))
		outputLog(getPlayerName(client).." hat das Fahrzeug "..id.." zu sich teleportiert.","Adminsystem")
	end
end)

-- Leader vergeben
addEvent("Adminsystem.setLeader",true)
addEventHandler("Adminsystem.setLeader",root,function(target,type,id)
	local target = getPlayerFromName(target)
	if(isAdminLevel(client,7,getElementData(target,"Adminlevel")))then
		if(existPlayer(client,target))then
			local id = tonumber(id)
			if(Fraktionssystem["Fraktion"][id] or Fraktionssystem["Unternehmen"][id])then
				setElementData(target,type,id)
				setElementData(target,type.."rang",5)
				infobox(target,loc(target,"Adminsystem_111"):format(Fraktionssystem[type.."namen"][id]),"info")
				infobox(client,loc(client,"Adminsystem_112"):format(getPlayerName(target),Fraktionssystem[type.."namen"][id]),"info")
				dbExec(handler,"UPDATE accounts SET "..type.." = '"..getElementData(target,type).."', "..type.."rang = '"..getElementData(target,type.."rang").."' WHERE Username = '"..getPlayerName(target).."'")
				if(type == "Fraktion")then
					if(id > 0)then
						if(id > 3)then
							giveFactionSkin(target)
						end
					else
						setElementModel(target,0)
						setElementData(target,"Skin",getElementModel(target))
						CJSkinshop.setClothes(target)
					end
					refreshFactionMemberBlips(id)
				end
				outputLog(getPlayerName(client).." hat "..getPlayerName(target).." zum Leader der/des "..Fraktionssystem[type.."namen"][id].." ernannt.","Adminsystem")
			else infobox(client,loc(client,"Adminsystem_113"),"error")end
		end
	end
end)

-- Ins Prison sperren
addEvent("Adminsystem.setPrison",true)
addEventHandler("Adminsystem.setPrison",root,function(target,type,marker,reason)
	local target = getPlayerFromName(target)
	if(existPlayer(client,target))then
		if(isAdminLevel(client,2,getElementData(target,"Adminlevel")))then
			setElementData(target,"Prison",getElementData(target,"Prison")+marker)
			infobox(client,loc(client,"Adminsystem_114"),"info")
			for _,v in pairs(getElementsByType("player"))do
				if(getElementData(v,"loggedin") == 1)then
					outputChatBox(loc(v,"Adminsystem_115"):format(getPlayerName(target),getPlayerName(client),marker,reason),v,root,125,0,0)
				end
			end
			if(getElementData(target,"AlreadyInPrison") ~= true)then
				checkPrison(target)
			end
			outputLog(getPlayerName(client).." hat "..getPlayerName(target).." für "..marker.." Marker ins Prison gesperrt! Grund: "..reason,"Adminsystem")
		end
	end
end)

-- Aus dem Prison entlassen
addEvent("Adminsystem.ausPrisonEntlassen",true)
addEventHandler("Adminsystem.ausPrisonEntlassen",root,function(target)
	local target = getPlayerFromName(target)
	if(existPlayer(client,target))then
		if(isAdminLevel(client,6,getElementData(target,"Adminlevel")))then
			if(getElementData(target,"Prison") >= 1)then
				setElementData(target,"Prison",0)
				infobox(target,loc(target,"Adminsystem_116"),"info")
				infobox(client,loc(client,"Adminsystem_117"):format(getPlayerName(target)),"info")
				fadeElementInterior(target,0,0,-1605.1999511719,717.5,11.89999961853,0)
				outputLog(getPlayerName(client).." hat "..getPlayerName(target).." aus dem Prison entlassen.","Adminsystem")
			else infobox(client,loc(client,"Adminsystem_118"),"error")end
		end
	end
end)

-- [[ LOGS AUSGEBEN ]] --

addEvent("getLogText",true)
addEventHandler("getLogText",root,function(name)
	if(fileExists("XML/"..name..".xml"))then
		local file = fileOpen("XML/"..name..".xml")
		local buffer = fileRead(file,999999999999)
		triggerClientEvent(client,"setLogText",client,buffer)
		fileClose(file)
	else
		triggerClientEvent(client,"setLogText",client,loc(client,"Adminsystem_119"))
	end
end)

-- [[ TEXT VON SCHWARZEN BRETTERN KRIEGEN / AKTUALISIEREN ]] --

addEvent("getBrettText",true)
addEventHandler("getBrettText",root,function(id)
	triggerClientEvent(client,"setBrettText",client,getPlayerData("schwarzesbrett","ID",id,"Text"))
end)

addEvent("setBrettText",true)
addEventHandler("setBrettText",root,function(id,text)
	dbExec(handler,"UPDATE schwarzesbrett SET Text = ? WHERE ID = ?",text,id)
	infobox(client,loc(client,"Adminsystem_120")"info")
end)

-- [[ PRISON-CHECK / ENTLASSUNG ]] --

function checkPrison(player)
	if(getElementData(player,"Prison") >= 1)then
		removePedFromVehicle(player)
		setElementPosition(player,-1369.9368896484,934.69317626953,1036.36328125)
		setElementInterior(player,15)
		setPedRotation(player,0)
		triggerClientEvent(player,"Prison.client",player)
		setElementData(player,"AlreadyInPrison",true)
		triggerClientEvent(player,"Prison.createDxDraw",player,"create")
	end
end

addEvent("Prison.server",true)
addEventHandler("Prison.server",root,function()
	fadeElementInterior(client,0,0,-1605.1999511719,717.5,11.89999961853,0)
	setElementData(client,"AlreadyInPrison",false)
	triggerClientEvent(client,"Prison.createDxDraw",client,"destroy")
end)

-- [[ ADMINMODUS ]] --

addCommandHandler("amode",function(player)
	if(getElementData(player,"Adminlevel") >= 1)then
		if(getElementData(player,"RedfieldAdminmodus") ~= true)then
			setElementData(player,"RedfieldAdminmodus",true)
			infobox(player,loc(player,"Adminsystem_121"),"info")
			setElementModel(player,260)
		else
			setElementData(player,"RedfieldAdminmodus",false)
			infobox(player,loc(player,"Adminsystem_122"),"error")
			if(isStaatDuty(player))then
				giveFactionSkin(player)
			else
				setElementModel(player,getElementData(player,"Skin"))
			end
		end
	end
end)

-- [[ ALLE DATEN SPEICHERN ]] --

addCommandHandler("saveall",function(player)
	if(getElementData(player,"Adminlevel") >= 1)then
		for _,v in pairs(getElementsByType("player"))do
			savePlayerDatas(v)
		end
		outputDebugString("Alle Daten gespeichert.")
	end
end)

-- [[ LEADER SETZEN ]] --

addCommandHandler("makeleader",function(player,cmd,target,type,id)
	if(getElementData(player,"Adminlevel") >= 1)then
		if(target and type and id)then
			local target = getPlayerFromName(target)
			if(isAdminLevel(player,7,getElementData(target,"Adminlevel")))then
				if(existPlayer(player,target))then
					local id = tonumber(id)
					if(type == "fraktion")then type = "Fraktion" elseif(type == "unternehmen")then type = "Unternehmen" end
					if(Fraktionssystem[type][id])then
						setElementData(target,type,id)
						setElementData(target,type.."rang",5)
						infobox(target,loc(target,"Adminsystem_123"):format(Fraktionssystem[type.."namen"][id]),"info")
						infobox(player,loc(player,"Adminsystem_124"):format(Fraktionssystem[type.."namen"][id]),"info")
						outputChatBox(loc(ownerName,"Adminsystem_152"):format(id,reason,model),ownerName,255,255,255,true)
						dbExec(handler,"UPDATE accounts SET "..type.." = '"..getElementData(target,type).."', "..type.."rang = '"..getElementData(target,type.."rang").."' WHERE Username = '"..getPlayerName(target).."'")
						if(type == "Fraktion")then
							if(id > 0)then
								if(id > 3)then
									giveFactionSkin(target)
								end
							else
								setElementModel(target,0)
								setElementData(target,"Skin",getElementModel(target))
								CJSkinshop.setClothes(target)
							end
							refreshFactionMemberBlips(id)
						end
						outputLog(getPlayerName(player).." hat "..getPlayerName(target).." zum Leader der/des "..Fraktionssystem[type.."namen"][id].." ernannt.","Adminsystem")
					else infobox(player,loc(player,"Adminsystem_125"),"error")end
				end
			end
		else infobox(player,loc(player,"Adminsystem_126"),"error")end
	end
end)

-- [[ REPORT ]] --

function report_func(player,cmd,...)
	local parametersTable = {...}
	local stringWithAllParameters = table.concat(parametersTable," ")
	if(stringWithAllParameters == nil)then
		infobox(player,loc(player,"Adminsystem_127"),"error")
	elseif(stringWithAllParameters == "" or stringWithAllParameters == " " or stringWithAllParameters == "  ")then
		infobox(player,loc(player,"Adminsystem_128"),"error")
	else
		local counter
		for _,v in pairs(getElementsByType("player"))do
			if(getElementData(v,"loggedin") == 1)then
				if(tonumber(getElementData(v,"Adminlevel")) >= 1)then
					outputChatBox(loc(v,"Adminsystem_129"):format(getPlayerName(player),getElementData(player,"PlayerID")),v,255,255,255,true)
					outputChatBox(stringWithAllParameters,v,255,255,255)
					counter = true
				end
			end
		end
		if(counter)then
			infobox(player,loc(player,"Adminsystem_130"),"info")
		else infobox(player,loc(player,"Adminsystem_131"),"error")end
	end
end
addCommandHandler("report",report_func)

function whisper_func(player,cmd,number,...)
	local parametersTable = {...}
	local stringWithAllParameters = table.concat(parametersTable," ")
	local number = tonumber(number)
	if(getElementData(player,"Adminlevel") >= 1)then
		if(stringWithAllParameters == nil)then
			infobox(player,loc(player,"Adminsystem_132"),"error")
		else
			local target
			for _,v in pairs(getElementsByType("player"))do
				if(getElementData(v,"PlayerID") == number)then
					if(existPlayer(_,v))then
						target = v
						break
					end
				end
			end
			if(isElement(target))then
				outputChatBox(loc(target,"Adminsystem_133"):format(getPlayerName(player),stringWithAllParameters),target,255,255,255,true)
				outputChatBox(loc(target,"Adminsystem_134"),target,255,255,255)
				infobox(player,loc(player,"Adminsystem_135"),"info")
				for _,v in pairs(getElementsByType("player"))do
					if(tonumber(getElementData(v,"Adminlevel")) >= 1)then
						outputChatBox(loc(v,"Adminsystem_136"):format(getPlayerName(player),getPlayerName(target)),v,255,255,255,true)
					end
				end
				setElementData(target,"supporter",player)
				setElementData(target,"isInSupport",true)
			else infobox(player,loc(player,"Adminsystem_137"),"error")end
		end
	end
end
addCommandHandler("w",whisper_func)

function reply_func(player,cmd,...)
	local parametersTable = {...}
	local stringWithAllParameters = table.concat(parametersTable," ")
	if(getElementData(player,"isInSupport"))then
		local supporter = getElementData(player,"supporter")
		if(existPlayer(player,supporter))then
			outputChatBox(loc(supporter,"Adminsystem_138"):format(getPlayerName(player),getElementData(player,"PlayerID"),stringWithAllParameters),supporter,200,200,0)
			infobox(player,loc(player,"Adminsystem_139"):format(getPlayerName(supoorter)),"info")
		end
	end
end
addCommandHandler("reply",reply_func)

-- [[ RANG SETZEN ]] --

addCommandHandler("setrank",function(player,cmd,target,type,rang)
	if(getElementData(player,"Adminlevel") >= 7)then
		if(target and type and rang)then
			local target = getPlayerFromName(target)
			if(existPlayer(player,target))then
				local rang = tonumber(rang)
				if(type == "fraktion")then type = "Fraktion" elseif(type == "unternehmen")then type = "Unternehmen" elseif(type == "firma")then type = "Firma" end
				if(getElementData(target,type) > 0)then
					setElementData(target,type.."rang",rang)
					infobox(target,loc(target,"Adminsystem_137"):format(getPlayerName(player),rang,type),"info")
					infobox(player,loc(player,"Adminsystem_138"):format(getPlayerName(target),rang,type),"info")
					outputLog(getPlayerName(player).." hat "..getPlayerName(target).." Rang "..rang.." in seiner/seinem "..type.." gegeben.","Adminsystem")
				else infobox(player,loc(player,"Adminsystem_139"):format(type),"error")end
			end
		else infobox(player,loc(player,"Adminsystem_140"),"error")end
	end
end)

-- [[ NAMENSÄNDERUNGEN ]] --

function checkNickchanges(player)
	if(getElementData(player,"Adminlevel") >= 6)then
		local result = dbPoll(dbQuery(handler,"SELECT * FROM nickchanges"),-1)
		if(#result >= 1)then
			if(#result == 1)then
				outputChatBox(loc(player,"Adminsystem_141"),player,255,255,255,true)
			else
				outputChatBox(loc(player,"Adminsystem_142"),player,255,255,255,true)
			end
		end
	end
end

addCommandHandler("nickchanges",function(player)
	if(getElementData(player,"loggedin") == 1 and getElementData(player,"Adminlevel") >= 6)then
		local tbl = {}
		local result = dbPoll(dbQuery(handler,"SELECT * FROM nickchanges"),-1)
		if(#result >= 1)then
			for _,v in pairs(result)do
				table.insert(tbl,{v["ID"],v["Name"],v["NeuerName"]})
			end
			triggerClientEvent(player,"Adminsystem.openNickchanges",player,tbl)
		else infobox(player,loc(player,"Adminsystem_143"),"error")end
	end
end)

addEvent("Nickchange.accept",true)
addEventHandler("Nickchange.accept",root,function(type,id)
	if(getElementData(client,"loggedin") == 1 and getElementData(client,"Adminlevel") >= 6)then
		local id = tonumber(id)
		local result = dbPoll(dbQuery(handler,"SELECT * FROM nickchanges WHERE ID = '"..id.."'"),-1)
		if(#result >= 1)then
			local Name = getPlayerData("nickchanges","ID",id,"Name")
			local target = getPlayerFromName(Name)
			if(type == "Annehmen")then
				local NeuerName = getPlayerData("nickchanges","ID",id,"NeuerName")
				if(isElement(target))then
					setPlayerName(target,NeuerName)
					if(getElementData(target,"loggedin") == 1)then
						outputChatBox(loc(target,"Adminsystem_144"),target,255,255,255,true)
					else
						offlinemessage(Name,loc(_,"Adminsystem_145",Name))
					end
				else
					offlinemessage(Name,loc(_,"Adminsystem_146",Name))
				end
				dbExec(handler,"UPDATE accounts SET Username = '"..NeuerName.."' WHERE Username = '"..Name.."'")
				dbExec(handler,"UPDATE achievements SET Username = '"..NeuerName.."' WHERE Username = '"..Name.."'")
				dbExec(handler,"UPDATE aussichtspunkte SET Username = '"..NeuerName.."' WHERE Username = '"..Name.."'")
				dbExec(handler,"UPDATE bewertungen SET Username = '"..NeuerName.."' WHERE Username = '"..Name.."'")
				dbExec(handler,"UPDATE books SET Autor = '"..NeuerName.."' WHERE Autor = '"..Name.."'")
				dbExec(handler,"UPDATE booksausgeliehen SET Username = '"..NeuerName.."' WHERE Username = '"..Name.."'")
				dbExec(handler,"UPDATE business SET Besitzer = '"..NeuerName.."' WHERE Besitzer = '"..Name.."'")
				dbExec(handler,"UPDATE garagen SET Besitzer = '"..NeuerName.."' WHERE Besitzer = '"..Name.."'")
				dbExec(handler,"UPDATE graffitis SET Username = '"..NeuerName.."' WHERE Username = '"..Name.."'")
				dbExec(handler,"UPDATE haustiere SET Besitzer = '"..NeuerName.."' WHERE Besitzer = '"..Name.."'")
				dbExec(handler,"UPDATE houses SET Besitzer = '"..NeuerName.."' WHERE Besitzer = '"..Name.."'")
				dbExec(handler,"UPDATE kinder SET Besitzer = '"..NeuerName.."' WHERE Besitzer = '"..Name.."'")
				dbExec(handler,"UPDATE logout SET Username = '"..NeuerName.."' WHERE Username = '"..Name.."'")
				dbExec(handler,"UPDATE lotto SET Username = '"..NeuerName.."' WHERE Username = '"..Name.."'")
				dbExec(handler,"UPDATE marktplatz SET Username = '"..NeuerName.."' WHERE Username = '"..Name.."'")
				dbExec(handler,"UPDATE moebel SET Besitzer = '"..NeuerName.."' WHERE Besitzer = '"..Name.."'")
				dbExec(handler,"UPDATE moebelinventory SET Besitzer = '"..NeuerName.."' WHERE Besitzer = '"..Name.."'")
				dbExec(handler,"UPDATE offlinemessages SET Name = '"..NeuerName.."' WHERE Name = '"..Name.."'")
				dbExec(handler,"UPDATE pflanzen SET Besitzer = '"..NeuerName.."' WHERE Besitzer = '"..Name.."'")
				dbExec(handler,"UPDATE postfach SET Empfaenger = '"..NeuerName.."' WHERE Empfaenger = '"..Name.."'")
				dbExec(handler,"UPDATE prestige SET Besitzer = '"..NeuerName.."' WHERE Besitzer = '"..Name.."'")
				dbExec(handler,"UPDATE quests SET Username = '"..NeuerName.."' WHERE Username = '"..Name.."'")
				dbExec(handler,"UPDATE sammelobjekte SET Username = '"..NeuerName.."' WHERE Username = '"..Name.."'")
				dbExec(handler,"UPDATE schmied SET Username = '"..NeuerName.."' WHERE Username = '"..Name.."'")
				dbExec(handler,"UPDATE status SET Username = '"..NeuerName.."' WHERE Username = '"..Name.."'")
				dbExec(handler,"UPDATE vehicles SET Besitzer = '"..NeuerName.."' WHERE Besitzer = '"..Name.."'")
				dbExec(handler,"UPDATE waffenbox SET Username = '"..NeuerName.."' WHERE Username = '"..Name.."'")
				dbExec(handler,"UPDATE wohnwagen SET Besitzer = '"..NeuerName.."' WHERE Besitzer = '"..Name.."'")
				dbExec(handler,"UPDATE zahlungen SET Empfaenger = '"..NeuerName.."' WHERE Empfaenger = '"..Name.."'")
				
				for _,v in pairs(getElementsByType("vehicle"))do
					if(getElementData(v,"Besitzer") == Name)then
						setElementData(v,"Besitzer",NeuerName)
					end
				end
				infobox(client,loc(client,"Adminsystem_147"),"info")
			elseif(type == "Ablehnen")then
				if(isElement(target) and getElementData(target,"loggedin") == 1)then
					outputChatBox(loc(target,"Adminsystem_148"),target,255,255,255,true)
				else
					offlinemessage("Dein Antrag auf eine Namensänderung wurde abgelehnt.","error")
				end
				infobox(client,loc(client,"Adminsystem_150"),"error")
			end
			triggerClientEvent(client,"setWindowDatas",client)
			dbExec(handler,"DELETE FROM nickchanges WHERE ID = '"..id.."'")
		else infobox(client,loc(client,"Adminsystem_151"),"error")end
	end
end)

-- [[ FAHRZEUG LÖSCHEN ]] --

addEvent("Adminsystem.deleteVehicle",true)
addEventHandler("Adminsystem.deleteVehicle",root,function(id,reason)
	if(getElementData(client,"Adminlevel") >= 6)then
		local result = dbPoll(dbQuery(handler,"SELECT * FROM vehicles WHERE ID = '"..id.."'"),-1)
		if(#result >= 1)then
			local owner = getPlayerData("vehicles","ID",id,"Besitzer")
			local ownerName = getPlayerFromName(owner)
			local model = getVehicleNameFromModel(getPlayerData("vehicles","ID",id,"Model"))
			local faction = getPlayerData("vehicles","ID",id,"Fraktion")
			local unternehmen = getPlayerData("vehicles","ID",id,"Unternehmen")
			local firma = getPlayerData("vehicles","ID",id,"Firma")
			if(faction == 0 and unternehmen == 0 and firma == 0)then
				if(isElement(Vehicles[id]))then destroyElement(Vehicles[id])end
				if(isElement(ownerName) and getElementData(ownerName,"loggedin") == 1)then
					outputChatBox(loc(ownerName,"Adminsystem_152"):format(id,reason,model),ownerName,255,255,255,true)
				else offlinemessage(ownerName,loc(_,"Adminsystem_153",ownerName):format(id,reason,model))end
				dbExec(handler,"DELETE FROM vehicles WHERE ID = '"..id.."'")
				infobox(client,loc(client,"Adminsystem_154"),"info")
			else infobox(client,loc(client,"Adminsystem_155"),"error")end
		else infobox(client,loc(client,"Adminsystem_156"),"error")end
	else infobox(client,loc(client,"Adminsystem_157"),"error")end
end)