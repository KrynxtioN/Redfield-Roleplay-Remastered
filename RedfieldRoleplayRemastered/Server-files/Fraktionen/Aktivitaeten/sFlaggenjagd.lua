-- [[ FLAGGE ABGEBEN ]] --

function Flaggenjagd.placeFlag(faction)
	if(isElement(Flaggenjagd.object))then destroyElement(Flaggenjagd.object)end
	if(isElement(Flaggenjagd.marker))then destroyElement(Flaggenjagd.marker)end

	if(not(faction))then faction = math.random(6,9)end
	local tbl = Flaggenjagd["Pos"][faction]

	Flaggenjagd.besitzer = faction
	Flaggenjagd.object = createObject(11245,tbl[1],tbl[2],tbl[3],tbl[4],tbl[5],tbl[6])
	setObjectScale(Flaggenjagd.object,4)
	Flaggenjagd.marker = createMarker(tbl[7],tbl[8],tbl[9],"cylinder",1,0,0,0,0)
	addEventHandler("onMarkerHit",Flaggenjagd.marker,Flaggenjagd.takeFlag)
	for _,v in pairs(getElementsByType("player"))do
		if(getElementData(v,"loggedin") == 1)then
			if(isEvil(v))then
				outputChatBox(loc(v,"Fraktionen_157"):format(Fraktionssystem["Fraktionnamen"][Flaggenjagd.besitzer]),v,255,255,255,true)
			end
		end
	end
end
addEvent("Flaggenjagd.placeFlag",true)
addEventHandler("Flaggenjagd.placeFlag",root,Flaggenjagd.placeFlag)

-- [[ FLAGGE NEHMEN ]] --

function Flaggenjagd.takeFlag(player)
	if(isEvil(player))then
		local faction = getElementData(player,"Fraktion")
		if(not(faction == Flaggenjagd.besitzer))then
			destroyElement(Flaggenjagd.object)
			destroyElement(source)
			local x,y,z = getElementPosition(player)
			Flaggenjagd.object = createObject(11245,x,y,z,0,290,180)
			setObjectScale(Flaggenjagd.object,0.2)
			attachElements(Flaggenjagd.object,player,0.1,-0.2,0.4,0,290,0)
			Flaggenjagd.client(player)
			Flaggenjagd.flag[player] = true

			for _,v in pairs(getElementsByType("player"))do
				if(getElementData(v,"loggedin") == 1)then
					if(getElementData(v,"Fraktion") == Flagge.besitzer)then
						outputChatBox(loc(v,"Fraktionen_158"),v,255,255,255,true)
					end
					if(getElementData(v,"Fraktion") == faction)then
						outputChatBox(loc(v,"Fraktionen_159"):format(Fraktionssystem["Fraktionnamen"][Flaggenjagd.besitzer]),v,255,255,255,true)
					end
				end
			end
		end
	end
end
Flaggenjagd.placeFlag()

-- [[ FLAGGE IN INTERIOR / DIMENSION SETZEN ]] --

function Flaggenjagd.refreshFlag(player)
	if(Flaggenjagd.flag[player] == true)then
		setElementInterior(Flaggenjagd.object,getElementInterior(player))
		setElementDimension(Flaggenjagd.object,getElementDimension(player))
	end
end

-- [[ ABGABEMARKER ERSTELLEN ]] --

function Flaggenjagd.client(player)
	local faction = getElementData(player,"Fraktion")
	local tbl = Flaggenjagd["Pos"][faction]
	triggerClientEvent(player,"Flaggenjagd.client",player,tbl[7],tbl[8],tbl[9] + 1)
end

-- [[ HAT SPIELER FLAGGE? ]] --

function Flaggenjagd.hasFactionFlag(player)
	if(Flaggenjagd.besitzer == getElementData(player,"Fraktion"))then
		return true
	else
		return false
	end
end

-- [[ WAS PASSIERT, WENN SPIELER STIRBT / QUITTET ]] --

function Flaggenjagd.dropFlag(player)
	if(Flaggenjagd.flag[player] == true)then
		triggerClientEvent(player,"Flaggenjagd.client",player)
		Flaggenjagd.placeFlag(Flaggenjagd.besitzer)
		Flaggenjagd.flag[player] = false
	end
end

addEventHandler("onPlayerWasted",root,function() Flaggenjagd.dropFlag(source) end)
addEventHandler("onPlayerQuit",root,function() Flaggenjagd.dropFlag(source) end)