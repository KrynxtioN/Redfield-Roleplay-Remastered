-- [[ SEQUENZ ELEMENTE LADEN ]] --

addEvent("Sequenzen.server",true)
addEventHandler("Sequenzen.server",root,function()
	Sequenzen.vehicle[client] = createVehicle(554,398.32620239258,2435.1589355469,16.694999694824,0,0,270)
	setVehicleColor(Sequenzen.vehicle[client],255,255,255)
	setElementModel(client,0)
	setElementDimension(Sequenzen.vehicle[client],getElementDimension(client))
	setVehicleDamageProof(Sequenzen.vehicle[client],true)
	
	addEventHandler("onVehicleEnter",Sequenzen.vehicle[client],function(player)
		if(getPedOccupiedVehicleSeat(player) == 0)then
			infobox(player,loc(player,"Tutorial_11"),"info")
			triggerClientEvent(player,"Rundfahrt.skip",player)
		end
	end)
end)