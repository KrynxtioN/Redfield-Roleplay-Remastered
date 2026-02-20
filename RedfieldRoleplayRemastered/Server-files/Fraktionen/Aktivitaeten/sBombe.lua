-- [[ BOMBE LEGEN ]] --

function Bombe.legen(player)
	if(isEvil(player))then
		if(isAktionPause(player))then
			if(isAktionAktiv(player))then
				if(getStateFactionMemberOnline() >= 2)then
					if(getElementData(player,"Bomben") >= 1)then
						if(getElementInterior(player) == 0 and getElementDimension(player) == 0)then
							local x,y,z = getElementPosition(player)
							toggleAllControls(player,false)
							setElementFrozen(player,true)
							setPedAnimation(player,"BOMBER","BOM_Plant_Loop")
							Bombe[player] = setTimer(function(player)
								Bombe.object = createObject(1654,x-0.5,y,z-0.85,-90,0,0)
								Bombe.zone = createRadarArea(x-55,y-55,105,105,150,0,0,175,root)
								setRadarAreaFlashing(Bombe.zone,true)
								setElementCollisionsEnabled(Bombe.object,false)
								Bombe.legerFraktion = getElementData(player,"Fraktion")
								toggleAllControls(player,true)
								setElementFrozen(player,false)
								setPedAnimation(player)
								createBreakingNews("Fraktionen_119")
								setElementData(player,"Bomben",getElementData(player,"Bomben")-1)
								outputLog("[Bombe]: "..getPlayerName(player).." hat eine Bombe gelegt.","Fraktionen")
								
								Bombe.explodeTimer = setTimer(function()
									local x,y,z = getElementPosition(Bombe.object)
									createExplosion(x,y,z+1,10)
									destroyElement(Bombe.object)
									destroyElement(Bombe.zone)
									addToLager(Bombe.legerFraktion,"Geld",getAktionsMoney(7500,"Gang"),"fraktionslager")
									changeAktionPause()
									changeAktionAktiv()
									createBreakingNews("Fraktionen_120")
									outputLog("[Bombe]: Eine Bombe ist explodiert!","Fraktionen")
								end,600000,1)
							end,7000,1,player)
							changeAktionAktiv()
						else infobox(player,loc(player,"Fraktionen_121"),"error")end
					end
				else infobox(player,loc(player,"Fraktion_122"),"error")end
			end
		end
	else infobox(player,loc(player,"Fraktion_123"),"error")end
end

-- [[ BOMBE ENTSCHÄRFEN ]] --

addCommandHandler("delbomb",function(player)
	if(isStateFaction(player) and isStaatDuty(player))then
		if(isElement(Bombe.object))then
			local x,y,z = getElementPosition(Bombe.object)
			if(getDistanceBetweenPoints3D(x,y,z,getElementPosition(player)) <= 5)then
				if(getElementData(player,"Defusekits") >= 1)then
					if(Bombe.wirdDefused == false)then
						Bombe.defuser = getPlayerName(player)
						toggleAllControls(player,false)
						setPedAnimation(player,"BOMBER","BOM_Plant_Loop")
						
						Bombe.defuseTimer = setTimer(function(player)
							destroyElement(Bombe.object)
							destroyElement(Bombe.zone)
							toggleAllControls(player,true)
							setPedAnimation(player)
							Bombe.defuser = nil
							changeAktionAktiv()
							changeAktionPause()
							if(isTimer(Bombe.explodeTimer))then killTimer(Bombe.explodeTimer)end
							setElementData(player,"BombDefuser",false)
							addToLager(getElementData(player,"Fraktion"),"Geld",10000,"fraktionslager")
							createBreakingNews("Fraktion_124")
							outputLog("[Bombe]: "..getPlayerName(player).." hat eine Bombe entschärft.","Fraktionen")
						end,30000,1,player)
						
						infobox(player,loc(player,"Fraktion_125"),"info")
						setElementData(player,"Defusekits",getElementData(player,"Defusekits")-1)
						setElementData(player,"BombDefuser",true)
					else infobox(player,loc(player,"Fraktion_126"),"error")end
				else infobox(player,loc(player,"Fraktion_127"),"error")end
			end
		end
	end
end)

-- [[ WAS PASSIERT, WENN SPIELER STIRBT / QUITTET ]] --

addEventHandler("onPlayerWasted",root,function()
	if(isTimer(Bombe[source]))then
		killTimer(Bombe[source])
		changeAktionAktiv()
	end
	if(getElementData(source,"BombDefuser") == true)then
		setElementData(source,"BombDefuser",false)
		if(isTimer(Bombe.defuseTimer))then killTime(Bombe.defuseTimer)end
	end
end)

addEventHandler("onPlayerQuit",root,function()
	if(isTimer(Bombe[source]))then
		killTimer(Bombe[source])
		changeAktionAktiv()
	end
	if(getElementData(source,"BombDefuser") == true)then
		setElementData(source,"BombDefuser",false)
		if(isTimer(Bombe.defuseTimer))then killTime(Bombe.defuseTimer)end
	end
end)