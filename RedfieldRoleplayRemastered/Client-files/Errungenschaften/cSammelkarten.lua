-- [[ ALBUM ÖFFNEN ]] --

addEvent("Sammelkarten.openAlbum",true)
addEventHandler("Sammelkarten.openAlbum",root,function(tbl)
	Sammelkarten.id = 1
	Sammelkarten.clientTable = tbl
	setWindowDatas(_,_,true)
	addEventHandler("onClientRender",root,Sammelkarten.dxDrawAlbum)
	addEventHandler("onClientClick",root,Sammelkarten.dxDrawAlbumClick)
	bindKey("arrow_l","down",Sammelkarten.bindKeyLinks)
	bindKey("arrow_r","down",Sammelkarten.bindKeyRechts)
end)

-- [[ ALBUM ANZEIGEN ]] --

function Sammelkarten.dxDrawAlbum()
	--if(tonumber(Sammelkarten.clientTable[Sammelkarten.id][2]) == 1)then card = "Karte"..Sammelkarten.id else card = "Karte"..Sammelkarten.id.."_Locked" end
    dxDrawRectangle(593*(x/1440), 296*(y/900), 254*(x/1440), 308*(y/900), tocolor(17,17,17,200), false)
    dxDrawImage(603*(x/1440), 306*(y/900), 234*(x/1440), 288*(y/900), "Files/Images/Sammelkarten/Karte.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    dxDrawText(loc("Errungenschaften_46"):format(Sammelkarten.id), 603*(x/1440), 251*(y/900), 837*(x/1440), 286*(y/900), tocolor(255, 255, 255, 255), 1.50, "default-bold", "center", "center", false, false, false, false, false)
    dxDrawText(loc("Errungenschaften_47"), 603*(x/1440), 614*(y/900), 837*(x/1440), 649*(y/900), tocolor(255, 255, 255, 255), 1.00*(x/1440), "default-bold", "center", "center", false, true, false, false, false)
    dxDrawRectangle(603*(x/1440), 659*(y/900), 234*(x/1440), 43*(y/900), tocolor(17, 17, 17, 200), false)
    dxDrawText(loc("Errungenschaften_48"), 603*(x/1440), 659*(y/900), 837*(x/1440), 702*(y/900), tocolor(255, 255, 255, 255), 1.00*(x/1440), "default-bold", "center", "center", false, true, false, false, false)
	dxDrawImage(593*(x/1440), 276*(y/900), 16*(x/1440), 16*(y/900), "Files/Images/Kreuz.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
end

-- [[ KARTEN WECHSELN ]] --

function Sammelkarten.bindKeyLinks()
	if(Sammelkarten.id > 1)then
		Sammelkarten.id = Sammelkarten.id - 1
	end
end

function Sammelkarten.bindKeyRechts()
	if(Sammelkarten.id < 25)then
		Sammelkarten.id = Sammelkarten.id + 1
	end
end

-- [[ ALBUM ANKLICKEN ]] --

function Sammelkarten.dxDrawAlbumClick(button,state)
	if(button == "left" and state == "down")then
		if(isCursorOnElement(593*(x/1440), 276*(y/900), 16*(x/1440), 16*(y/900)))then
			Sammelkarten.close("destroy")
		elseif(isCursorOnElement(603*(x/1440), 659*(y/900), 234*(x/1440), 43*(y/900)))then
			triggerServerEvent("Sammelkarten.albumLeeren",localPlayer)
		end
	end
end

-- [[ ALBUM SCHLIESSEN ]] --

function Sammelkarten.close(type)
	if(type)then setWindowDatas() end
	removeEventHandler("onClientRender",root,Sammelkarten.dxDrawAlbum)
	removeEventHandler("onClientClick",root,Sammelkarten.dxDrawAlbumClick)
	unbindKey("arrow_l","down",Sammelkarten.bindKeyLinks)
	unbindKey("arrow_r","down",Sammelkarten.bindKeyRechts)
end
addEvent("Sammelkarten.close",true)
addEventHandler("Sammelkarten.close",root,Sammelkarten.close)

-- [[ WAS PASSIERT, WENN SPIELER STIRBT ]] --

addEventHandler("onClientPlayerWasted",root,function(player)
	if(player == localPlayer)then
		Sammelkarten.close()
	end
end)