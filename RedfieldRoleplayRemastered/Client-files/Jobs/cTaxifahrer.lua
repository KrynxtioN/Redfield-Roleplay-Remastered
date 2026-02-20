-- [[ STARTEN (LEVEL 1) ]] --

addEvent("Taxifahrer.level1",true)
addEventHandler("Taxifahrer.level1",root,function()
	infobox(loc("Jobs_37"),"info")
end)

-- [[ BLIPS ERSTELLEN ]] --

addEvent("Taxifahrer.createBlips",true)
addEventHandler("Taxifahrer.createBlips",root,function(tbl)
	if(#Taxifahrer.blips >= 1)then
		for _,v in pairs(Taxifahrer.blips)do
			destroyElement(v)
		end
		Taxifahrer.blips = {}
	end
	
	if(tbl and #tbl >= 1)then
		for _,v in pairs(tbl)do
			Taxifahrer.blips[v[1]] = createBlip(v[2],v[3],v[4],0,2,255,0,0)
		end
	end
end)

-- [[ ABGABEMARKER ]] --

addEvent("Taxifahrer.createAbgabemarker",true)
addEventHandler("Taxifahrer.createAbgabemarker",root,function()
	local rnd = math.random(1,#Taxifahrer["Ziele"])
	local tbl = Taxifahrer["Ziele"][rnd]
	Taxifahrer.marker = createMarker(tbl[1],tbl[2],tbl[3],"cylinder",2,255,0,0,100)
	Taxifahrer.abgabeBlip = createBlip(tbl[1],tbl[2],tbl[3],53)
	infobox(loc("Jobs_38"):format(tbl[4]),"info")
										
	addEventHandler("onClientMarkerHit",Taxifahrer.marker,function(player)
		if(player == localPlayer)then
			triggerServerEvent("giveJobMoney",localPlayer,localPlayer,75)
			destroyElement(source)
			destroyElement(Taxifahrer.abgabeBlip)
			triggerServerEvent("Taxifahrer.destroyPed",localPlayer)
			setElementData(localPlayer,"TaxifahrerPunkte",getElementData(localPlayer,"TaxifahrerPunkte")+1)
		end
	end)
end)

-- [[ ELEMENTE ZERSTÖREN ]] --

function Taxifahrer.destroyElements()
	if(#Taxifahrer.blips >= 1)then
		for _,v in pairs(Taxifahrer.blips)do
			destroyElement(v)
		end
		Taxifahrer.blips = {}
	end
	if(isElement(Taxifahrer.marker))then destroyElement(Taxifahrer.marker)end
	if(isElement(Taxifahrer.abgabeBlip))then destroyElement(Taxifahrer.abgabeBlip)end
end
addEvent("Taxifahrer.destroyElements",true)
addEventHandler("Taxifahrer.destroyElements",root,Taxifahrer.destroyElements)