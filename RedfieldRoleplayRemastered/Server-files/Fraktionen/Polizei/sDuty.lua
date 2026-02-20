-- [[ DUTYPICKUPS ERSTELLEN ]] --

for _,v in pairs(FDuty["Pickups"])do
	local pickup = createPickup(v[1],v[2],v[3],3,1239,50)
	if(v[4])then setElementInterior(pickup,v[4])end
	if(v[5])then setElementDimension(pickup,v[5])end
	addEventHandler("onPickupHit",pickup,function(player)
		if(isStateFaction(player))then
			local rearms = getPlayerData("fraktionslager","ID",1,"Pakete")
			triggerClientEvent(player,"Fraktionssystem.openDuty",player,rearms)
		end
	end)
end

-- [[ IST SPIELER IM DIENST? ]] --

function isStaatDuty(player)
	if(getElementData(player,"FDuty") == true)then
		return true
	else
		return false
	end
end

-- [[ REARMEN ]] --

addEvent("FDuty.rearm",true)
addEventHandler("FDuty.rearm",root,function()
	if(isStateFaction(client) and isStaatDuty(client))then
		local rearms = getPlayerData("fraktionslager","ID",1,"Pakete")
		if(tonumber(rearms) >= 1)then
			dbExec(handler,"UPDATE fraktionslager SET Pakete = '"..rearms - 1 .."' WHERE ID = '1'")
			giveWeapon(client,FDuty["Weapons"][getElementData(client,"Fraktion")][1],100,true)
			giveWeapon(client,FDuty["Weapons"][getElementData(client,"Fraktion")][2],500,true)
			giveWeapon(client,FDuty["Weapons"][getElementData(client,"Fraktion")][3],500,true)
			if(getElementData(client,"Fraktionrang")>=4)then
			giveWeapon(client,FDuty["Weapons"][getElementData(client,"Fraktion")][4],25,true)
			end
			setPedArmor(client,100)
			triggerClientEvent(client,"FDuty.refresh",client,rearms-1)
		else infobox(client,loc(client,"Fraktionen_256"),"error")end
	end
end)

-- [[ DIENST BETRETEN / DIENST VERLASSEN ]] --

addEvent("FDuty.duty",true)
addEventHandler("FDuty.duty",root,function()
	if(getElementData(client,"FDuty") ~= true)then
		setElementData(client,"FDuty",true)
		giveWeapon(client,FDuty["Weapons"][getElementData(client,"Fraktion")][1],7,true)
		giveWeapon(client,FDuty["Weapons"][getElementData(client,"Fraktion")][2],30,true)
		giveWeapon(client,FDuty["Weapons"][getElementData(client,"Fraktion")][3],50,true)
		if(getElementData(client,"Fraktionrang")>=4)then
		giveWeapon(client,FDuty["Weapons"][getElementData(client,"Fraktion")][4],1,true)
		end
		setPedArmor(client,100)
		giveFactionSkin(client)
		bindKey(client,"3","down",Staatsfraktionen.tazer)
		bindKey(client,"4","down",Staatsfraktionen.needhelp)
		infobox(client,loc(client,"Fraktionen_257"),"info")
	else
		setElementData(client,"FDuty",false)
		takeAllWeapons(client)
		infobox(client,loc(client,"Fraktionen_258"),"error")
		setElementModel(client,getElementData(client,"Skin"))
		unbindKey(client,"3","down",Staatsfraktionen.tazer)
		unbindKey(client,"4","down",Staatsfraktionen.needhelp)
	end
	triggerClientEvent(client,"setWindowDatas",client)
end)

-- [[ WAS PASSIERT, WENN SPIELER STIRBT ]] --

addEventHandler("onPlayerWasted",root,function()
	if(isStaatDuty(source))then
		setElementData(source,"FDuty",false)
		unbindKey(source,"3","down",Staatsfraktionen.tazer)
		unbindKey(source,"4","down",Staatsfraktionen.needhelp)
	end
end)