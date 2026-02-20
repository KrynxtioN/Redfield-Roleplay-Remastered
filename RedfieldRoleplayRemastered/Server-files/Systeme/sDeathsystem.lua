-- [[ WAFFEN DIE DROPPEN KÖNNEN ]] --

local Waffen = {
	[24] = 348,
	[29] = 353,
	[31] = 356,
	[33] = 357,
	[25] = 349,
	[28] = 352,
	[30] = 355}

-- [[ SPIELER STIRBT ]] --

addEventHandler("onPlayerWasted",root,function(ammo,attacker,weapon,bodypart)
	if(getElementData(source,"elementClicked") == true)then
		triggerClientEvent(source,"setWindowDatas",source)
	end
	
	if(getElementData(source,"Boxfight") ~= true)then
		if(getElementData(source,"Lobby") == "Deagle-Arena")then
			setTimer(function(source)
				if(isElement(source))then
					DeagleArena.spawnPlayer(source)
				end
			end,2500,1,source)
		elseif(getElementData(source,"Lobby") == "Shooter-Arena")then
			setTimer(function(source)
				if(isElement(source))then
					spawnPlayer(source,getPlayerData("accounts","Username",getPlayerName(source),"Spawnx"),getPlayerData("accounts","Username",getPlayerName(source),"Spawny"),getPlayerData("accounts","Username",getPlayerName(source),"Spawnz"),getPlayerData("accounts","Username",getPlayerName(source),"Spawnrotz"),getPlayerData("accounts","Username",getPlayerName(source),"Skin"),0,100)
					Shooterarena.join(source)
				end
			end,2500,1,source)
		else
			if(getElementData(source,"Lobby") == "Reallife")then
				local money = math.floor(getElementData(source,"Geld")/100*25)
				local drugs = math.floor(getElementData(source,"Gras")/100*50)
				local x,y,z = getElementPosition(source)
					
				if(isElement(Krankenhaus.money[source]))then destroyElement(Krankenhaus.money[source])end
				if(isElement(Krankenhaus.drugs[source]))then destroyElement(Krankenhaus.drugs[source])end
				if(isElement(Krankenhaus.waffe[source]))then destroyElement(Krankenhaus.waffe[source])end
				
				if(money >= 1)then
					Krankenhaus.money[source] = createPickup(x,y,z,3,1212,50)
					setElementData(Krankenhaus.money[source],"Geld",money)
					setElementData(source,"Geld",getElementData(source,"Geld")-money)
						
					addEventHandler("onPickupHit",Krankenhaus.money[source],function(player)
						setElementData(player,"Geld",getElementData(player,"Geld")+getElementData(source,"Geld"))
						infobox(player,loc(player,"Systeme_363"):format(getElementData(source,"Geld")),"info")
						destroyElement(source)
					end)
				end
				
				if(drugs >= 1)then
					Krankenhaus.drugs[source] = createPickup(x,y,z,3,1279,50)
					setElementData(Krankenhaus.drugs[source],"Drugs",drugs)
					setElementData(source,"Gras",getElementData(source,"Gras")-drugs)
						
					addEventHandler("onPickupHit",Krankenhaus.drugs[source],function(player)
						setElementData(player,"Gras",getElementData(player,"Gras")+getElementData(source,"Drugs"))
						infobox(player,loc(player,"Systeme_364"):format(getElementData(source,"Drugs")),"info")
						destroyElement(source)
					end)
				end
					
				if(Waffen[weapon])then
					Krankenhaus.waffe[source] = createPickup(x,y,z,3,Waffen[weapon],50)
					setElementData(Krankenhaus.waffe[source],"Waffe",weapon)
					setElementData(Krankenhaus.waffe[source],"Munition",ammo)
						
					addEventHandler("onPickupHit",Krankenhaus.waffe[source],function(player)
						giveWeapon(player,getElementData(source,"Waffe"),getElementData(source,"Munition"),true)
						infobox(player,loc(player,"Systeme_365"),"info")
						destroyElement(source)
					end)
				end
				triggerClientEvent(source,"Krankenhaus.dxDraw",source)
				setElementData(source,"Tode",getElementData(source,"Tode")+1)
			end
		end
	else
		if(getElementData(source,"SavedDimension") ~= nil)then dim = getElementData(source,"SavedDimension") else dim = 1 end
		triggerClientEvent(source,"Boxer.stopFight",source,"verloren")
		spawnPlayer(source,764.71478271484,9.5778760910034,1000.7110595703,270,getPlayerData("accounts","Username",getPlayerName(source),"Skin"),5,dim)
	end
end)