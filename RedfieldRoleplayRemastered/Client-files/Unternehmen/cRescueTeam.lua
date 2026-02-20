-- [[ EINSATZBLIP ]] --

addEvent("RescueTeam.einsatzBlip",true)
addEventHandler("RescueTeam.einsatzBlip",root,function(type,x,y,z)
	if(isElement(RescueTeam.einsatzBlip))then destroyElement(RescueTeam.einsatzBlip)end
	if(type)then
		RescueTeam.einsatzBlip = createBlip(x,y,z,20)
	end
end)