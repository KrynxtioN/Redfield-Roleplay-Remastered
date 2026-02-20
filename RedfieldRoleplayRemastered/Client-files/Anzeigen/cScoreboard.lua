-- [[ DAS SCOREBOARD ÖFFNEN UND SCHLIESSEN ]] --

bindKey("tab","down",function()
	if(getElementData(localPlayer,"loggedin") == 1)then
		if(isWindowOpen())then
			Scoreboard.scoreboard = true
			setWindowDatas()
			Scoreboard.update()
			addEventHandler("onClientRender",root,Scoreboard.dxDraw)
			Scoreboard.updateTimer = setTimer(Scoreboard.update,10000,0)
			bindKey("mouse_wheel_down","down",Scoreboard.scrollDown)
			bindKey("mouse_wheel_up","down",Scoreboard.scrollUp)
			toggleControl("next_weapon",false)
			toggleControl("previous_weapon",false)
			toggleControl("fire",false)
			bindKey("mouse2","up",Scoreboard.showCursor)
			showCursor(false)
		end
	end
end)

bindKey("tab","up",function()
	if(Scoreboard.scoreboard == true)then
		Scoreboard.scoreboard = false
		setWindowDatas()
		removeEventHandler("onClientRender",root,Scoreboard.dxDraw)
		bindKey("mouse_wheel_down","down",Scoreboard.scrollDown)
		bindKey("mouse_wheel_up","down",Scoreboard.scrollUp)
		killTimer(Scoreboard.updateTimer)
		unbindKey("mouse2","up",Scoreboard.showCursor)
		toggleControl("next_weapon",true)
		toggleControl("previous_weapon",true)
		toggleControl("fire",true)
	end
end)

-- [[ FUNKTION ZUM ANZEIGEN DES CURSORS ]] --

function Scoreboard.showCursor()
	showCursor(not(isCursorShowing()))
end

-- [[ NACH OBEN UND UNTEN SCROLLEN ]] --

