-- [[ ALLIGATOR ERSTELLEN ]] --

function Alligator.createPed()
	Alligator.ped = createPed(262,2869.4736328125,-2125.0302734375,5.1733999252319,270)
	Alligator.colSphere = createColSphere(2869.4736328125,-2125.0302734375,5.1733999252319,50)
	Alligator.alpha = 255
	
	addEventHandler("onColShapeHit",Alligator.colSphere,function(player)
		if(getElementDimension(player) == getElementDimension(source) and isPedOnGround(player))then
			destroyElement(source)
			infobox(player,loc(player,"EasterEggs_1"),"error")
			setPedAnimation(Alligator.ped,"ped","walk_player")
			setPlayerAchievement(player,18)
			
			setTimer(function()
				setTimer(function()
					Alligator.alpha = Alligator.alpha - 10
					setElementAlpha(Alligator.ped,Alligator.alpha)
					if(Alligator.alpha < 10)then
						destroyElement(Alligator.ped)
						setTimer(Alligator.createPed,math.random(3600000,7200000),1)
					end
				end,50,25)
			end,25000,1)
		end
	end)
end
Alligator.createPed()