function isPlayerOnBlacklist(name,faction)
	local result = getPlayerData("fraktionslager","Fraktion",faction,"Blacklist")
	if(string.find(result,name))then
		return true
	else
		return false
	end
end

function loadBlacklist(player)
	if(isEvil(player))then
		local tbl = {}
		local result = getPlayerData("fraktionslager","ID",getElementData(player,"Fraktion"),"Blacklist")
		local OnBlacklist = getPlayerData("fraktionslager","ID",getElementData(player,"Fraktion"),"OnBlacklist")
		for i = 1,OnBlacklist do
			local wstring = gettok(result,i,string.byte("|"))
			table.insert(tbl,wstring)
		end
		triggerClientEvent(player,"loadPlayerOnBlacklist",player,tbl)
	end
end

function refreshBlacklist(faction)
	for _,v in pairs(getElementsByType("player"))do
		if(getElementData(v,"Fraktion") == faction)then
			loadBlacklist(v)
		end
	end
end

addCommandHandler("blacklist",function(player,cmd,type,target)
	if(isEvil(player))then
		local Faction = getElementData(player,"Fraktion")
		if(type and target)then
			local targetPlayer = getPlayerFromName(target)
			local result = getPlayerData("fraktionslager","ID",Faction,"Blacklist")
			local OnBlacklist = getPlayerData("fraktionslager","ID",Faction,"OnBlacklist")
			if(type == "add")then
				if(not(string.find(result,target)))then
					local newResult = result.."|"..target
					if(existPlayer(_,targetPlayer))then
						infobox(targetPlayer,loc(targetPlayer,"Fraktionen_273"):format(Fraktionssystem["Fraktionnamen"][Faction]),"error")
					end
					infobox(player,loc(player,"Fraktionen_274"),"info")
					dbExec(handler,"UPDATE fraktionslager SET Blacklist = '"..newResult.."', OnBlacklist = '"..OnBlacklist+1 .."' WHERE ID = '"..Faction.."'")
					refreshBlacklist(Faction)
				else infobox(player,loc(player,"Fraktionen_275"),"error")end
			elseif(type == "delete")then
				if(string.find(result,target))then
					local newResult = ""
					if(existPlayer(_,targetPlayer))then
						infobox(targetPlayer,loc(player,"Fraktionen_276"):format(Fraktionssystem["Fraktionnamen"][Faction]),"info")
					end
					for i = 1,OnBlacklist do
						local wstring = gettok(result,i,string.byte("|"))
						if(wstring ~= target)then
							newResult = newResult..target.."|"
						end
					end
					infobox(player,loc(player,"Fraktionen_277"),"error")
					dbExec(handler,"UPDATE fraktionslager SET Blacklist = '"..newResult.."', OnBlacklist = '"..OnBlacklist-1 .."' WHERE ID = '"..Faction.."'")
					refreshBlacklist(Faction)
				else infobox(player,loc(player,"Fraktionen_278"),"error")end
			end
		else infobox(player,loc(player,"Fraktionen_279"),"error")end
	end
end)