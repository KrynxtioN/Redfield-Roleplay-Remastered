-- [[ WETTER AKTUALISIEREN ]] --

addEvent("Wetter.refresh",true)
addEventHandler("Wetter.refresh",root,function(id)
	setWeather(tonumber(id))
end)