function Scoreboard.scrollDown()
	if(Scoreboard.scoreboard == true)then
		if(Scoreboard.scroll <= #getElementsByType("player")-16)then
			Scoreboard.scroll = Scoreboard.scroll + 2
		end
	end
end

function Scoreboard.scrollUp()
	if(Scoreboard.scoreboard == true)then
		if(Scoreboard.scroll <= 2)then
			Scoreboard.scroll = 0
		else
			Scoreboard.scroll = Scoreboard.scroll - 2
		end
	end
end

-- [[ ALLE SPIELERDATEN LADEN ]] --

function Scoreboard.update()
	pl = {}
	local i = 1
	
	for id = 0,9 do
		for _,v in pairs(getElementsByType("player"))do
			if(getElementData(v,"loggedin") == 1)then
				if(getElementData(v,"Fraktion") == id)then
					local spielstunden = getElementData(v,"Spielstunden")
					local hour = math.floor(spielstunden/60)
					local minute = spielstunden-hour*60
					local fraktion = getElementData(v,"Fraktion")
				
					pl[i] = {}
					pl[i].name = getPlayerName(v)
					pl[i].ping = getPlayerPing(v)
					pl[i].playtime = Scoreboard.formString(hour)..":"..Scoreboard.formString(minute) 
					pl[i].fraktion = Fraktionssystem["Fraktionnamen"][fraktion]
					pl[i].status = getElementData(v,"SozialerStatus")
					pl[i].firma = getElementData(v,"FirmenName")
					pl[i].information = Adminsystem["Names"][getElementData(v,"Adminlevel")]
					pl[i].colors = {Fraktionssystem["Fraktion"][fraktion][1],Fraktionssystem["Fraktion"][fraktion][2],Fraktionssystem["Fraktion"][fraktion][3]}
					pl[i].unternehmen = Fraktionssystem["Unternehmennamen"][getElementData(v,"Unternehmen")]
					pl[i].unternehmenrang = getElementData(v,"Unternehmenrang")
					pl[i].level = getElementData(v,"Level")
					if(getElementData(v,"Handynummer") == 0)then nummer = "-" else nummer = getElementData(v,"Handynummer")end
					pl[i].handynummer = nummer
					
					i = i + 1
				end
			end
		end
	end
end

-- [[ DAS SCOREBOARD ]] --



function Scoreboard.dxDraw()
	if(getElementData(localPlayer,"Scoreboard") == 0)then
		dxDrawRectangle(358*(x/1440), 255*(y/900), 724*(x/1440), 389*(y/900), tocolor(17,17,17, 150), false)
		dxDrawRectangle(358*(x/1440), 255*(y/900), 724*(x/1440), 22*(y/900), tocolor(17,17,17, 255), false)
		dxDrawText(loc("Anzeigen_26").." ("..#getElementsByType("player").." "..loc("Anzeigen_27")..")    #007d00"..getClientFactionMembers(1).."  #7d7dc8"..getClientFactionMembers(2).."  #00c800"..getClientFactionMembers(3).."  #960000"..getClientFactionMembers(6).."  #969600"..getClientFactionMembers(7).."  #643232"..getClientFactionMembers(8).."  #646464"..getClientFactionMembers(9), 358*(x/1440), 255*(y/900), 1082*(x/1440), 277*(y/900), tocolor(255,255,255, 255), 1.00*(x/1440), "default-bold", "center", "center", false, false, false, true, false)
		dxDrawText(loc("Anzeigen_28"), 368*(x/1440), 287*(y/900), 478*(x/1440), 308*(y/900), tocolor(255, 255, 255, 255), 1.00*(x/1440), "default-bold", "center", "center", false, false, false, false, false)
		dxDrawLine(487*(x/1440), 276*(y/900), 487*(x/1440), 643*(y/900), tocolor(255, 255, 255, 255), 2, false)
		dxDrawText(loc("Anzeigen_29"), 497*(x/1440), 287*(y/900), 583*(x/1440), 308*(y/900), tocolor(255, 255, 255, 255), 1.00*(x/1440), "default-bold", "center", "center", false, false, false, false, false)
		dxDrawLine(593*(x/1440), 277*(y/900), 593*(x/1440), 644*(y/900), tocolor(255, 255, 255, 255), 2, false)
		dxDrawText(loc("Anzeigen_30"), 603*(x/1440), 287*(y/900), 684*(x/1440), 308*(y/900), tocolor(255, 255, 255, 255), 1.00*(x/1440), "default-bold", "center", "center", false, false, false, false, false)
		dxDrawLine(694*(x/1440), 277*(y/900), 694*(x/1440), 644*(y/900), tocolor(255, 255, 255, 255), 2, false)
		dxDrawText(loc("Anzeigen_31"), 704*(x/1440), 287*(y/900), 814*(x/1440), 308*(y/900), tocolor(255, 255, 255, 255), 1.00*(x/1440), "default-bold", "center", "center", false, false, false, false, false)
		dxDrawLine(824*(x/1440), 277*(y/900), 824*(x/1440), 644*(y/900), tocolor(255, 255, 255, 255), 2, false)
		dxDrawText(loc("Anzeigen_32"), 834*(x/1440), 287*(y/900), 915*(x/1440), 308*(y/900), tocolor(255, 255, 255, 255), 1.00*(x/1440), "default-bold", "center", "center", false, false, false, false, false)
		dxDrawLine(925*(x/1440), 277*(y/900), 925*(x/1440), 644*(y/900), tocolor(255, 255, 255, 255), 2, false)
		dxDrawText(loc("Anzeigen_33"), 935*(x/1440), 287*(y/900), 1017*(x/1440), 308*(y/900), tocolor(255, 255, 255, 255), 1.00*(x/1440), "default-bold", "center", "center", false, false, false, false, false)
		dxDrawLine(1027*(x/1440), 277*(y/900), 1027*(x/1440), 644*(y/900), tocolor(255, 255, 255, 255), 2, false)
		dxDrawText(loc("Anzeigen_34"), 1037*(x/1440), 287*(y/900), 1072*(x/1440), 308*(y/900), tocolor(255, 255, 255, 255), 1.00*(x/1440), "default-bold", "center", "center", false, false, false, false, false)
		dxDrawLine(359*(x/1440), 312*(y/900), 1081*(x/1440), 312*(y/900), tocolor(255, 255, 255, 255), 2, false)
		
		local id = 0
		for i = 1 + Scoreboard.scroll,16 + Scoreboard.scroll do
			if(pl[i])then
				if(isCursorOnElement(368*(x/1440), 322*(y/900)+(17*id)+13, 705*(x/1440), 17*(y/900)))then
					dxDrawRectangle(368*(x/1440), 322*(y/900)+(17*id)+13, 705*(x/1440), 17*(y/900),tocolor(250,150,0,25),false)
					dxDrawRectangle(171*(x/1440), 334*(y/900), 175*(x/1440), 163*(y/900), tocolor(17,17,17, 150), false)
					dxDrawRectangle(171*(x/1440), 334*(y/900), 175*(x/1440), 18*(y/900), tocolor(17,17,17, 255), false)
					dxDrawText(pl[i].name, 171*(x/1440), 334*(y/900), 346*(x/1440), 352*(y/900), tocolor(255,255,255, 255), 1.00*(x/1440), "default-bold", "center", "center", false, false, false, false, false)
					
					dxDrawText(loc("Anzeigen_35")..": "..pl[i].unternehmen, 171*(x/1440), 362*(y/900), 346*(x/1440), 381*(y/900), tocolor(255, 255, 255, 255), 1.00*(x/1440), "default-bold", "center", "center", false, false, false, false, false)
					dxDrawText(loc("Anzeigen_36")..": "..pl[i].unternehmenrang, 171*(x/1440), 391*(y/900), 346*(x/1440), 410*(y/900), tocolor(255, 255, 255, 255), 1.00*(x/1440), "default-bold", "center", "center", false, false, false, false, false)
					dxDrawText(loc("Anzeigen_37")..": "..pl[i].level, 171*(x/1440), 420*(y/900), 346*(x/1440), 439*(y/900), tocolor(255, 255, 255, 255), 1.00*(x/1440), "default-bold", "center", "center", false, false, false, false, false)
					dxDrawText(loc("Anzeigen_38")..": "..pl[i].handynummer, 171*(x/1440), 449*(y/900), 346*(x/1440), 468*(y/900), tocolor(255, 255, 255, 255), 1.00*(x/1440), "default-bold", "center", "center", false, false, false, false, false)
				end
			
				dxDrawText(pl[i].name, 368*(x/1440), 322*(y/900)+(17*id)+13, 478*(x/1440), 343*(y/900)+(17*id)+13, tocolor(pl[i].colors[1],pl[i].colors[2],pl[i].colors[3], 255), 1.00*(x/1440), "default-bold", "center", "center", false, false, false, false, false)
				dxDrawText(pl[i].playtime, 497*(x/1440), 322*(y/900)+(17*id)+13, 583*(x/1440), 343*(y/900)+(17*id)+13, tocolor(pl[i].colors[1],pl[i].colors[2],pl[i].colors[3], 255), 1.00*(x/1440), "default-bold", "center", "center", false, false, false, false, false)
				dxDrawText(pl[i].fraktion, 603*(x/1440), 322*(y/900)+(17*id)+13, 684*(x/1440), 343*(y/900)+(17*id)+13, tocolor(pl[i].colors[1],pl[i].colors[2],pl[i].colors[3], 255), 1.00*(x/1440), "default-bold", "center", "center", false, false, false, false, false)
				dxDrawText(pl[i].status, 704*(x/1440), 322*(y/900)+(17*id)+13, 814*(x/1440), 343*(y/900)+(17*id)+13, tocolor(pl[i].colors[1],pl[i].colors[2],pl[i].colors[3], 255), 1.00*(x/1440), "default-bold", "center", "center", false, false, false, false, false)
				dxDrawText(pl[i].firma, 834*(x/1440), 322*(y/900)+(17*id)+13, 915*(x/1440), 343*(y/900)+(17*id)+13, tocolor(pl[i].colors[1],pl[i].colors[2],pl[i].colors[3], 255), 1.00*(x/1440), "default-bold", "center", "center", false, false, false, false, false)
				dxDrawText(pl[i].information, 935*(x/1440), 322*(y/900)+(17*id)+13, 1017*(x/1440), 343*(y/900)+(17*id)+13, tocolor(pl[i].colors[1],pl[i].colors[2],pl[i].colors[3], 255), 1.00*(x/1440), "default-bold", "center", "center", false, false, false, false, false)
				dxDrawText(pl[i].ping, 1037*(x/1440), 322*(y/900)+(17*id)+13, 1072*(x/1440), 343*(y/900)+(17*id)+13, tocolor(pl[i].colors[1],pl[i].colors[2],pl[i].colors[3], 255), 1.00*(x/1440), "default-bold", "center", "center", false, false, false, false, false)
				
				id = id + 1
			end
		end
	end
end

-- [[ FUNKTION ZUM CONVERTIEREN DER SPIELZEIT ]] --

function Scoreboard.formString(text)
	if(string.len(text) == 1)then
		text = "0"..text
	end
	return text
end

-- [[ FRAKTIONISTEN ONLINE ]] --

function getClientFactionMembers(id)
	local counter = 0
	for _,v in pairs(getElementsByType("player"))do
		if(getElementData(v,"Fraktion") == tonumber(id))then
			counter = counter + 1
		end
	end
	return counter
end