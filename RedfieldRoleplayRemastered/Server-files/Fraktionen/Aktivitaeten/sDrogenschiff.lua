-- [[ DIE ELEMENTE ERSTELLEN ]] --

Drogenschiff.shipObject = createObject(8493,2968.65185547,-2040.21,16.79500961,0,0,360)
Drogenschiff.shipObjectSegel = createObject(9159,2968.43115234,-2040.21,16.50687408,0,0,360)
attachElements(Drogenschiff.shipObjectSegel,Drogenschiff.shipObject)

-- [[ DROGEN KAUFEN / VERKAUFEN ]] --

addEvent("Drogenschiff.buySell",true)
addEventHandler("Drogenschiff.buySell",root,function(menge,type)
	if(isEvil(client))then
		if(not(getElementData(client,"DrogenschiffDrugs")))then setElementData(client,"DrogenschiffDrugs",0)end
		
		local menge = tonumber(menge)
		if(type == "Kaufen")then
			if(Drogenschiff.angelegt == "LS")then
				if(menge >= 1 and menge <= 1000)then
					if(tonumber(getElementData(client,"DrogenschiffDrugs")) <= 1000)then
						if(hasMoney(client,menge * Drogenschiff.preis))then
							setElementData(client,"DrogenschiffDrugs",getElementData(client,"DrogenschiffDrugs")+menge)
							takeMoney(client,menge * Drogenschiff.preis)
							infobox(client,loc(client,"Fraktionen_134"):format(menge),"info")
							outputLog("[Drogenschiff]: "..getPlayerName(client).." hat für $"..menge * Drogenschiff.preis.." Drogen gekauft.","Fraktionen")
						end
					else infobox(client,loc(client,"Fraktionen_135"),"error")end
				else infobox(client,loc(client,"Fraktionen_136"),"error")end
			else infobox(client,loc(client,"Fraktionen_137"),"error")end
		else
			if(Drogenschiff.angelegt == "LV" and Drogenschiff.sell == true)then
				if(getElementData(client,"DrogenschiffDrugs") >= 1)then
					local drugs = getElementData(client,"DrogenschiffDrugs") * Drogenschiff.preis
					local money = drugs/100*150
					setElementData(client,"Geld",getElementData(client,"Geld")+money)
					infobox(client,loc(client,"Fraktionen_138"):format(money),"info")
					setElementData(client,"DrogenschiffDrugs",0)
					outputLog("[Drogenschiff]: "..getPlayerName(client).." hat für $"..money.." Drogen verkauft.","Fraktionen")
				else infobox(client,loc(client,"Fraktionen_139"),"error")end
			else infobox(client,loc(client,"Fraktionen_140"),"error")end
		end
	else infobox(client,loc(client,"Fraktionen_141"),"error")end
end)

-- [[ SCHIFF FAHREN LASSEN ]] --

addEvent("Drogenschiff.abfahrt",true)
addEventHandler("Drogenschiff.abfahrt",root,function()
	if(isEvil(client))then
		if(Drogenschiff.state == false)then
			if(Drogenschiff.angelegt == "LS")then
				if(getElementData(client,"DrogenschiffDrugs") == 0)then
					infobox(client,loc(client,"Fraktionen_142"),"error")
					return false
				end
			end
					
			if(Drogenschiff.angelegt == "LS")then
				if(getDistanceBetweenPoints3D(2875.4033203125,-2052.3950195313,8.6668357849121,getElementPosition(client)) > 10)then
					if(isAktionPause(client))then
						if(isAktionAktiv(client))then
							infobox(client,loc(client,"Fraktionen_143"),"error")
							return false
						end
					end
				end
			elseif(Drogenschiff.angelegt == "LV")then
				if(getDistanceBetweenPoints3D(2351.6687011719,545.11804199219,1.796875,getElementPosition(client)) > 10)then
					infobox(client,loc(client,"Fraktionen_144"),"error")
					return false
				end
			end
				
			if(Drogenschiff.state == false)then
				changeAktionAktiv()
				Drogenschiff.refreshTimer = setTimer(function()
					Drogenschiff.state = false
					changeAktionPause()
					changeAktionAktiv()
					if(Drogenschiff.angelegt == "LV")then
						moveObject(Drogenschiff.shipObject,30000,3081.7802734375,440.63671875,13.2831835746765)
						setTimer(setElementRotation,30000,1,Drogenschiff.shipObject,240000,2968.65185547,-2040.21,16.79500961)
						setTimer(setElementRotation,270100,1,Drogenschiff.shipObject,0,0,360)
						Drogenschiff.angelegt = "LS"
					end
				end,1800000,1)
			end
			Drogenschiff.state = true
			infobox(client,loc(client,"Fraktionen_145"),"info")
			setTimer(function()
				if(Drogenschiff.angelegt == "LS")then
					createBreakingNews("Fraktionen_146")
					moveObject(Drogenschiff.shipObject,240000,3081.7802734375,440.63671875,13.2831835746765)
					setTimer(setElementRotation,240000,1,Drogenschiff.shipObject,0,0,-270)
					setTimer(moveObject,240000,1,Drogenschiff.shipObject,30000,2363.837890625,516.2529296875,13.5234065055847)
					Drogenschiff.angelegt = "LV"
					setTimer(function()
						Drogenschiff.sell = true
					end,270000,1)
					outputLog("[Drogenschiff]: Ein Drogenschiff fährt von Los Santos nach Las Venturas!","Fraktionen")
				elseif(Drogenschiff.angelegt == "LV")then
					createBreakingNews("Fraktionen_147")
					Drogenschiff.sell = false
					setElementRotation(Drogenschiff.shipObject,0,0,270)
					moveObject(Drogenschiff.shipObject,30000,3081.7802734375,440.63671875,13.2831835746765)
					setTimer(setElementRotation,30000,1,Drogenschiff.shipObject,0,0,180)
					setTimer(moveObject,30000,1,Drogenschiff.shipObject,240000,240000, 2968.65185547,-2040.21,16.79500961)
					setTimer(setElementRotation,270100,1,Drogenschiff.shipObject,0,0,360)
					Drogenschiff.angelegt = "LS"
					outputLog("[Drogenschiff]: Ein Drogenschiff fährt von Las Venturas nach Los Santos!","Fraktionen")
				end
				setTimer(function()
					Drogenschiff.state = false
					if(Drogenschiff.angelegt == "LS")then
						changeAktionPause()
						changeAktionAktiv()
						if(isTimer(Drogenschiff.refreshTimer))then
							killTimer(Drogenschiff.refreshTimer)
						end
					end
				end,270200,1)
			end,20000,1)
		else infobox(client,loc(client,"Fraktionen_148"),"error")end
	else infobox(client,loc(client,"Fraktionen_149"),"error")end
end)

-- [[ WAS PASSIERT, WENN DER SPIELER STIRBT ]] --

addEventHandler("onPlayerWasted",root,function()
	setElementData(source,"DrogenschiffDrugs",0)
end)