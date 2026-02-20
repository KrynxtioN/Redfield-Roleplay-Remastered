-- [[ ELEMENTE ERSTELLEN ]] --

Hochzeit.marker = createMarker(1963.9947509766,-371.6999206543,1092.8288818359,"cylinder",1,255,0,0,100)

addEventHandler("onMarkerHit",Hochzeit.marker,function(player)
	if(getElementData(player,"Unternehmen") == 2 and isUnternehmenDuty(player))then
		triggerClientEvent(player,"Hochzeit.openWindow",player)
	end
end)

-- [[ SPIELER VERHEIRATEN / SCHEIDEN ]] --

addEvent("Hochzeit.server",true)
addEventHandler("Hochzeit.server",root,function(spieler1,spieler2,type)
	local spieler1,spieler2 = getPlayerFromName(spieler1),getPlayerFromName(spieler2)
	if(getElementData(client,"Unternehmen") == 2 and isUnternehmenDuty(client))then
		if(existPlayer(client,spieler1) and existPlayer(client,spieler2))then
			if(type == "Verheiraten")then
				if(spieler1 ~= spieler2)then
					if(getElementData(spieler1,"Ehepartner") == "Niemand" and getElementData(spieler1,"Ehepartner") == "Niemand")then
						for _,v in pairs(getElementsByType("player"))do
							if(getElementData(v,"loggedin") == 1)then
								outputChatBox(loc(v,"Unternehmen_68"),v,250,100,0)
								outputChatBox(loc(v,"Unternehmen_69"):format(getPlayerName(spieler1),getPlayerName(spieler2)),v,250,100,0)
							end
						end
						setElementData(spieler1,"Ehepartner",getPlayerName(spieler2))
						setElementData(spieler2,"Ehepartner",getPlayerName(spieler1))
						infobox(client,loc(client,"Unternehmen_70"):format(getPlayerName(spieler1),getPlayerName(spieler2)),"info")
						setPlayerStatus(spieler1,2)
						setPlayerStatus(spieler2,2)
						setPlayerAchievement(spieler1,13)
						setPlayerAchievement(spieler2,13)
					else infobox(client,loc(client,"Unternehmen_71"),"error")end
				else infobox(client,loc(client,"Unternehmen_72"),"error")end
			elseif(type == "Scheiden")then
				if(getElementData(spieler1,"Ehepartner") == getPlayerName(spieler2))then
					for _,v in pairs(getElementsByType("player"))do
						if(getElementData(v,"loggedin") == 1)then
							outputChatBox(loc(v,"Unternehmen_73"),v,250,100,0)
							outputChatBox(loc(v,"Unternehmen_74"):format(getPlayerName(spieler1),getPlayerName(spieler2)),v,250,100,0)
						end
					end
					setElementData(spieler1,"Ehepartner","Niemand")
					setElementData(spieler2,"Ehepartner","Niemand")
					infobox(client,loc(client,"Unternehmen_74"):format(getPlayerName(spieler1),getPlayerName(spieler2)),"error")
				else infobox(client,loc(client,"Unternehmen_75"),"error")end
			end
		end
	end
end)