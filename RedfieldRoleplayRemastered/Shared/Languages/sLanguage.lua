function loc(player,var,name)
	local playerLanguage
	if(not(name))then
		if(player)then
			playerLanguage = getElementData(player,"Language")
		else
			playerLanguage = "DE"
		end
	else
		playerLanguage = getPlayerData("userdata","Username",name,"Language")
	end
	if(Language[playerLanguage])then
		if(Language[playerLanguage][var])then
			return Language[playerLanguage][var]
		else
			return var
		end
	end
end