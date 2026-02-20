-- [[ OBJEKTE ERSTELLEN ]] --

for i,v in ipairs(Gym["Objekte"])do
	if(not(isElement(Gym.objects[i])))then
		Gym.objects[i] = createObject(v[1],v[2],v[3],v[4],v[5],v[6],v[7])
		setElementAlpha(Gym.objects[i],v[8])
		setElementInterior(Gym.objects[i],5)
		setElementDimension(Gym.objects[i],2)
	end
end

-- [[ MARKER ERSTELLEN / TRAINING BEGINNEN ]] --

for _,v in ipairs(Gym["Marker"])do
	if(not(isElement(Gym.marker[v[4]])))then
		Gym.marker[v[4]] = createMarker(v[1],v[2],v[3],"cylinder",1.5,255,255,255,5)
		setElementInterior(Gym.marker[v[4]],5)
		setElementDimension(Gym.marker[v[4]],2)
		setElementData(Gym.marker[v[4]],"GymID",v[4])
		
		addEventHandler("onMarkerHit",Gym.marker[v[4]],function(player)
			if(getElementDimension(player) == getElementDimension(source))then
				if(getElementAlpha(source) >= 5)then
					if(getElementData(player,"Markerschutz") ~= true)then
						triggerClientEvent(player,"Gym.dxDraw",player,"create")
						setElementData(player,"GymID",getElementData(source,"GymID"))
						local GymID = getElementData(player,"GymID")
						setElementData(player,"GymFaengtAn",true)
						if(GymID == 1)then
							Gym.settings(player)
							Gym.toggleControlOn(player)
							setElementData(player,"GymGeraet","Hanteln")
							setElementPosition(player,772.70001220703,5.3000001907349,1000.799987793)
							setPedRotation(player,270)
							setPedAnimation(player,"Freeweights","gym_free_pickup")
							setElementAlpha(source,0)
							setTimer(function(player)
								if(isElement(player) and not(isPedDead(player)))then
									exports.bone_attach:attachElementToBone(Gym.objects[1],player,11,0,0,0.1,0,90,90)
									exports.bone_attach:attachElementToBone(Gym.objects[2],player,12,0,0,0.1,0,90,90)
								end
							end,2000,1,player)
							setTimer(function(player)
								if(isElement(player) and not(isPedDead(player)))then
									setPedAnimation(player)
									setCameraMatrix(player,774.95367431641,5.2439999580383,1001.4069213867,773.95764160156,5.2833790779114,1001.3270263672,0,70)
									setElementData(player,"GymFaengtAn",false)
								end
							end,3000,1,player)
						elseif(GymID == 2)then
							Gym.settings(player)
							Gym.toggleControlOn(player)
							setElementData(player,"GymGeraet","Gewichtstange")
							setElementPosition(player,773.05920410156,1.4139122962952,1000.7208862305)
							setPedRotation(player,270)
							attachElements(player,Gym.objects[4],0,-0.1,1)
							setPedAnimation(player,"benchpress","gym_bp_geton")
							Gym.timer[player] = setTimer(function(player)
								if(isElement(player) and not(isPedDead(player)))then
									setPedAnimationProgress(player,"gym_bp_down",0.5)
								end
							end,50,0,player)
							setElementAlpha(source,0)
							setTimer(function(player)
								if(isElement(player) and not(isPedDead(player)))then
									setElementFrozen(player,true)
									setPedAnimation(player,"benchpress","gym_bp_down")
									exports.bone_attach:attachElementToBone(Gym.objects[3],player,12,0.1,0,0,0,270,0)
									setCameraMatrix(player,770.18927001953,5.6367998123169,1002.357421875,770.83917236328,4.9312071800232,1002.0750732422,0,70)
									setElementData(player,"GymFaengtAn",false)
								end
							end,3000,1,player)
						elseif(GymID == 3)then
							Gym.settings(player)
							setElementData(player,"GymGeraet","Laufband")
							Gym.toggleControlOn(player)
							setElementAlpha(source,0)
							setElementPosition(player,773.47369384766,-1.2544301748276,1000.725769043)
							setPedRotation(player,180)
							setPedAnimation(player,"GYMNASIUM","gym_tread_geton")
							setTimer(function(player)
								if(isElement(player) and not(isPedDead(player)))then
									setElementFrozen(player,true)
									setPedAnimation(player)
									setCameraMatrix(player,768.46160888672,-0.88109999895096,1001.5966796875,769.40936279297,-1.1891431808472,1001.5139770508,0,70)
									setElementData(player,"GymFaengtAn",false)
								end
							end,2000,1,player)
						elseif(GymID == 4)then
							Gym.settings(player)
							setElementData(player,"GymGeraet","Laufrad")
							Gym.toggleControlOn(player)
							setElementAlpha(source,0)
							setElementPosition(player,772.53833007813,8.8626050949097,1000.7067260742)
							setPedRotation(player,90)
							attachElements(player,Gym.objects[5],0,0.6,1)
							setTimer(function(player)
								if(isElement(player) and not(isPedDead(player)))then
									setPedAnimation(player,"GYMNASIUM","gym_bike_geton")
								end
							end,50,1,player)
							setElementFrozen(player,true)
							setTimer(function(player)
								if(isElement(player) and not(isPedDead(player)))then
									setPedAnimation(player,"GYMNASIUM","gym_bike_still")
									setCameraMatrix(player,766.53411865234,4.1700000762939,1002.0767822266,767.25927734375,4.8423671722412,1001.9281005859,0,70)
									setElementData(player,"GymFaengtAn",false)
								end
							end,1000,1,player)
						end
					end
				end
			end
		end)
	end
