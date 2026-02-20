-- [[ TICKET KAUFEN ]] --

addEvent("Lotto.buyTicket",true)
addEventHandler("Lotto.buyTicket",root,function(nr1,nr2,nr3)
	local result = dbPoll(dbQuery(handler,"SELECT * FROM lotto WHERE Username = '"..getPlayerName(client).."'"),-1)
	if(#result == 0)then
		if(hasMoney(client,2500))then
			takeMoney(client,2500)
			infobox(client,loc(client,"Systeme_301"),"info")
			dbExec(handler,"INSERT INTO lotto (Username,Nr1,Nr2,Nr3) VALUES ('"..getPlayerName(client).."','"..nr1.."','"..nr2.."','"..nr3.."')")
		end
	else infobox(client,loc(client,"Systeme_302"),"error")end
end)

-- [[ LOTTOZIEHUNG ]] --

Lotto.timer = setTimer(function()
	local time = getRealTime()
	if(time.hour == 20)then
		if(isTimer(Lotto.timer))then
			local zahl1,zahl2,zahl3 = math.random(1,99),math.random(1,99),math.random(1,99)
			killTimer(Lotto.timer)
			for _,v in pairs(getElementsByType("player"))do
				if(getElementsByType(v,"loggedin") == 1)then
					outputChatBox(loc(v,"Systeme_303"),v,250,150,0)
					outputChatBox(loc(v,"Systeme_304"),v,250,125,0)
				end
			end
			outputChatBox(zahl1..", "..zahl2.." und "..zahl3.."!",root,250,125,0)
			local winner = {}
			local trostpreis = {}
			local result = dbPoll(dbQuery(handler,"SELECT * FROM lotto"),-1)
			for _,v in pairs(result)do
				if(v["Nr1"] == zahl1 and v["Nr2"] == zahl2 and v["Nr3"] == zahl3)then
					table.insert(winner,v["Username"])
				else
					local counter = 0
					if(v["Nr1"] == zahl1)then counter = counter + 1 end
					if(v["Nr2"] == zahl2)then counter = counter + 1 end
					if(v["Nr3"] == zahl3)then counter = counter + 1 end
					if(counter >= 2)then
						table.insert(trostpreis,v["Username"])
					end
				end
			end
			if(#winner >= 1)then
				for _,v in pairs(getElementsByType("player"))do
					if(getElementData(v,"loggedin") == 1)then
						outputChatBox(loc(v,"Systeme_305"):format(Lotto.jackpot),v,250,100,0)
						outputChatBox(loc(v,"Systeme_306"),v,250,100,0)
					end
				end
				for _,v in pairs(winner)do
					local playername = getPlayerFromName(v)
					local gewinn = math.floor(Lotto.jackpot/#winner)
					outputChatBox(v,root,250,100,0)
					if(existPlayer(_,playername))then
						setElementData(playername,"Geld",getElementData(player,"Geld")+gewinn)
						outputChatBox(loc(playername,"Systeme_307"):format(gewinn),playername,255,255,255,true)
					else
						local money = getPlayerData("accounts","Username",v,"Geld")
						dbExec(handler,"UPDATE accounts SET Geld = '"..money + gewinn.."' WHERE Username = '"..v.."'")
						offlinemessage(v,loc(_,"Systeme_308",v):format(gewinn))
					end
				end
			else
				for _,v in pairs(getElementsByType("player"))do
					if(getElementData(v,"loggedin") == 1)then
						outputChatBox(loc(v,"Systeme_309"),v,250,100,0)
					end
				end
			end
			for _,v in pairs(getElementsByType("player"))do
				if(getElementData(v,"loggedin") == 1)then
					outputChatBox(loc(v,"Systeme_310"),v,250,100,0)
				end
			end
			if(#trostpreis >= 1)then
				for _,v in pairs(trostpreis)do
					local playername = getPlayerFromName(v)
					local trostpreis = 1250
					if(existPlayer(_,playername))then
						setElementData(playername,"Geld",getElementData(player,"Geld")+trostpreis)
						outputChatBox(loc(playername,"Systeme_311"):format(trostpreis),playername,255,255,255,true)
					else
						local money = getPlayerData("accounts","Username",v,"Geld")
						dbExec(handler,"UPDATE accounts SET Geld = '"..money + trostpreis.."' WHERE Username = '"..v.."'")
						offlinemessage(v,loc(_,"Systeme_312",v):format(trostpreis))
					end
				end
			end
			dbExec(handler,"DELETE FROM lotto")
		end
	end
end,60000,0)