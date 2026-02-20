-- [[ FUNKTION ZUM ERSTELLEN DER MARKER FÜR RENNEN ]] --

function Adminsystem.createEventMarker(type,event)
	if(event)then Adminsystem.event = event end
	if(isElement(Adminsystem.eventMarker))then destroyElement(Adminsystem.eventMarker)end
	if(isElement(Adminsystem.eventBlip))then destroyElement(Adminsystem.eventBlip)end
	
	if(type)then
		setElementData(localPlayer,"EventMarkerID",getElementData(localPlayer,"EventMarkerID")+1)
		local MarkerID = getElementData(localPlayer,"EventMarkerID")
		local tbl = Adminsystem[Adminsystem.event]["Marker"][MarkerID]
		Adminsystem.eventMarker = createMarker(tbl[1],tbl[2],tbl[3],"checkpoint",2,255,0,0,150)
		setElementDimension(Adminsystem.eventMarker,getElementDimension(localPlayer))
		Adminsystem.eventBlip = createBlip(tbl[1],tbl[2],tbl[3],0,2,255,0,0)
		setElementDimension(Adminsystem.eventBlip,getElementDimension(localPlayer))
		
		addEventHandler("onClientMarkerHit",Adminsystem.eventMarker,function(player)
			if(player == localPlayer)then
				if(getElementData(localPlayer,"EventMarkerID") >= #Adminsystem[Adminsystem.event]["Marker"])then
					triggerServerEvent("Adminsystem.eventGewonnen",localPlayer)
				else
					Adminsystem.createEventMarker("create")
				end
			end
		end)
	end
end
addEvent("Adminsystem.createEventMarker",true)
addEventHandler("Adminsystem.createEventMarker",root,Adminsystem.createEventMarker)