-- [[ ABGABEMARKER ERSTELLEN / LÖSCHEN ]] --

function Flaggenjagd.client(x,y,z)
	if(isElement(Flaggenjagd.clientMarker))then destroyElement(Flaggenjagd.clientMarker)end
	if(isElement(Flaggenjagd.Blip))then destroyElement(Flaggenjagd.Blip)end
	if(x and y and z)then
		Flaggenjagd.clientMarker = createMarker(x,y,z - 0.9,"cylinder",1,255,0,0)
		Flaggenjagd.Blip = createBlip(x,y,z,0,2,255,0,0)
		
		addEventHandler("onClientMarkerHit",Flaggenjagd.clientMarker,function(player)
			if(player == localPlayer)then
				Flaggenjagd.client()
				triggerServerEvent("Flaggenjagd.placeFlag",localPlayer,getElementData(localPlayer,"Fraktion"))
			end
		end)
	end
end
addEvent("Flaggenjagd.client",true)
addEventHandler("Flaggenjagd.client",root,Flaggenjagd.client)