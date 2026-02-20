-- [[ GANGTAGS LADEN ]] --

local result = dbPoll(dbQuery(handler,"SELECT * FROM gangtags"),-1)

if(#result >= 1)then
	for _,v in pairs(result)do
		Gangtags.marker[v["ID"]] = createMarker(v["Mx"],v["My"],v["Mz"],"cylinder",1.5,255,0,0,0)
		setElementData(Gangtags.marker[v["ID"]],"GangtagsID",v["ID"])
		setElementData(Gangtags.marker[v["ID"]],"GangtagsBesitzer",v["Besitzer"])
		setElementData(Gangtags.marker[v["ID"]],"KannGespruehtWerden",true)
		Gangtags.objects[v["ID"]] = createObject(2717,v["Ox"],v["Oy"],v["Oz"],0,0,v["ORot"])
		
		addEventHandler("onMarkerHit",Gangtags.marker[v["ID"]],function(player)
			if(not(isPedInVehicle(player)) and isPedOnGround(player))then
				if(getElementDimension(player) == getElementDimension(source))then
					if(isEvil(player) or getElementData(player,"Unternehmen") == 1 and isUnternehmenDuty(player))then
						if(getPedWeapon(player) == 41)then
							if(getElementData(source,"KannGespruehtWerden") == true)then
								local ID = getElementData(source,"GangtagsID")
								setElementFrozen(player,true)
								toggleAllControls(player,false)
								setPedAnimation(player,"spraycan","spraycan_fire")
								setElementData(source,"KannGespruehtWerden",false)
								Gangtags.timer[player] = setTimer(function(player,id)
									if(math.random(1,100) > 1)then
										if(getElementData(player,"Unternehmen") == 1 and isUnternehmenDuty(player))then
											setElementData(Gangtags.marker[id],"GangtagsBesitzer","Mechaniker")
										else
											if(isEvil(player))then
												local fac = getElementData(player,"Fraktion")
												setElementData(Gangtags.marker[id],"GangtagsBesitzer",Gangtags["TagNames"][fac])
											end
										end
									else
										infobox(player,loc(player,"Fraktionen_332"),"info")
										setElementData(player,"Geld",getElementData(player,"Geld")+500)
										setElementData(Gangtags.marker[id],"GangtagsBesitzer","Special"..math.random(1,3))
									end

									dbExec(handler,"UPDATE gangtags SET Besitzer = '"..getElementData(Gangtags.marker[id],"GangtagsBesitzer").."' WHERE ID = '"..id.."'")
									setElementFrozen(player,false)
									toggleAllControls(player,true)
									setPedAnimation(player)
									
									setTimer(function(marker)
										setElementData(marker,"KannGespruehtWerden",true)
									end,3600000,1,Gangtags.marker[id])
									
									for _,v in pairs(getElementsByType("player"))do
										Gangtags.loadTextures(v)
									end
								end,25000,1,player,ID)
							else infobox(player,loc(player,"Fraktionen_333"),"error")end
						else infobox(player,loc(player,"Fraktionen_334"),"error")end
					end
				end
			end
		end)
	end
end

-- [[ TEXTUREN LADEN ]] --

function Gangtags.loadTextures(player)
	for i,v in pairs(Gangtags.marker)do
		local Besitzer = getElementData(v,"GangtagsBesitzer")
		triggerClientEvent(player,"Gangtags.loadTextures",player,Gangtags.objects[i],Besitzer)
	end
end

-- [[ WAS PASSIERT, WENN DER SPIELER STIRBT / QUITTET ]] --

function Gangtags.killTimer(player)
	if(isTimer(Gangtags.timer[player]))then
		killTimer(Gangtags.timer[player])
	end
end

addEventHandler("onPlayerQuit",root,function() Gangtags.killTimer(source) end)
addEventHandler("onPlayerWasted",root,function() Gangtags.killTimer(source) end)