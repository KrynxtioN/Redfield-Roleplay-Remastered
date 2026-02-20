-- [[ TABELLEN ]] --

local TableNames = {"Paeckchen","Hufeisen","Tikistatuen","Speicherdisketten","GTA3Logos"}

-- [[ DIE SAMMELOBJEKTE LADEN ]] --

function Sammelobjekte.load(player)
	setElementData(player,"Graffitis",0)
	setElementData(player,"Aussichtspunkte",0)
	for i = 1,20 do
		local graffiti = getPlayerData("graffitis","Username",getPlayerName(player),"Object"..i)
		local aussichtspunkt = getPlayerData("aussichtspunkte","Username",getPlayerName(player),"Object"..i)
		if(graffiti == 0)then triggerClientEvent(player,"Sammelobjekte.createMarker",player,i,"Graffitis")end
		if(aussichtspunkt == 0)then triggerClientEvent(player,"Sammelobjekte.createMarker",player,i,"Aussichtspunkte")end
		if(graffiti == 1)then setElementData(player,"Graffitis",getElementData(player,"Graffitis")+1)end
		if(aussichtspunkt == 1)then setElementData(player,"Aussichtspunkte",getElementData(player,"Aussichtspunkte")+1)end
	end
	
	for _,v in pairs(TableNames)do
		local result = getPlayerData("sammelobjekte","Username",getPlayerName(player),v)
		setElementData(player,v,0)
		for i = 1,20 do
			local wstring = gettok(result,i,string.byte("|"))
			if(tonumber(wstring) == 0)then
				triggerClientEvent(player,"Sammelobjekte.createPickup",player,i,v)
			else
				setElementData(player,v,getElementData(player,v)+1)
			end
		end
	end
end

-- [[ EIN SAMMELOBJEKTE EINSAMMELN ]] --

addEvent("Sammelobjekte.einsammeln",true)
addEventHandler("Sammelobjekte.einsammeln",root,function(id,type)
	if(type == "Graffitis")then database = "graffitis" elseif(type == "Aussichtspunkte")then database = "aussichtspunkte" end
	dbExec(handler,"UPDATE "..database.." SET Object"..id.." = '1' WHERE Username = '"..getPlayerName(client).."'")
	if(type == "Graffitis")then name = "Graffiti" elseif(type == "Aussichtspunkte")then name = "Aussichtspunkt" end
	infobox(client,loc(client,"Errungenschaften_15"):format(name,getElementData(client,type)),"info")
	setElementData(client,"Geld",getElementData(client,"Geld")+250)
	setElementData(client,"Bonuspunkte",getElementData(client,"Bonuspunkte")+5)
	outputLog(getPlayerName(client).." hat ein Sammelobjekt eingesammelt.","Errungenschaften")
	
	if(getElementData(client,type) >= 20)then
		if(type == "Aussichtspunkte")then setPlayerAchievement(client,33)
		elseif(type == "Graffitis")then setPlayerAchievement(client,32)end
	end
end)

addEvent("Sammelobjekte.pickupEinsammeln",true)
addEventHandler("Sammelobjekte.pickupEinsammeln",root,function(id,type)
	local result = getPlayerData("sammelobjekte","Username",getPlayerName(client),type)
	local text = ""
	
	for i = 1,20 do
		local wstring = gettok(result,i,string.byte("|"))
		if(i == tonumber(id))then
			text = text.."1|"
		else
			text = text..wstring.."|"
		end
	end
	if(type == "Paeckchen")then name = "Paeckchen" end
	if(type == "Hufeisen")then name = "Hufeisen" end
	if(type == "Tikistatuen")then name = "Tikistatue" end
	if(type == "Speicherdisketten")then name = "Speicherdiskette" end
	if(type == "GTA3Logos")then name = "GTA 3 Logo" end
	setElementData(client,type,getElementData(client,type)+1)
	dbExec(handler,"UPDATE sammelobjekte SET "..type.." = '"..text.."' WHERE Username = '"..getPlayerName(client).."'")
	infobox(client,loc(client,"Errungenschaften_16"):format(name,getElementData(client,type)),"info")
	setElementData(client,"Geld",getElementData(client,"Geld")+250)
	setElementData(client,"Bonuspunkte",getElementData(client,"Bonuspunkte")+5)
	outputLog(getPlayerName(client).." hat ein Sammelobjekt eingesammelt.","Errungenschaften")
	
	if(getElementData(client,type) >= 20)then
		if(type == "GTA3Logos")then setPlayerAchievement(client,38)
		elseif(type == "Speicherdisketten")then setPlayerAchievement(client,37)
		elseif(type == "Tikistatuen")then setPlayerAchievement(client,36)
		elseif(type == "Hufeisen")then setPlayerAchievement(client,35)
		elseif(type == "Paeckchen")then setPlayerAchievement(client,34)end
	end
end)