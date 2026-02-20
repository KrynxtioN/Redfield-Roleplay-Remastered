-- [[ DAS FENSTER ]] --

addEvent("Eigenmenue.Spielerinformationen",true)
addEventHandler("Eigenmenue.Spielerinformationen",root,function()
	local fraktion = getElementData(localPlayer,"Fraktion")
	local unternehmen = getElementData(localPlayer,"Unternehmen")
	local fraktionsname = Fraktionssystem["Fraktionnamen"][fraktion]
	local unternehmenname = Fraktionssystem["Unternehmennamen"][unternehmen]
	local fraktionsrang = getElementData(localPlayer,"Fraktionrang")
	if(fraktion == 0)then fraktionsrang = "-" end
	local unternehmenrang = getElementData(localPlayer,"Unternehmenrang")
	if(unternehmen == 0)then unternehmenrang = "-" end
	local handynummer = getElementData(localPlayer,"Handynummer")
	if(handynummer == 0)then handynummer = loc("Systeme_135") end
	local money,bankmoney = getElementData(localPlayer,"Geld"),getElementData(localPlayer,"Bankgeld")
	local OnlineTime,OnlineTimeAFK = getElementData(localPlayer,"OnlineTime"),getElementData(localPlayer,"OnlineTimeAFK")
	local OnlineTimeHour,OnlineTimeAFKHour = math.floor(OnlineTime/60), math.floor(OnlineTimeAFK/60)
	local OnlineTimeMinute,OnlineTimeAFKMinute = OnlineTime - OnlineTimeHour * 60, OnlineTimeAFK - OnlineTimeAFKHour * 60
	local wochenzeit = loc("Systeme_136"):format(Scoreboard.formString(OnlineTimeHour),Scoreboard.formString(OnlineTimeMinute),Scoreboard.formString(OnlineTimeAFKHour),Scoreboard.formString(OnlineTimeAFKMinute))
	local ehepartner = getElementData(localPlayer,"Ehepartner")
	local firma = getElementData(localPlayer,"FirmenName")
	local firmenrang = getElementData(localPlayer,"Firmarang")
	if(getElementData(localPlayer,"Firma") == 0)then firmenrang = "-" end
	local bankpin = getElementData(localPlayer,"Bankpin")
	if(bankpin == 0)then bankpin = "-" end
	local kills,tode = getElementData(localPlayer,"Kills"),getElementData(localPlayer,"Tode")
	if(kills == 0 and tode == 0 or kills == 0 and tode > 0)then kd = 0 else kd = kills/tode end
	local Muskeln,Fett = getElementData(localPlayer,"Muskeln"),getElementData(localPlayer,"Fett")
	local job = getElementData(localPlayer,"Job")
	local schulden = getElementData(localPlayer,"Schulden")

    GUIEditor.window[1] = guiCreateWindow(569, 165, 300, 337, loc("Systeme_137"), false, "nocross")
    GUIEditor.label[1] = guiCreateLabel(10, 26, 280, 301, loc("Systeme_138"):format(getPlayerName(localPlayer),fraktionsname,fraktionsrang,unternehmenname,unternehmenrang,handynummer,money,bankmoney,schulden,wochenzeit,ehepartner,firma,firmenrang,bankpin,getElementData(localPlayer,"Kills"),getElementData(localPlayer,"Tode"),math.floor(kd),Muskeln,Fett,job), false, GUIEditor.window[1])
	setWindowDatas(1,_,true)
end)
