-- [[ DUTYPICKUPS ERSTELLEN ]] --

for _,v in pairs(Unternehmen["Dutypoints"])do
	local pickup = createPickup(v[1],v[2],v[3],3,1239,50)
	setElementInterior(pickup,v[4])
	setElementDimension(pickup,v[5])
	
	addEventHandler("onPickupHit",pickup,function(player)
		if(not(isPedInVehicle(player)))then
			if(getElementDimension(player) == getElementDimension(source))then
				if(getElementData(player,"Unternehmen") == v[6])then
					triggerClientEvent(player,"Unternehmen.openDuty",player)
				end
			end
		end
	end)
end

-- [[ IST SPIELER IM DIENST? ]] --

function isUnternehmenDuty(player)
	if(getElementData(player,"UDuty") == true)then
		return true
	else
		return false
	end
end

-- [[ DEN DIENST BEGINNEN / BEENDEN ]] --

addEvent("Unternehmen.duty",true)
addEventHandler("Unternehmen.duty",root,function()
	if(getElementData(client,"Unternehmen") >= 1)then
		if(not(isStaatDuty(client)))then
			if(getElementData(client,"UDuty") ~= true)then
				setElementData(client,"UDuty",true)
				infobox(client,loc(client,"Unternehmen_110"),"info")
				setElementModel(client,Fraktionssystem["Unternehmenskins"][getElementData(client,"Unternehmen")][getElementData(client,"Unternehmenrang")]+1)
				if(getElementData(client,"Unternehmen") == 1)then
					triggerClientEvent(client,"Mechaniker.abschleppen",client,"create")
					giveWeapon(client,41,500,true)
				end
			else
				setElementData(client,"UDuty",false)
				infobox(client,loc(client,"Unternehmen_111"),"error")
				setElementModel(client,getElementData(client,"Skin"))
				if(getElementData(client,"Unternehmen") == 1)then
					triggerClientEvent(client,"Mechaniker.abschleppen",client)
				end
			end
			triggerClientEvent(client,"setWindowDatas",client)
		else infobox(client,loc(client,"Unternehmen_112"),"error")end
	end
end)

-- [[ WAS PASSIERT, WENN DER SPIELER STIRBT ]] --

addEventHandler("onPlayerWasted",root,function()
	if(isUnternehmenDuty(source))then
		setElementData(source,"UDuty",false)
	end
end)