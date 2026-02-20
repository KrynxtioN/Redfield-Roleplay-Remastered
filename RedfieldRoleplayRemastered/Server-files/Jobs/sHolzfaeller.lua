-- [[ ELEMENTE ERSTELLEN ]] --

Holzfaeller.saw = createObject(1962,-2015.6,-2349.5,31.3,0,0,135)
setObjectScale(Holzfaeller.saw,1.5)

-- [[ WALDZONEN ]] --

for _,v in pairs(Holzfaeller["Waldzonen"])do
	local x1,y1 = tonumber(v[1]),tonumber(v[2])
	local x2,y2 = tonumber(v[3]),tonumber(v[4])
	local xs,ys = math.abs(x1-x2),math.abs(y1-y2)
	Holzfaeller.zone = createColRectangle(x1,y1,xs,ys)
	
	addEventHandler("onColShapeHit",Holzfaeller.zone,function(player)
		if(Holzfaeller.active[player] == true)then
			giveWeapon(player,9,1,true)
		end
	end)
	
	addEventHandler("onColShapeLeave",Holzfaeller.zone,function(player)
		if(Holzfaeller.active[player] == true)then
			takeWeapon(player,9)
		end
	end)
end
 
-- [[ BAUM ERSTELLEN ]] --

function Holzfaeller.cTree(id,model,x,y,z)
	local baum = createObject(model,x,y,z,0,0,math.random(0,360))
	local ped = createPed(0,x,y,z,0)
	setElementFrozen(ped,true)
	setElementAlpha(ped,0)
	attachElements(ped,baum)
	setElementData(baum,"baum",true)
	setElementData(ped,"baum",true)
	setElementData(ped,"attached",baum)
	setElementData(ped,"hits",0)
	setElementData(baum,"baumID",id)
	setElementData(ped,"baumID",id)
end
 
-- [[ STAMM AUF TRANSPORTER LEGEN ]] --

function Holzfaeller.takeStammFromGround(player)
	local veh = getPedOccupiedVehicle(player)
	local Staemme = getElementData(veh,"Staemme")
	if(Staemme < 8)then
		local Stamm = createObject(684,0,0,0)
		setObjectScale(Stamm,0.7)
		setElementCollisionsEnabled(Stamm,false)
		local Position = Staemme + 1
		local tbl = Holzfaeller["Staemme"][Position]
		attachElements(Stamm,veh,tbl[1],tbl[2],tbl[3],tbl[4],tbl[5],tbl[6])
		setElementData(Stamm,"holzfaellerOwner",getPlayerName(player))
		setElementData(veh,"Staemme",getElementData(veh,"Staemme")+1)
		setElementData(Stamm,"id",getElementData(veh,"Staemme"))
	end
end

-- [[ BAUM FÄLLEN ]] --

function Holzfaeller.fellTree(ped,faeller)
	local baum = getElementData(ped,"attached")
	local x,y,z = getElementPosition(baum)
	moveObject(baum,3500,x,y,z,0,80,0)
	setElementCollisionsEnabled(baum,false)
	local baumID = getElementData(baum,"baumID")
	
	setTimer(function(baum,baumID)
		setElementData(baum,"baumOwner",faeller)
		setElementData(baum,"fallen",true)
		setElementCollisionsEnabled(baum,true)
		
		Holzfaeller.timer[baumID] = setTimer(function(baum)
			if(isElement(baum))then
				local baum ID = getElementData(baum,"baumID")
				local x,y,z = getElementPosition(baum)
				destroyElement(baum)
				for _,v in pairs(getElementsByType("ped"))do
					if(getElementData(v,"baumID") and getElementData(v,"baumID") == baumID)then
						destroyElement(v)
					end
				end
				Holzfaeller.cTree(baumID,615,x,y,z)
			end
		end,120000,1,baum)
	end,3500,1,baum,baumID)
	destroyElement(ped)
end

-- [[ BÄUME LADEN ]] --

for i,v in pairs(Holzfaeller["Trees"])do
	Holzfaeller.cTree(i,v[1],v[2],v[3],v[4])
end

-- [[ BAUM-DAMAGE ]] --

function Holzfaeller.baumDamage(ped,attacker)
	if(isElement(ped))then
		if(getElementData(ped,"baum") == true)then
			setElementData(ped,"hits",getElementData(ped,"hits")+1)
			if(getElementData(ped,"hits") >= 50)then
				Holzfaeller.fellTree(ped,getPlayerName(attacker))
			end
		end
	end
