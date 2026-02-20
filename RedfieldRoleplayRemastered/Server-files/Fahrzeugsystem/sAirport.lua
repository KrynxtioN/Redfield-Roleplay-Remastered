-- [[ DER FLUG ]] --

addEvent("Airport.fliegen",true)
addEventHandler("Airport.fliegen",root,function(type)
	if(hasMoney(client,1000))then
		takeMoney(client,1000)
		setElementData(client,"AirportStadt",type)
		triggerClientEvent(client,"setWindowDatas",client)
		setElementPosition(client,4.0620999336243,22.984399795532,1199.6011962891)
		setPedRotation(client,90)
		setElementInterior(client,1)
		setElementDimension(client,getFreeDimension())
		infobox(client,"Der Flug dauert 45 Sekunden.","info")
		setPlayerAchievement(client,24)
		Airport.timer[client] = setTimer(function(client)
			if(isElement(client))then
				local stadt = getElementData(client,"AirportStadt")
				local x,y,z,rot = Airport["Spawnpoints"][stadt][1],Airport["Spawnpoints"][stadt][2],Airport["Spawnpoints"][stadt][3],Airport["Spawnpoints"][stadt][4]
				local int,dim = Airport["Spawnpoints"][stadt][5],Airport["Spawnpoints"][stadt][6]
				setElementPosition(client,x,y,z)
				setPedRotation(client,rot)
				setElementInterior(client,int)
				setElementDimension(client,dim)
			end
		end,45000,1,client)
	end
end)

-- [[ WAS PASSIERT, WENN SPIELER QUITTET / STIRBT ]] --

function Airport.killTimer(player)
	if(isTimer(Airport.timer[player]))then
		killTimer(Airport.timer[player])
	end
end

addEventHandler("onPlayerQuit",root,function() Airport.killTimer(source) end)
addEventHandler("onPlayerWasted",root,function() Airport.killTimer(source) end)