end

-- [[ TRAINIEREN ]] --

function Gym.trainieren(player,key,state)
	if(getElementData(player,"GymGeraet") ~= nil)then
		local GymGeraet = getElementData(player,"GymGeraet")
		if(GymGeraet == "Hanteln")then
			if(state == "down")then
				setPedAnimation(player,"Freeweights","gym_free_A")
				Gym.timer[player] = setTimer(function(player)
					if(isElement(player) and not(isPedDead(player)))then
						setPedAnimation(player,"Freeweights","gym_free_down")
						Gym.timer[player] = setTimer(function(player)
							if(isElement(player) and not(isPedDead(player)))then
								setPedAnimation(player)
								giveMuskelnAndFett(player)
							end
						end,500,1,player)
					end
				end,1700,1,player)
			elseif(state == "up")then
				setPedAnimation(player)
				if(isTimer(Gym.timer[player]))then killTimer(Gym.timer[player])end
			end
		elseif(GymGeraet == "Gewichtstange")then
			if(isTimer(Gym.timer[player]))then killTimer(Gym.timer[player])end
			if(state == "down")then
				setPedAnimation(player,"benchpress","gym_bp_up_A")
				Gym.timer[player] = setTimer(function(player)
					if(isElement(player) and not(isPedDead(player)))then
						setPedAnimation(player,"benchpress","gym_bp_down")
						Gym.timer[player] = setTimer(function(player)
							if(isElement(player) and not(isPedDead(player)))then
								setPedAnimation(player,"benchpress","gym_bp_down")
								Gym.timer[player] = setTimer(function(player)
									if(isElement(player) and not(isPedDead(player)))then
										setPedAnimationProgress(player,"gym_bp_down",0.5)
									end
								end,50,0,player)
								giveMuskelnAndFett(player)
							end
						end,1000,1,player)
					end
				end,1700,1,player)
			elseif(state == "up")then
				if(isTimer(Gym.timer[player]))then killTimer(Gym.timer[player])end
				setPedAnimation(player,"benchpress","gym_bp_down")
				Gym.timer[player] = setTimer(function(player)
					if(isElement(player) and not(isPedDead(player)))then
						setPedAnimationProgress(player,"gym_bp_down",0.5)
					end
				end,50,0,player)
			end
		elseif(GymGeraet == "Laufband")then
			if(state == "down")then
				setPedAnimation(player,"GYMNASIUM","gym_tread_sprint")
				Gym.timer[player] = setTimer(function(player)
					if(isElement(player) and not(isPedDead(player)))then
						giveMuskelnAndFett(player)
					end
				end,3000,0,player)
			elseif(state == "up")then
				setPedAnimation(player)
				if(isTimer(Gym.timer[player]))then killTimer(Gym.timer[player])end
			end
		elseif(GymGeraet == "Laufrad")then
			if(state == "down")then
				setPedAnimation(player,"GYMNASIUM","gym_bike_slow")
				Gym.timer[player] = setTimer(function(player)
					if(isElement(player) and not(isPedDead(player)))then
						giveMuskelnAndFett(player)
					end
				end,3000,0,player)
			elseif(state == "up")then
				setPedAnimation(player,"GYMNASIUM","gym_bike_still")
				if(isTimer(Gym.timer[player]))then killTimer(Gym.timer[player])end
			end
		end
	end
end

-- [[ TRAINING STOPPEN ]] --