end
addEvent("Holzfaeller.baumDamage",true)
addEventHandler("Holzfaeller.baumDamage",root,Holzfaeller.baumDamage)
 
-- [[ ABGABE ]] --

addEvent("Holzfaeller.holzAbgabe",true)
addEventHandler("Holzfaeller.holzAbgabe",root,function()
	if(isPedInVehicle(client))then
		local veh = getPedOccupiedVehicle(client)
		if(getElementData(veh,"holztruck") == true)then
			local Staemme = getElementData(veh,"Staemme")
			if(Staemme >= 1)then
				local money = Staemme * 200
				local Stamm = getAttachedElements(veh)
				giveJobMoney(client,money)
				for _,v in pairs(Stamm)do
					destroyElement(v)
				end
				setElementData(veh,"Staemme",0)
				setElementData(veh,"HolzfaellerPunkte",getElementData(veh,"HolzfaellerPunkte")+money/100*0.5)
			else infobox(client,loc(client,"Jobs_57"),"error")end
		end
	end
end)
 
-- [[ JOB STARTEN (LEVEL 1) ]] --

addEvent("Holzfaeller.level1",true)
addEventHandler("Holzfaeller.level1",root,function()
	if(not(isElement(Holzfaeller.vehicle[client])))then
		if(hasPlayerLicense(client,455))then
			Holzfaeller.active[client] = true
			Holzfaeller.vehicle[client] = createVehicle(455,-1989.4000244141,-2384,31.200000762939,0,0,315)
			setElementData(Holzfaeller.vehicle[client],"holztruck",true)
			setVehicleVariant(Holzfaeller.vehicle[client],3,255)
			warpPedIntoVehicle(client,Holzfaeller.vehicle[client])
			setElementData(Holzfaeller.vehicle[client],"holzfaellerOwner",getPlayerName(client))
			setElementData(Holzfaeller.vehicle[client],"Staemme",0)
			triggerClientEvent(client,"Holzfaeller.createMarker",client,"create")
			
			addEventHandler("onVehicleExplode",Holzfaeller.vehicle[client],function()
				local holzfaellerOwner = getPlayerFromName(getElementData(source,"holzfaellerOwner"))
				Holzfaeller.destroy(holzfaellerOwner)
			end)
			
			addEventHandler("onVehicleEnter",Holzfaeller.vehicle[client],function(player)
				if(isElement(Holzfaeller.stamm[player]))then
					exitVehicle(player)
					infobox(player,loc("Jobs_58"),"error")
				else
					if(getPlayerName(player) ~= getElementData(source,"holzfaellerOwner"))then
						if(getPedOccupiedVehicleSeat(player) == 0)then
							exitVehicle(player)
							infobox(player,loc("Jobs_59"),"error")
						end
					end
				end
			end)
			bindKey(client,"num_0","down",Holzfaeller.destroy)
			addEventHandler("onElementClicked",Holzfaeller.vehicle[client],Holzfaeller.takeStammFromTransporter)
		end
	else infobox(client,loc(client,"Jobs_60"),"error")end
end)
 
-- [[ STAMM VOM TRANSPORTER NEHMEN ]] --

function Holzfaeller.takeStammFromTransporter(button,state,player)
	if(button == "left" and state == "down")then
		if(not(isPedInVehicle(player)))then
			local holzfaellerOwner = getElementData(source,"holzfaellerOwner")
			if(getPlayerName(player) == holzfaellerOwner)then
				local Staemme = getElementData(Holzfaeller.vehicle[player],"Staemme")
				if(Staemme >= 1)then
					if(not(isElement(Holzfaeller.stamm[player])))then
						for _,v in pairs(getElementsByType("object"))do
							if(getElementModel(v) == 684 and getElementData(v,"id") == getElementData(Holzfaeller.vehicle[player],"Staemme") and getElementData(v,"holzfaellerOwner") == getPlayerName(player))then
								destroyElement(v)
							end
						end
						setElementData(Holzfaeller.vehicle[player],"Staemme",getElementData(Holzfaeller.vehicle[player],"Staemme")-1)
						Holzfaeller.stamm[player] = createObject(684,-2013.1999511719,-2351.8999023438,31.10000038147,0,0,0)
						setObjectScale(Holzfaeller.stamm[player],0.7)
						attachElements(Holzfaeller.stamm[player],player,0.4,0,-0.1)
						setElementData(Holzfaeller.stamm[player],"baumstamm",true)
						setElementCollisionsEnabled(Holzfaeller.stamm[player],false)
						toggleControl(player,"sprint",false)
						setElementData(getPedOccupiedVehicle(player),"Staemme",getElementData(getPedOccupiedVehicle(player),"Staemme")-1)
						
						Holzfaeller.stammtimer[player] = setTimer(function(player)
							if(isElement(Holzfaeller.stamm[player]))then
								if(getDistanceBetweenPoints3D(-2012.6279296875,-2350.1589355469,30.625-1,getElementPosition(player)) >= 25)then
									destroyElement(Holzfaeller.stamm[player])
									infobox(player,loc(player,"Jobs_61"),"error")
									if(isTimer(Holzfaeller.stammtimer[player]))then killTimer(Holzfaeller.stammtimer[player])end
								end
							end
						end,1000,0,player)
					else infobox(player,loc(player,"Jobs_62"),"error")end
				else infobox(player,loc(player,"Jobs_63"),"error")end
			else infobox(player,loc(player,"Jobs_64"),"error")end
		end
	end
