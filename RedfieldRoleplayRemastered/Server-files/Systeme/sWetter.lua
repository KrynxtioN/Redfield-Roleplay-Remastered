-- [[ WETTER GENERIEREN ]] --

local rnd = math.random(1,18)
setWeather(rnd)
Wetter.id = rnd
local firstGenerate = true

function Wetter.generateWetter()
	Wetter.KeineKatastrophe = true
	local rnd = math.random(1,18)
	Wetter.id = rnd
	local Katastrophe = math.random(1,#Wetter["Katastrophen"])
	if(math.random(1,4) == 3)then
		if(firstGenerate ~= true)then
			Wetter.Oelpest = false
			Wetter.HoheTemperaturen = false
			Wetter.Erdbeben = false
			Wetter.Sandsturm = false
			resetWaterColor()
			Wetter.KeineKatastrophe = false
			outputChatBox(Wetter["Katastrophen"][Katastrophe][1],root,125,0,0)
			if(Katastrophe == 2)then Wetter.Oelpest = true end
			if(Katastrophe == 4)then Wetter.HoheTemperaturen = true end
			if(Katastrophe == 5)then Wetter.Erdbeben = true end
			if(Katastrophe == 6)then Wetter.Sandsturm = true end
			if(Wetter.Oelpest == true)then
				setWaterColor(0,0,0)
			elseif(Wetter.HoheTemperaturen == true)then
				setWeather(11)
			elseif(Wetter.Erdbeben == true)then
				for _,v in pairs(getElementsByType("player"))do
					if(getElementData(v,"loggedin") == 1)then
						triggerClientEvent(v,"createErdbeben",v)
					end
				end
			elseif(Wetter.Sandsturm == true)then
				setWeather(19)
			end
		end
		setTimer(Wetter.generateWetter,3600000,1)
	else
		if(firstGenerate ~= true)then
			for _,v in pairs(getElementsByType("player"))do
				if(getElementData(v,"loggedin") == 1)then
					if(getElementData(v,"Unternehmen") == 2)then
						outputChatBox(loc(v,"Systeme_274"):format(Wetter["Names"][Wetter.id]),v,250,150,0)
					end
				end
			end
			setTimer(function()
				resetWaterColor()
				setWeather(Wetter.id)
				setTimer(Wetter.generateWetter,3600000,1)
			end,300000,1)
		end
	end
	firstGenerate = false
end
setTimer(Wetter.generateWetter,3600000,1)
Wetter.generateWetter()

-- [[ WETTER AKTUALISIEREN ]] --

function Wetter.refresh(player)
	triggerClientEvent(player,"Wetter.refresh",player,Wetter.id)
end