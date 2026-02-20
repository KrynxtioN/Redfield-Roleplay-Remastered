-- [[ SHOPDATEN AUSGEBEN ]] --

function Bar.getDatas(player)
	local tbl = {}
	for i,v in pairs(Bar["Shop"])do
		table.insert(tbl,{v,getPlayerData("bars","ID",getElementDimension(player),v),getPlayerData("bars","ID",getElementDimension(player),v.."Preis")})
	end
	triggerClientEvent(player,"Bar.setDatas",player,tbl)
end
addEvent("Bar.getDatas",true)
addEventHandler("Bar.getDatas",root,Bar.getDatas)

-- [[ ARTIKEL KAUFEN ]] --

addEvent("Bar.buyDrink",true)
addEventHandler("Bar.buyDrink",root,function(drink)
	local price = getPlayerData("bars","ID",getElementDimension(client),drink.."Preis")
	if(hasMoney(client,price))then
		local oldDrinks = getPlayerData("bars","ID",getElementDimension(client),drink)
		if(getPlayerData("business","Databasename","Bar"..getElementDimension(client),"Besitzer") ~= "Niemand")then
			if(oldDrinks < 1)then
				infobox(client,loc(client,"Shops_113"),"error")
				return false
			end
		end
		
		takeMoney(client,price)
		if(getPlayerData("business","Databasename","Bar"..getElementDimension(client),"Besitzer") ~= "Niemand")then
			dbExec(handler,"UPDATE bars SET "..drink.." = '"..oldDrinks-1 .."' WHERE ID = '"..getElementDimension(client).."'")
			addBizKasse("Bars"..getElementDimension(client),price)
		end
		playerDrink(client)
		Bar.getDatas(client)
	end
end)

-- [[ ETWAS TRINKEN ]] --

function playerDrink(player)
	if(not(isTimer(DrinkTimer[player])))then
		toggleAllControls(player,false)
		setPedAnimation(player,"vending","vend_drink2_p",-1)
		DrinkTimer[player] = setTimer(function(player)
			if(isElement(player))then
				setPedAnimation(player)
				addHarndrang(player)
				setElementHealth(player,getElementHealth(player) + 10)
				if(getElementHealth(player) > 100)then
					setElementHealth(player,100)
				end
				toggleAllControls(player,true)
			end
		end,5000,1,player)
	end
end