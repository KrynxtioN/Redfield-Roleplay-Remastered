-- [[ JOB STARTEN (LEVEL 1) ]] --

addEvent("Postbote.level1",true)
addEventHandler("Postbote.level1",root,function()
	triggerServerEvent("Postbote.level1",localPlayer)
end)

-- [[ ELEMENTE ERSTELLEN ]] --

addEvent("Postbote.createElements",true)
addEventHandler("Postbote.createElements",root,function()
	for i,v in pairs(Postbote["Marker"])do
		Postbote.marker[i] = createMarker(v[1],v[2],v[3]-0.1,"cylinder",2,255,0,0,125)
		Postbote.blip[i] = createBlip(v[1],v[2],v[3],0,1)
			
		addEventHandler("onClientMarkerHit",Postbote.marker[i],function(player)
			if(player == localPlayer)then
				if(not(isPedInVehicle(localPlayer)))then
					if(getElementData(localPlayer,"Paket") == true)then
						triggerServerEvent("Postbote.paketAbgeben",localPlayer)
						destroyElement(Postbote.marker[i])
						destroyElement(Postbote.blip[i])
					end
				end
			end
		end)
	end
	Postbote.newPakete = createMarker(-1983.6999511719,1044.9000244141,55.700000762939-1,"cylinder",5,0,255,0,100)
	Postbote.newPaketeBlip = createBlip(-1983.6999511719,1044.9000244141,55.700000762939,0,2,0,255,0)
		
	addEventHandler("onClientMarkerHit",Postbote.newPakete,function(player)
		if(player == localPlayer)then
			triggerServerEvent("Postbote.paketeAufladen",localPlayer)
		end
	end)
end)

-- [[ ABGABEMARKER LÖSCHEN ]] --

function Postbote.destroyMarker()
	for i = 1,#Postbote["Marker"] do
		if(isElement(Postbote.marker[i]))then
			destroyElement(Postbote.marker[i])
			destroyElement(Postbote.blip[i])
		end
		if(isElement(Postbote.newPakete))then
			destroyElement(Postbote.newPakete)
			destroyElement(Postbote.newPaketeBlip)
		end
	end
	if(isElement(Postbote.newPakete))then destroyElement(Postbote.newPakete)end
	if(isElement(Postbote.newPaketeBlip))then destroyElement(Postbote.newPaketeBlip)end
end
addEvent("Postbote.destroyMarker",true)
addEventHandler("Postbote.destroyMarker",root,Postbote.destroyMarker)