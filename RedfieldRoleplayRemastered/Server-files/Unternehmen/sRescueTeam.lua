-- [[ EINSATZ GENERIEREN ]] --

function RescueTeam.createEinsatz()
	if(getMembersOnline("Unternehmen",3) >= 1)then
		if(RescueTeam.activeEinsatz == false)then
			if(math.random(1,1) == 1)then
				local fire = math.random(1,#RescueTeam["FireCoordinates"])
				for _,v in pairs(getElementsByType("player"))do
					if(getElementData(v,"loggedin") == 1)then
						if(getElementData(v,"Unternehmen") == 3)then
							outputChatBox(loc(v,"Unternehmen_91"):format(RescueTeam["FireNames"][fire]),v,255,255,255,true)
						end
					end
				end
				RescueTeam.activeEinsatzText = "#fa6400[INFO] #FFFFFFIn/Am #fa6400"..RescueTeam["FireNames"][fire].." #FFFFFFist ein Feuer ausgebrochen!"
				RescueTeam.blipPos = {RescueTeam["FireBlips"][fire][1],RescueTeam["FireBlips"][fire][2],RescueTeam["FireBlips"][fire][3]}
				
				for _,v in pairs(RescueTeam["FireCoordinates"][fire])do
					createFireElement(v[1],v[2],v[3]-0.9,math.random(2,4),false)
				end
			end

			for _,v in pairs(getElementsByType("player"))do
				if(getElementData(v,"Unternehmen") == 3)then
					triggerClientEvent(v,"RescueTeam.einsatzBlip",v,"create",RescueTeam.blipPos[1],RescueTeam.blipPos[2],RescueTeam.blipPos[3])
				end
			end
		end
	end
end
setTimer(RescueTeam.createEinsatz,900000,0)

-- [[ CHECKEN OB EINSATZ AKTIV IST ]] --

function RescueTeam.checkEinsatz(player)
	if(getElementData(player,"Unternehmen") == 3)then
		if(RescueTeam.activeEinsatz == true)then
			outputChatBox(RescueTeam.activeEinsatzText,player,255,255,255,true)
			triggerClientEvent(v,"RescueTeam.einsatzBlip",v,"create",RescueTeam.blipPos[1],RescueTeam.blipPos[2],RescueTeam.blipPos[3])
		end
	end
end