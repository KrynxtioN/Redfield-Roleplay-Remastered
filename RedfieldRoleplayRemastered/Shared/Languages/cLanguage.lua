function loc(var)
	local playerLanguage = getElementData(localPlayer,"Language")
	if(Language[playerLanguage])then
		if(Language[playerLanguage][var])then
			return Language[playerLanguage][var]
		else
			return var
		end
	end
end