-- [[ HAT SPIELER GENUG GELD? ]] --

function hasMoney(player,money)
	local money = tonumber(money)
	if(getElementData(player,"Schulden") == 0)then
		if(getElementData(player,"Kreditkarte") == 0)then
			if(getElementData(player,"Geld") >= money)then
				return true
			else
				infobox(player,loc(player,"Systeme_233"):format(money),"error")
				return false
			end
		else
			if(getElementData(player,"Bankgeld") >= money+(money/100*2))then
				return true
			else
				infobox(player,loc(player,"Systeme_234"):format(money+(money/100*2)),"error")
				return false
			end
		end
	else infobox(player,loc(player,"Systeme_235"),"error")end
end

-- [[ GELD ABZIEHEN ]] --

function takeMoney(player,money)
	local money = tonumber(money)
	if(getElementData(player,"Kreditkarte") == 0)then
		setElementData(player,"Geld",getElementData(player,"Geld")-money)
	else
		setElementData(player,"Bankgeld",getElementData(player,"Bankgeld")-money+money/100*2)
	end
end

-- [[ GELD VERGEBEN ]] --

addCommandHandler("pay",function(player,cmd,target,summe)
	if(getElementData(player,"loggedin") == 1)then
		if(target and summe)then
			local summe = tonumber(summe)
			if(hasMoney(player,summe))then
				local target = getPlayerFromName(target)
				if(existPlayer(player,target))then
					takeMoney(player,summe)
					setElementData(target,"Geld",getElementData(target,"Geld")+summe)
					infobox(player,loc(player,"Systeme_236"):format(getPlayerName(target),summe),"info")
					infobox(target,loc(target,"Systeme_237"):format(getPlayerName(player),summe),"info")
				end
			end
		else infobox(player,loc(player,"Systeme_238"),"error")end
	end
end)