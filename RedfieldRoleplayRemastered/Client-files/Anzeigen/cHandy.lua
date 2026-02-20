-- [[ HANDY ÖFFNEN ]] --

function Handy.openHandy()
	if(getElementData(localPlayer,"Handy") >= 1)then
		if(getElementData(localPlayer,"AnTelefonzellenPhone") ~= true)then
			if(Handy.open == false)then
				if(isWindowOpen())then
					if(fileExists("Files/Images/Handy3.png"))then
						Handy.playerBestellung = {}
						Handy.bestellkosten = 0
						Handy.seite = 1
						addEventHandler("onClientRender",root,Handy.dxDraw)
						showCursor(true)
						addEventHandler("onClientClick",root,Handy.click)
						setElementData(localPlayer,"elementClicked",true)
						Handy.open = true
					else infobox(loc("Anzeigen_44"),"error")end
				end
			else
				removeEventHandler("onClientRender",root,Handy.dxDraw)
				showCursor(false)
				removeEventHandler("onClientClick",root,Handy.click)
				Handy.destroyGUIElements()
				setElementData(localPlayer,"elementClicked",false)
				Handy.open = false
			end
		end
	end
end
bindKey("u","down",Handy.openHandy)

-- [[ HANDY ]] --

function Handy.dxDraw()
	if(getElementData(localPlayer,"Handystatus") == "off")then
		dxDrawImage(1186*(x/1440), 472*(y/900), 244*(x/1440), 418*(y/900), "Files/Images/Handy3.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
	else
		if(getElementData(localPlayer,"Telefonpartner") ~= false)then
			local Telefonpartner = getElementData(localPlayer,"Telefonpartner")
			if(getElementData(localPlayer,"WirdAngerufen") == true)then text = Telefonpartner.."\n"..loc("Anzeigen_45") end
			if(getElementData(localPlayer,"RuftAn") == true)then text = Telefonpartner.."\n"..loc("Anzeigen_46") end
			if(getElementData(localPlayer,"WirdAngerufen") == false and getElementData(localPlayer,"RuftAn") == false)then
				text = Telefonpartner.."\n"..loc("Anzeigen_47")
			end
			dxDrawImage(1186*(x/1440), 472*(y/900), 244*(x/1440), 418*(y/900), "Files/Images/Handy2.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
			dxDrawText(text, 1196*(x/1440), 519*(y/900), 1415*(x/1440), 561*(y/900), tocolor(255, 255, 255, 255), 1.50*(x/1440), "default-bold", "center", "center", false, false, false, false, false)
			if(getElementData(localPlayer,"WirdAngerufen") == true)then
				dxDrawRectangle(1206*(x/1440), 587*(y/900), 199*(x/1440), 26*(y/900), tocolor(0, 0, 0, 200), false)
				dxDrawText(loc("Anzeigen_63"), 1206*(x/1440), 587*(y/900), 1405*(x/1440), 613*(y/900), tocolor(255, 255, 255, 255), 1.00*(x/1440), "default-bold", "center", "center", false, false, false, false, false)
			end
		else
			if(Handy.seite == 1)then
				local time = getRealTime()
				local monthday,month = time.monthday,time.month+1
				local hour,minute = time.hour,time.minute
				if(monthday < 10)then monthday = "0"..monthday end
				if(month < 10)then month = "0"..month end
				if(hour < 10)then hour = "0"..hour end
				if(minute < 10)then minute = "0"..minute end
				dxDrawImage(1186*(x/1440), 472*(y/900), 244*(x/1440), 418*(y/900), "Files/Images/Handy1.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
				dxDrawText(monthday.. "." ..month .. "." ..time.year+1900 ..", "..hour.. ":" ..minute.." "..loc("Anzeigen_48"), 1196*(x/1440), 519*(y/900), 1415*(x/1440), 561*(y/900), tocolor(255, 255, 255, 255), 1.50*(x/1440), "default-bold", "center", "center", false, false, false, false, false)
			elseif(Handy.seite == 2)then
				dxDrawImage(1186*(x/1440), 472*(y/900), 244*(x/1440), 418*(y/900), "Files/Images/Handy2.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)

				dxDrawRectangle(1206*(x/1440), 716*(y/900), 199*(x/1440), 26*(y/900), tocolor(0, 0, 0, 200), false)
				dxDrawRectangle(1206*(x/1440), 752*(y/900), 199*(x/1440), 26*(y/900), tocolor(0, 0, 0, 200), false)
				dxDrawText(loc("Anzeigen_49"), 1210*(x/1440), 752*(y/900), 1409*(x/1440), 778*(y/900), tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
				dxDrawText(loc("Anzeigen_50"), 1210*(x/1440), 716*(y/900), 1409*(x/1440), 742*(y/900), tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
				dxDrawText(loc("Anzeigen_51")..": $"..Handy.bestellkosten, 1210*(x/1440), 788*(y/900), 1409*(x/1440), 814*(y/900), tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
			elseif(Handy.seite == 3)then
				dxDrawImage(1186*(x/1440), 472*(y/900), 244*(x/1440), 418*(y/900), "Files/Images/Handy2.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
				dxDrawRectangle(1206*(x/1440), 587*(y/900), 199*(x/1440), 26*(y/900), tocolor(0, 0, 0, 200), false)
				dxDrawText(loc("Anzeigen_52")..":", 1196*(x/1440), 519*(y/900), 1415*(x/1440), 541*(y/900), tocolor(255, 255, 255, 255), 1.00*(x/1440), "default-bold", "center", "center", false, false, false, false, false)
				dxDrawText(loc("Anzeigen_53"), 1206*(x/1440), 587*(y/900), 1405*(x/1440), 613*(y/900), tocolor(255, 255, 255, 255), 1.00*(x/1440), "default-bold", "center", "center", false, false, false, false, false)
			elseif(Handy.seite == 4)then
				dxDrawImage(1186*(x/1440), 472*(y/900), 244*(x/1440), 418*(y/900), "Files/Images/Handy2.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
				
				dxDrawRectangle(1206*(x/1440), 750*(y/900), 199*(x/1440), 26*(y/900), tocolor(0, 0, 0, 200), false)
				dxDrawText(loc("Anzeigen_60")..":", 1196*(x/1440), 519*(y/900), 1415*(x/1440), 541*(y/900), tocolor(255, 255, 255, 255), 1.00*(x/1440), "default-bold", "center", "center", false, false, false, false, false)
				dxDrawText(loc("Anzeigen_54"), 1205*(x/1440), 760*(y/900), 1404*(x/1440), 767*(y/900), tocolor(255, 255, 255, 255), 1.00*(x/1440), "default-bold", "center", "center", false, false, false, false, false)
				dxDrawText(loc("Anzeigen_67")..":", 1195*(x/1440), 586*(y/900), 1414*(x/1440), 608*(y/900), tocolor(255, 255, 255, 255), 1.00*(x/1440), "default-bold", "center", "center", false, false, false, false, false)
			end
		end
	end
end

-- [[ ETWAS IM HANDY ANKLICKEN ]] --

function Handy.click(button,state)
	if(Handy.open == true)then
		if(button == "left" and state == "down")then
			if(getElementData(localPlayer,"Telefonpartner") ~= false)then
				if(isCursorOnElement(1288*(x/1440), 849*(y/900), 39*(x/1440), 31*(y/900)))then
					triggerServerEvent("Handy.stopTelefonat",localPlayer,localPlayer)
				elseif(isCursorOnElement(1206*(x/1440), 587*(y/900), 199*(x/1440), 26*(y/900)))then
					triggerServerEvent("Handy.abheben",localPlayer)
				end
			else
				if(isCursorOnElement(1288*(x/1440), 849*(y/900), 39*(x/1440), 31*(y/900)))then
					Handy.destroyGUIElements()
					if(Handy.seite == 1)then
						if(getElementData(localPlayer,"Handystatus") == "off")then
							setElementData(localPlayer,"Handystatus","on")
							infobox(loc("Anzeigen_57"),"info")
						else
							setElementData(localPlayer,"Handystatus","off")
							infobox(loc("Anzeigen_58"),"error")
						end
					else
						Handy.seite = 1
					end
				end
				if(Handy.seite == 1)then
					if(isCursorOnElement(1196*(x/1440), 805*(y/900), 220*(x/1440), 34*(y/900)))then -- Ammunation
						Handy.destroyGUIElements()
						Handy.seite = 2
						GUIEditor.gridlist[1] = guiCreateGridList(0.83, 0.58, 0.15, 0.20, true)
						local waffe = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Anzeigen_64"), 0.4)
						local munition = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Anzeigen_65"), 0.3)
						local preis = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Anzeigen_66"), 0.3)
						
						for _,v in pairs(Handy["Bestellungen"])do
							local row = guiGridListAddRow(GUIEditor.gridlist[1])
							guiGridListSetItemText(GUIEditor.gridlist[1],row,waffe,v[1],false,false)
							guiGridListSetItemText(GUIEditor.gridlist[1],row,munition,v[2],false,false)
							guiGridListSetItemText(GUIEditor.gridlist[1],row,preis,v[3],false,false)
						end
					elseif(isCursorOnElement(1196*(x/1440), 767*(y/900), 37*(x/1440), 38*(y/900)))then -- Anrufen
						Handy.destroyGUIElements()
						Handy.seite = 3
						GUIEditor.edit[1] = guiCreateEdit(0.84, 0.61, 0.13, 0.03, "", true)
					elseif(isCursorOnElement(1233*(x/1440), 767*(y/900), 37*(x/1440), 38*(y/900)))then -- SMS
						Handy.destroyGUIElements()
						Handy.seite = 4
						GUIEditor.memo[1] = guiCreateMemo(0.84, 0.69, 0.13, 0.13, "", true)
						GUIEditor.edit[1] = guiCreateEdit(0.84, 0.61, 0.13, 0.03, "", true)    
					end
				elseif(Handy.seite == 2)then
					if(isCursorOnElement(1206*(x/1440), 716*(y/900), 199*(x/1440), 26*(y/900)))then
						local waffe = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),1)
						local preis = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),3)
						if(waffe ~= "")then
							table.insert(Handy.playerBestellung,{waffe})
							Handy.bestellkosten = Handy.bestellkosten + preis
						end
					elseif(isCursorOnElement(1206*(x/1440), 752*(y/900), 199*(x/1440), 26*(y/900)))then
						triggerServerEvent("Handy.waffenBestellen",localPlayer,Handy.playerBestellung,Handy.bestellkosten)
					end
				elseif(Handy.seite == 3)then
					if(isCursorOnElement(1206*(x/1440), 587*(y/900), 199*(x/1440), 26*(y/900)))then
						local Nr = guiGetText(GUIEditor.edit[1])
						if(#Nr >= 1 and isOnlyNumbers(Nr))then
							triggerServerEvent("Handy.anrufen",localPlayer,Nr)
						end
					end
				elseif(Handy.seite == 4)then
					if(isCursorOnElement(1205*(x/1440), 760*(y/900), 1404*(x/1440), 767*(y/900)))then
						local Nr = guiGetText(GUIEditor.edit[1])
						local Nachricht = guiGetText(GUIEditor.memo[1])
						if(#Nr >= 1 and isOnlyNumbers(Nr))then
							if(#Nachricht - 1 >= 1 and #Nachricht - 1 <= 90)then
								triggerServerEvent("Handy.SMS",localPlayer,Nr,Nachricht)
							else infobox(loc("Anzeigen_55"),"error")end
						end
					end
				end
			end
		end
	end
end

-- [[ HANDYSEITE SETZEN ]] --

addEvent("Handy.setHandyseite",true)
addEventHandler("Handy.setHandyseite",root,function(id)
	Handy.seite = tonumber(id)
end)

-- [[ SOUND ]] --

addEvent("Handy.createSound",true)
addEventHandler("Handy.createSound",root,function()
	if(isElement(Handy.vibration))then destroyElement(Handy.vibration)end
	if(isFileExists("Files/Sounds/HandyVibration.mp3"))then
		Handy.vibration = playSound("Files/Sounds/HandyVibration.mp3")
	end
end)

-- [[ ELEMENTE ZERSTÖREN ]] --

function Handy.destroyGUIElements()
	if(Handy.open == true)then
		if(isElement(GUIEditor.edit[1]))then destroyElement(GUIEditor.edit[1])end
		if(isElement(GUIEditor.gridlist[1]))then destroyElement(GUIEditor.gridlist[1])end
		if(isElement(GUIEditor.memo[1]))then destroyElement(GUIEditor.memo[1])end
	end
end
addEvent("Handy.destroyGUIElements",true)
addEventHandler("Handy.destroyGUIElements",root,Handy.destroyGUIElements)

-- [[ TELEFONZELLE ]] --

addEvent("Handy.openTelefonzelle",true)
addEventHandler("Handy.openTelefonzelle",root,function()
	if(isWindowOpen())then
		setElementData(localPlayer,"AnTelefonzelle",true)
        GUIEditor.window[1] = guiCreateWindow(476, 298, 248, 198, loc("Anzeigen_58"), false)

        GUIEditor.label[1] = guiCreateLabel(10, 30, 228, 46, loc("Anzeigen_59"), false, GUIEditor.window[1])
        GUIEditor.label[2] = guiCreateLabel(10, 86, 228, 27, loc("Anzeigen_60")..":", false, GUIEditor.window[1])
        GUIEditor.edit[1] = guiCreateEdit(10, 123, 228, 27, "", false, GUIEditor.window[1])
        GUIEditor.button[1] = guiCreateButton(10, 160, 228, 28, loc("Anzeigen_61"), false, GUIEditor.window[1])
		setWindowDatas(2)
		
		addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
			local nr = guiGetText(GUIEditor.edit[1])
			if(#nr >= 1 and isOnlyNumbers(nr))then
				if(getElementData(localPlayer,"Geld") >= 50)then
					setElementData(localPlayer,"Geld",getElementData(localPlayer,"Geld")-50)
					triggerServerEvent("Handy.anrufen",localPlayer,nr)
				else infobox(loc("Anzeigen_62"),"error")end
			end
		end,false)
	end
end)

-- [[ TELEFONZELLE REPARIEREN ]] --

addEvent("Handy.repairTelefonzelle",true)
addEventHandler("Handy.repairTelefonzelle",root,function(x,y,z)
	fxAddSparks(x,y,z,0,0,1,2,1,0,0,0,false,1,1)
end)

-- [[ WAS PASSIERT, WENN SPIELER STIRBT ]] --

addEventHandler("onClientPlayerWasted",root,function(player)
	if(player == localPlayer)then
		if(Handy.open == true)then
			Handy.openHandy()
		end
	end
end)