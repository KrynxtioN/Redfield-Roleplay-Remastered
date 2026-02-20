-- [[ JOB STARTEN (LEVEL 1) ]] --

addEvent("Busfahrer.level1",true)
addEventHandler("Busfahrer.level1",root,function()
	infobox("Steige in einen Bus.","info")
end)

-- [[ ABGABEMARKER ERSTELLEN / LÖSCHEN ]] --

function Busfahrer.createMarker(type)
	if(Busfahrer.route == 0)then Busfahrer.route = math.random(1,#Busfahrer["Routen"])end
	if(isElement(Busfahrer.marker))then destroyElement(Busfahrer.marker)end
	if(isElement(Busfahrer.blip))then destroyElement(Busfahrer.blip)end
	
	if(type)then
		if(Busfahrer.points < #Busfahrer["Routen"][Busfahrer.route])then
			Busfahrer.points = Busfahrer.points + 1
			local tbl = Busfahrer["Routen"][Busfahrer.route][Busfahrer.points]
			Busfahrer.marker = createMarker(tbl[1],tbl[2],tbl[3]-0.5,"cylinder",2,255,0,0,150)
			Busfahrer.blip = createBlip(tbl[1],tbl[2],tbl[3],0,2,255,0,0)
			
			addEventHandler("onClientMarkerHit",Busfahrer.marker,function(player)
				if(player == localPlayer)then
					if(tbl[4] == true)then
						infobox(loc("Jobs_41"),"info")
						setElementFrozen(getPedOccupiedVehicle(localPlayer),true)
						Job.timer = setTimer(function()
							setElementFrozen(getPedOccupiedVehicle(localPlayer),false)
							Busfahrer.createMarker("create")
						end,7000,1)
					else
						Busfahrer.createMarker("create")
					end
				end
			end)
		else
			triggerServerEvent("giveJobMoney",localPlayer,localPlayer,2000)
			Busfahrer.refreshPoints()
			Busfahrer.createMarker("create")
			setElementData(localPlayer,"BusfahrerPunkte",getElementData(localPlayer,"BusfahrerPunkte")+2000/100*0.5)
		end
	end
end
addEvent("Busfahrer.createMarker",true)
addEventHandler("Busfahrer.createMarker",root,Busfahrer.createMarker)

-- [[ PUNKTE AUF NULL SETZEN ]] --

function Busfahrer.refreshPoints()
	Busfahrer.route = 0
	Busfahrer.points = 0
end
addEvent("Busfahrer.refreshPoints",true)
addEventHandler("Busfahrer.refreshPoints",root,Busfahrer.refreshPoints)