function Gym.stopTraining(player)
	if(getElementData(player,"GymGeraet") ~= nil)then
		if(getElementData(player,"GymFaengtAn") ~= true)then
			local GymGeraet = getElementData(player,"GymGeraet")
			if(GymGeraet == "Hanteln")then
				if(not(isTimer(Gym.timer[player])))then
					setPedAnimation(player,"Freeweights","gym_free_putdown")
					setTimer(function()
						for i = 1,2 do
							local tbl = Gym["Objekte"][i]
							destroyElement(Gym.objects[i])
							Gym.objects[i] = createObject(tbl[1],tbl[2],tbl[3],tbl[4],tbl[5],tbl[6])
							setElementInterior(Gym.objects[i],5)
							setElementDimension(Gym.objects[i],2)
						end
					end,1000,1)
					setTimer(function(player,id)
						if(isElement(player) and not(isPedDead(player)))then
							setPedAnimation(player)
							Gym.removeSettings(player)
							if(isTimer(Gym.timer[player]))then killTimer(Gym.timer[player])end
						end
						setElementAlpha(Gym.marker[id],50)
					end,2800,1,player,1)
				end
			elseif(GymGeraet == "Gewichtstange")then
				setPedAnimation(player,"benchpress","gym_bp_getoff")
				setTimer(function(player,id)
					destroyElement(Gym.objects[3])
					Gym.objects[3] = createObject(2913,774.40002441406,1,1000.700012207,0,90,90)
					setElementInterior(Gym.objects[3],5)
					setElementDimension(Gym.objects[3],2)
					setTimer(function(player,id)
						if(isElement(player) and not(isPedDead(player)))then
							detachElements(player,Gym.objects[4])
							Gym.removeSettings(player)
							setPedAnimation(player)
							setElementFrozen(player,false)
							if(isTimer(Gym.timer[player]))then killTimer(Gym.timer[player])end
							setElementPosition(player,773.82934570313,3.1395440101624,1000.7169189453)
							setPedRotation(player,90)
						end
						setElementAlpha(Gym.marker[id],50)
					end,6100,1,player,2)
				end,2500,1,player,2)
			elseif(GymGeraet == "Laufband")then
				if(not(isTimer(Gym.timer[player])))then
					setPedAnimation(player,"GYMNASIUM","gym_tread_getoff")
					setTimer(function(player,id)
						if(isElement(player) and not(isPedDead(player)))then
							setPedAnimation(player)
							Gym.removeSettings(player)
							setElementFrozen(player,false)
							if(isTimer(Gym.timer[player]))then killTimer(Gym.timer[player])end
							setElementPosition(player,774.53955078125,-0.55359017848969,1000.7236328125)
							setPedRotation(player,90)
						end
						setElementAlpha(Gym.marker[id],50)
					end,3000,1,player,3)
				end
			elseif(GymGeraet == "Laufrad")then
				if(not(isTimer(Gym.timer[player])))then
					setPedAnimation(player,"GYMNASIUM","gym_bike_getoff")
					setTimer(function(player,id)
						if(isElement(player) and not(isPedDead(player)))then
							setPedAnimation(player)
							detachElements(player,Gym.objects[5])
							Gym.removeSettings(player)
							setElementFrozen(player,false)
							if(isTimer(Gym.timer[player]))then killTimer(Gym.timer[player])end
							setElementPosition(player,772.27233886719,7.8474774360657,1000.7088623047)
							setPedRotation(player,90)
						end
						setElementAlpha(Gym.marker[id],50)
					end,1500,1,player,4)
				end
			end
			Gym.toggleControlOff(player)
			setCameraTarget(player)
			setElementData(player,"Markerschutz",true)
			setTimer(function(player)
				if(isElement(player))then
					setElementData(player,"Markerschutz",false)
				end
			end,5000,1,player)
			setElementData(player,"GymGeraet",nil)
			triggerClientEvent(player,"Gym.dxDraw",player,"destroy")
		end
	end
end
addCommandHandler("stopTraining",Gym.stopTraining)

-- [[ SETTINGS ]] --

function Gym.settings(player)
	bindKey(player,"w","up",Gym.trainieren)
	bindKey(player,"w","down",Gym.trainieren)
end

function Gym.removeSettings(player)
	unbindKey(player,"w","up",Gym.trainieren)
	unbindKey(player,"w","down",Gym.trainieren)
end

function Gym.toggleControlOn(player)
	toggleControl(player,"left",false)
	toggleControl(player,"right",false)
	toggleControl(player,"backwards",false)
	toggleControl(player,"forwards",false)
	toggleControl(player,"fire",false)
	toggleControl(player,"jump",false)
end

function Gym.toggleControlOff(player)
	toggleControl(player,"left",true)
	toggleControl(player,"right",true)
	toggleControl(player,"backwards",true)
	toggleControl(player,"forwards",true)
	toggleControl(player,"fire",true)
	toggleControl(player,"jump",true)
end

function giveMuskelnAndFett(player)
	if(getElementData(player,"Fett") > 0)then
		setElementData(player,"Fett",getElementData(player,"Fett")-5)
		setPedStat(player,21,getElementData(player,"Fett"))
	else
		if(getElementData(player,"Muskeln") < 1000)then
			setElementData(player,"Muskeln",getElementData(player,"Muskeln")+5)
			setPedStat(player,23,getElementData(player,"Muskeln"))
		end
	end
	if(getElementData(player,"Fett") < 0)then setElementData(player,"Fett",0)end
	if(getElementData(player,"Muskeln") > 1000)then setElementData(player,"Muskeln",1000)end
end

-- [[ WAS PASSIERT, WENN DER SPIELER STIRBT / QUITTET ]] --

addEventHandler("onPlayerQuit",root,function() Gym.stopTraining(source) end)
addEventHandler("onPlayerWasted",root,function() Gym.stopTraining(source) end)