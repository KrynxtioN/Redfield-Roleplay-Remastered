-- [[ PAYDAY ANZEIGEN / AKTUALISIEREN ]] --

addEvent("Payday.dxDraw",true)
addEventHandler("Payday.dxDraw",root,function(Fraktionsgehalt,Unternehmensgehalt,Jobgehalt,CompleteBonus,CompleteMoney,vehSteuern,CompleteCosts,Zinsen)
	Payday.datas = {Fraktionsgehalt,Unternehmensgehalt,Jobgehalt,CompleteBonus,CompleteMoney,vehSteuern,CompleteCosts,Zinsen}

	if(isWindowOpen())then
		if(Payday.state == false)then
			addEventHandler("onClientRender",root,Payday.dxDraw)
			Payday.state = true
			bindKey("space","down",function()
				removeEventHandler("onClientRender",root,Payday.dxDraw)
				unbindKey("space","down")
				Payday.state = false
			end)
		end
	else
		outputChatBox("_____| "..loc("Anzeigen_16").." |_____",0,200,0)
		outputChatBox(loc("Anzeigen_17")..": $"..Payday.datas[1]..", "..loc("Anzeigen_18")..": $"..Payday.datas[2]..", "..loc("Anzeigen_19")..": $"..Payday.datas[3],0,150,0)
		outputChatBox(loc("Anzeigen_20")..": $"..Payday.datas[4]..", "..loc("Anzeigen_21")..": $"..Payday.datas[6]..", "..loc("Anzeigen_22")..": $"..Payday.datas[8],0,150,0)
		outputChatBox(loc("Anzeigen_23")..": $"..Payday.datas[5]..", "..loc("Anzeigen_24")..": $"..Payday.datas[7],0,150,0)
	end
end)

-- [[ DAS PAYDAYFENSTER ]] --

function Payday.dxDraw()
	if(isWindowOpen() and not(isPlayerMapVisible(localPlayer)) and Job.info == false)then
		dxDrawRectangle(10*(x/1440), 314*(y/900), 212*(x/1440), 272*(y/900), tocolor(0, 0, 0, 175), false)
		dxDrawLine(10*(x/1440), 336*(y/900), 222*(x/1440), 336*(y/900), tocolor(255, 255, 255, 255), 1, false)
		dxDrawText(loc("Anzeigen_16"), 10*(x/1440), 314*(y/900), 222*(x/1440), 336*(y/900), tocolor(0, 255, 0, 175), 1.00*(x/1440), "default-bold", "center", "center", false, false, false, false, false)
		dxDrawText(loc("Anzeigen_17")..": $"..Payday.datas[1].."\n"..loc("Anzeigen_18")..": $"..Payday.datas[2].."\n"..loc("Anzeigen_19")..": $"..Payday.datas[3].."\n"..loc("Anzeigen_20")..": $"..Payday.datas[4].."\n"..loc("Anzeigen_21")..": $"..Payday.datas[6].."\n"..loc("Anzeigen_22")..": $"..Payday.datas[8].."\n\n"..loc("Anzeigen_24")..": $"..Payday.datas[7], 10*(x/1440), 346*(y/900), 222*(x/1440), 518*(y/900), tocolor(255, 255, 255, 200), 1.00*(x/1440), "default-bold", "center", "top", false, false, false, false, false)
		dxDrawText(loc("Anzeigen_25"), 10*(x/1440), 564*(y/900), 222*(x/1440), 586*(y/900), tocolor(0, 255, 0, 175), 1.00*(x/1440), "default-bold", "center", "center", false, false, false, false, false)
		dxDrawLine(10*(x/1440), 557*(y/900), 222*(x/1440), 557*(y/900), tocolor(255, 255, 255, 255), 1, false)
		dxDrawText(loc("Anzeigen_23")..": $"..Payday.datas[5], 10*(x/1440), 528*(y/900), 222*(x/1440), 550*(y/900), tocolor(0, 255, 0, 175), 1.00*(x/1440), "default-bold", "center", "center", false, false, false, false, false)
	end
end