end
 
-- [[ SÄGEBLATT ]] --

function Holzfaeller.turnSaw()
	if(Holzfaeller.sawing == true)then
		moveObject(Holzfaeller.saw,250,-2015.6,-2349.5,31.3,0,-360,0)
	end
	setTimer(function() Holzfaeller.turnSaw() end,250,1)
end

-- [[ STAMM ZERSCHNEIDEN ]] --

addEvent("Holzfaeller.cutWood",true)
addEventHandler("Holzfaeller.cutWood",root,function()
	if(Holzfaeller.woodSaw == false)then
		if(isElement(Holzfaeller.stamm[client]))then
			Holzfaeller.woodSaw = true
			toggleControl(client,"sprint",true)
			local Stamm = getAttachedElements(client)
			for _,v in pairs(Stamm)do
				if(getElementData(v,"baumstamm") == true)then
					destroyElement(v)
				end
			end
			Holzfaeller.turnSaw()
			HolzfaellerStamm = createObject(684,-2013.1999511719,-2351.8999023438,31.10000038147,0,0,45)
			setObjectScale(HolzfaellerStamm,0.7)
			setTimer(function(client)
				moveObject(HolzfaellerStamm ,30000,-2017.8000488281,-2347.3000488281,31.10000038147,0,0,0)
                setTimer(function(client)
                    moveObject(HolzfaellerStamm ,2500,-2018.4000244141,-2346.5,30.5,-14,0,0)
                    setTimer(function(client)
                        Holzfaeller.sawing = false
                        Holzfaeller.woodSaw = false
                        destroyElement(HolzfaellerStamm)
						Holzfaeller.addWood(client)
                    end,2700,1,client)
                end,30100,1,client)
                selfmadeHolzfaeller.sawing = true
			end,1000,1,client)
			if(isTimer(Holzfaeller.stammtimer[client]))then killTimer(Holzfaeller.stammtimer[client])end
		end
	else infobox(client,loc(client,"Jobs_65"),"error")end
end)
 
-- [[ SPIELER HOLZ GEBEN ]] --

function Holzfaeller.addWood(player)
	local wood = math.random(5,10)
	infobox(player,loc(player,"Jobs_66"):format(wood),"info")
	setElementData(player,"Holz",getElementData(player,"Holz")+wood)
end
 
-- [[ ELEMENTE ZERSTÖREN ]] --

function Holzfaeller.destroy(player)
	if(isElement(Holzfaeller.vehicle[player]))then destroyElement(Holzfaeller.vehicle[player])end
	if(isElement(Holzfaeller.stamm[player]))then destroyElement(Holzfaeller.stamm[player])end
	for _,v in pairs(getElementsByType("object"))do
		if(getElementModel(v) == 684 and getElementData(v,"holzfaellerOwner") == getPlayerName(player))then
			destroyElement(v)
		end
	end
	if(isTimer(Holzfaeller.stammtimer[player]))then killTimer(Holzfaeller.stammtimer[player])end
	Holzfaeller.active[player] = false
	takeWeapon(player,9)
	unbindKey(player,"num_0","down",Holzfaeller.destroy)
	triggerClientEvent(player,"Holzfaeller.createMarker",player)
end

-- [[ WAS PASSIERT, WENN SPIELER STIRBT / QUITTET ]] --

addEventHandler("onPlayerQuit",root,function() Holzfaeller.destroy(source)end)
addEventHandler("onPlayerWasted",root,function() Holzfaeller.destroy(source)end)