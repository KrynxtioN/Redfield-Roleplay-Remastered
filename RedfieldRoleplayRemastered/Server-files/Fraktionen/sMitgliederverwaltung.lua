-- [[ MITGLIEDER-DATAS LADEN ]] --

function Panel.getMember(player,type)
	local tbl = {}
	local result = dbPoll(dbQuery(handler,"SELECT * FROM accounts"),-1)
	if(#result >= 1)then
		for _,v in pairs(result)do
			if(v[type] == getElementData(player,type))then
				table.insert(tbl,{v["Username"],v[type.."rang"],v[type.."Warns"]})
			end
		end
		triggerClientEvent(player,"Panel.refresh",player,tbl)
	end
end
addEvent("Panel.getMember",true)
addEventHandler("Panel.getMember",root,Panel.getMember)

-- [[ SPIELER RANG-UP / RANG-DOWN GEBEN ]] --

addEvent("Panel.changeRang",true)
addEventHandler("Panel.changeRang",root,function(target,action,type)
	local target = getPlayerFromName(target)
	if(existPlayer(client,target))then
		if(getElementData(client,type.."rang") >= 4)then
			if(getElementData(target,type) == getElementData(client,type))then
				if(action == "Befördern")then
					if(getElementData(target,type.."rang") < 4)then
						setElementData(target,type.."rang",getElementData(target,type.."rang")+1)
						infobox(target,loc(target,"Fraktionen_345"):format(getPlayerName(client),type),"info")
						infobox(client,loc(client,"Fraktionen_346"):format(getPlayerName(target),type),"info")
						if(type == "Fraktion")then giveFactionSkin(target) end
					else infobox(client,loc(client,"Fraktionen_347"),"error")end
				else
					if(getElementData(target,type.."rang") > 0 and getElementData(target,type.."rang") < 4)then
						setElementData(target,type.."rang",getElementData(target,type.."rang")-1)
						infobox(target,loc(target,"Fraktionen_348"):format(getPlayerName(client),type),"error")
						infobox(client,loc(client,"Fraktionen_349"):format(getPlayerName(target),type),"info")
						if(type == "Fraktion")then giveFactionSkin(target) end
					else infobox(client,loc(client,"Fraktionen_350"),"error")end
				end
				dbExec(handler,"UPDATE accounts SET "..type.."rang = '"..getElementData(target,type.."rang").."' WHERE Username = '"..getPlayerName(target).."'")
				Panel.getMember(client,type)
			else infobox(client,loc(client,"Fraktionen_351"):format(type),"error")end
		else infobox(client,loc(client,"Fraktionen_352"),"error")end
	end
end)

-- [[ SPIELER INVITEN / UNINVITEN ]] --

addEvent("Panel.newMember",true)
addEventHandler("Panel.newMember",root,function(target,action,type)
	local targetPlayer = getPlayerFromName(target)
	if(getElementData(client,type.."rang") >= 4)then
		if(action == "Inviten")then
			if(existPlayer(client,targetPlayer))then
				if(getElementData(targetPlayer,type) == 0)then
					if(hasPlayerZivizeit(targetPlayer,client,type))then
						setElementData(targetPlayer,type,getElementData(client,type))
						setElementData(targetPlayer,type.."rang",0)
						infobox(targetPlayer,loc(targetPlayer,"Fraktionen_353"):format(getPlayerName(client),type),"info")
						infobox(client,loc(client,"Fraktionen_354"):format(getPlayerName(targetPlayer),type),"info")
						if(type == "Fraktion" and getElementData(client,type) > 3)then giveFactionSkin(targetPlayer) end
						if(type == "Fraktion")then refreshFactionMemberBlips(getElementData(client,"Fraktion"))end
						dbExec(handler,"UPDATE accounts SET "..type.."rang = '"..getElementData(targetPlayer,type.."rang").."', "..type.." = '"..getElementData(targetPlayer,type).."' WHERE Username = '"..getPlayerName(targetPlayer).."'")
						if(type == "Firma")then
							setElementData(targetPlayer,"FirmenName",getElementData(client,"FirmenName"))
						end
						setElementData(targetPlayer,type.."Zivizeit",0)
						setElementData(targetPlayer,"Last"..type.."Invite",getRealTime().timestamp)
					end
				else infobox(client,loc(client,"Fraktionen_355"):format(type),"error")end
			end
		else
			if(isElement(targetPlayer) and getElementData(targetPlayer,"loggedin") == 1)then
				if(getElementData(targetPlayer,type) == getElementData(client,type))then
					setElementData(targetPlayer,type,0)
					setElementData(targetPlayer,type.."rang",0)
					infobox(targetPlayer,loc(targetPlayer,"Fraktionen_356"):format(getPlayerName(client),type),"error")
					infobox(client,loc(client,"Fraktionen_357"):format(getPlayerName(targetPlayer),type),"info")
					if(type == "Fraktion")then
						setElementModel(targetPlayer,0)
						setElementData(targetPlayer,"Skin",getElementModel(targetPlayer))
						CJSkinshop.setClothes(targetPlayer)
					end
					if(getElementData(targetPlayer,"Firma") == 0)then setElementData(player,"FirmenName","- Keine -") end
					if(type == "Fraktion")then refreshFactionMemberBlips(getElementData(client,"Fraktion"))end
					dbExec(handler,"UPDATE accounts SET "..type.."rang = '"..getElementData(targetPlayer,type.."rang").."', "..type.." = '"..getElementData(targetPlayer,type).."' WHERE Username = '"..getPlayerName(targetPlayer).."'")
					if(type == "Firma")then
						setElementData(targetPlayer,"FirmenName","- Keine -")
					end
					setPlayerZivizeit(targetPlayer,type)
				else infobox(client,loc(client,"Fraktionen_358"):format(type),"error")end
			else
				local targetFaction = getPlayerData("accounts","Username",target,type)
				if(tonumber(targetFaction) == getElementData(client,type))then
					if(tonumber(getPlayerData("accounts","Username",target,type.."rang")) < 5)then
						dbExec(handler,"UPDATE accounts SET "..type.." = '0', "..type.."rang = '0' WHERE Username = '"..target.."'")
						if(type == "Fraktion")then
							dbExec(handler,"UPDATE accounts SET Skin = '0' WHERE Username = '"..target.."'")
						end

						infobox(client,loc(client,"Fraktionen_359"):format(target,type),"info")
						offlinemessage(target,loc(_,"Fraktionen_360",target):format(getPlayerName(client),type))
						local LastInvite = getPlayerData("userdata","Username",target,"Last"..type.."Invite")
						if(getRealTime().timestamp < LastInvite+2592000000)then
							dbExec(handler,"UPDATE userdata SET "..type.."Zivizeit = '"..getRealTime().timestamp.."' WHERE Username = '"..target.."'")
						end
					else infobox(client,loc(client,"Fraktionen_361"),"error")end
				else infobox(client,loc(client,"Fraktionen_362"):format(type),"error")end
			end
		end
		Panel.getMember(client,type)
	else infobox(client,loc(client,"Fraktionen_363"),"error")end
end)

-- [[ WARNS VERGEBEN / ENTFERNEN ]] --

addEvent("Panel.warns",true)
addEventHandler("Panel.warns",root,function(target,action,type)
	local target = getPlayerFromName(target)
	if(existPlayer(client,target))then
		if(getElementData(client,type.."rang") >= 5)then
			if(getElementData(target,type) == getElementData(client,type))then
				if(action == "Warn geben")then
					setElementData(target,type.."Warns",getElementData(client,type.."Warns")+1)
					infobox(target,loc(target,"Fraktionen_364"):format(getPlayerName(client),type),"error")
					infobox(client,loc(client,"Fraktionen_365"):format(getPlayerName(target),type),"info")
					if(getElementData(target,type.."Warns") >= 3)then
						setElementData(target,type,0)
						setElementData(target,type.."rang",0)
						setElementData(target,type.."Warns",0)
						infobox(client,loc(client,"Fraktionen_366"):format(getPlayerName(target),type),"info")
						infobox(target,loc(target,"Fraktionen_367"):format(type),"error")
					end
				else
					if(getElementData(target,type.."Warns") > 0)then
						setElementData(target,type.."Warns",getElementData(client,type.."Warns")-1)
						infobox(target,loc(target,"Fraktionen_368"):format(getPlayerName(client),type),"info")
						infobox(client,loc(client,"Fraktionen_369"):format(getPlayerName(target),type),"info")
					else infobox(client,loc(client,"Fraktionen_370"),"error")end
				end
				dbExec(handler,"UPDATE accounts SET "..type.."Warns = '"..getElementData(target,type.."Warns").."' WHERE Username = '"..getPlayerName(target).."'")
				Panel.getMember(client,type)
			else infobox(client,loc(client,"Fraktionen_371"):format(type),"error")end
		else infobox(client,loc(client,"Fraktionen_372"),"error")end
	end
end)