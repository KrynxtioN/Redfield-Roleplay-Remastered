-- [[ SCHUTZZONEN ERSTELLEN ]] --

for _,v in pairs(Schutzzonen)do
	local zone = createColRectangle(v[1],v[2],v[3],v[4])
	createRadarArea(v[1],v[2],v[3],v[4],0,255,0,150,root)
	
	addEventHandler("onColShapeHit",zone,function(player)
		if(getElementType(player) == "vehicle")then
			local player = getVehicleOccupant(player,0)
			if(player)then
				if(getElementDimension(player) == getElementDimension(source))then
					infobox(player,loc(player,"Systeme_230"):format(v[5]),"info")
				end
			end
		else
			if(getElementDimension(player) == getElementDimension(source))then
				infobox(player,loc(player,"Systeme_230"):format(v[5]),"info")
			end
		end
	end)
end