-- [[ GANGWARGEBIETE ERSTELLEN ]] --

function Gangwar.loadAreas()
	local result = dbPoll(dbQuery(handler,"SELECT * FROM gangareas"),-1)
	if(#result >= 1)then
		for _,v in pairs(result)do
			local ID = v["ID"]
			local x1,y1 = tonumber(v["x1"]),tonumber(v["y1"])
			local x2,y2 = tonumber(v["x2"]),tonumber(v["y2"])
			local xs,ys = math.abs(x1-x2),math.abs(y1-y2)
			local owner = v["owner"]
			local px,py,pz = tonumber(v["px"]),tonumber(v["py"]),tonumber(v["pz"])
			local r,g,b = Fraktionssystem["Fraktion"][owner][1],Fraktionssystem["Fraktion"][owner][2],Fraktionssystem["Fraktion"][owner][3]
			
			Gangwar[ID] = createRadarArea(x1,y1,xs,ys,r,g,b,175,root)
			Gangwar.datas[ID] = {
				["Pickup"] = createPickup(px,py,pz,3,1313,50),
				["Owner"] = owner,
				["Blocked"] = false,
				["Colshape"] = createColCuboid(x1,y1,-50,xs,ys,7500),
				["ActiveGangwar"] = false,
				["Started"] = nil,
			}
			
			addEventHandler("onPickupHit",Gangwar.datas[ID]["Pickup"],function(player)
				if(isEvil(player) and not(isPedInVehicle(player)))then
					setElementData(player,"GangwarID",ID)
					if(Gangwar.datas[ID]["ActiveGangwar"] == false)then
						triggerClientEvent(player,"Gangwar.openWindow",player)
					--[[ else
						local OldTick,NewTick = Gangwar.datas[ID]["Started"],getTickCount()
						local time = 900000 + (OldTick - NewTick)
						local gangwarZeit = convertMS(time)
						outputChatBox(gangwarZeit.." Minuten verbleibend.",player,125,125,0) ]]--
					end
				end
			end)
		end
	end
end
Gangwar.loadAreas()

-- [[ GANGWAR STARTEN ]] -

addEvent("Gangwar.start",true)
addEventHandler("Gangwar.start",root,function()
	if(getElementData(client,"Fraktionrang") >= 0)then
		local faction = getElementData(client,"Fraktion")
		if(Gangwar["Active"][faction] == false)then
			local ID = getElementData(client,"GangwarID")
			if(Gangwar["Active"][Gangwar.datas[ID]["Owner"]] == false)then
				local ID = getElementData(client,"GangwarID")
				local px,py,pz = getElementPosition(Gangwar.datas[ID]["Pickup"])
				if(getDistanceBetweenPoints3D(px,py,pz,getElementPosition(client)) <= 5)then
					local neededMembers = 3
					local time = getRealTime()
					if(time.hour >= 18 and time.hour <= 20)then neededMembers = 0 end
					if(getMembersOnline("Fraktion",Gangwar.datas[ID]["Owner"]) >= tonumber(neededMembers))then
						if(Gangwar.datas[ID]["Owner"] ~= getElementData(client,"Fraktion"))then
							if(Gangwar.datas[ID]["Blocked"] == false)then
								local owner = Gangwar.datas[ID]["Owner"]
								Gangwar.datas[ID]["Angreifer"] = getElementData(client,"Fraktion")
								Gangwar.datas[ID]["Verteidiger"] = owner
								Gangwar.datas[ID]["ActiveGangwar"] = true
								Gangwar.datas[ID]["Blocked"] = true
								Gangwar["Active"][faction] = true
								Gangwar["Active"][owner] = true
								for _,k in pairs(getElementsByType("player"))do
									if(getElementData(v,"loggedin") == 1)then
										if(isEvil(v))then
											outputChatBox(loc(v,"Fraktionen_292"):format(Fraktionssystem["Fraktionnamen"][Gangwar.datas[ID]["Angreifer"]],Fraktionssystem["Fraktionnamen"][Gangwar.datas[ID]["Verteidiger"]]),v,255,0,0,true)
										end
									end
								end
								if(neededMembers == 0)then vorbereitungszeit = 50 else vorbereitungszeit = 180000 end
								
								for _,v in pairs(Gangwar["Gangwarfahrzeuge"][ID])do
									local r,g,b = Fraktionssystem["Fraktion"][Gangwar.datas[ID]["Angreifer"]][1],Fraktionssystem["Fraktion"][Gangwar.datas[ID]["Angreifer"]][2],Fraktionssystem["Fraktion"][Gangwar.datas[ID]["Angreifer"]][3]
									local veh = createVehicle(v[1],v[2],v[3],v[4],v[5],v[6],v[7])
									setElementData(veh,"GangwarID",ID)
									setVehicleColor(veh,r,g,b)
									setVehicleDamageProof(veh,true)
								end
								triggerClientEvent(client,"setWindowDatas",client)
								
								Gangwar.datas[ID]["VorbereitungsZeit"] = setTimer(function(client,ID)
									Gangwar.datas[ID]["Started"] = getTickCount()
									setRadarAreaFlashing(Gangwar[ID],true)
									setRadarAreaColor(Gangwar[ID],0,255,0,175)
									for _,k in pairs(getElementsByType("player"))do
										if(getElementData(v,"loggedin") == 1)then
											if(getElementData(v,"Fraktion") == owner)then
												outputChatBox(loc(v,"Fraktionen_293"):format(Gangwar.datas[ID]["Angreifer"]),v,125,0,0,true)
											elseif(getElementData(v,"Fraktion") == getElementData(client,"Fraktion"))then
												outputChatBox(loc(v,"Fraktionen_294"):format(Gangwar.datas[ID]["Verrteidiger"]),0,125,0,true)
											end
										end
									end
									
									for _,v in pairs(getElementsByType("player"))do
										if(isEvil(v))then
											if(getElementData(v,"Fraktion") == Gangwar.datas[ID]["Angreifer"] or getElementData(v,"Fraktion") == Gangwar.datas[ID]["Verteidiger"])then
												local x,y,z = getElementPosition(Gangwar.datas[ID]["Pickup"])
												setElementData(v,"ImGangwar",true)
												setElementData(v,"ImGangwarGestorben",false)
												setElementData(v,"TemporaerGWDamage",0)
												setElementData(v,"TemporaerGWKills",0)
												setElementData(v,"GangwarID",ID)
												triggerClientEvent(v,"Gangwar.updateDatas",v,Gangwar.datas[ID]["Angreifer"],Gangwar.datas[ID]["Verteidiger"],x,y,z,"create")
											end
										end
									end
									
									Gangwar.datas[ID]["UpdateTimeTimer"] = setTimer(function(ID)
										for _,v in pairs(getElementsByType("player"))do
											if(isEvil(v))then
												if(getElementData(v,"Fraktion") == Gangwar.datas[ID]["Angreifer"] or getElementData(v,"Fraktion") == Gangwar.datas[ID]["Verteidiger"])then
													local OldTick,NewTick = Gangwar.datas[ID]["Started"],getTickCount()
													local time = 900000 + (OldTick - NewTick)
													local gangwarZeit = convertMS(time)
													triggerClientEvent(v,"Gangwar.updateDatasTime",v,gangwarZeit)
												end
											end
										end
										local counter_defender = 0
										local counter_attacker = 0
										for _,v in pairs(getElementsByType("player"))do
											if(isEvil(v))then
												if(getElementData(v,"ImGangwar") == true and getElementData(v,"ImGangwarGestorben") ~= true)then
													if(getElementData(v,"Fraktion") == Gangwar.datas[ID]["Verteidiger"])then
														counter_defender = counter_defender + 1
													elseif(getElementData(v,"Fraktion") == Gangwar.datas[ID]["Angreifer"])then
														counter_attacker = counter_attacker + 1
													end
												end
											end
										end
										if(counter_defender == 0)then
											for _,v in pairs(getElementsByType("player"))do
												triggerClientEvent(v,"Gangwar.updateDatas",v,nil,nil,nil,nil,nil,"destroy")
												if(isEvil(v) and getElementData(v,"ImGangwar") == true)then
													Gangwar.giveBonus(v)
												end
											end

											for _,k in pairs(getElementsByType("player"))do
												if(getElementData(v,"loggedin") == 1)then
													if(getElementData(v,"Fraktion") == Gangwar.datas[ID]["Verteidiger"])then
														outputChatBox(loc(v,"Fraktionen_295"),v,125,0,0,true)
													elseif(getElementData(v,"Fraktion") == Gangwar.datas[ID]["Angreifer"])then
														outputChatBox(loc(v,"Fraktionen_296"),v,0,125,0,true)
													end
												end
											end

											if(isTimer(Gangwar.datas[ID]["UpdateTimeTimer"]))then killTimer(Gangwar.datas[ID]["UpdateTimeTimer"])end
											if(isTimer(Gangwar.datas[ID]["CheckTimer"]))then killTimer(Gangwar.datas[ID]["CheckTimer"])end
											local r,g,b = Fraktionssystem["Fraktion"][Gangwar.datas[ID]["Angreifer"]][1],Fraktionssystem["Fraktion"][Gangwar.datas[ID]["Angreifer"]][2],Fraktionssystem["Fraktion"][Gangwar.datas[ID]["Angreifer"]][3]
											setRadarAreaFlashing(Gangwar[ID],false)
											setRadarAreaColor(Gangwar[ID],r,g,b,175)
											dbExec(handler,"UPDATE gangareas SET owner = '"..Gangwar.datas[ID]["Angreifer"].."' WHERE ID = '"..ID.."'")
											Gangwar["Active"][Gangwar.datas[ID]["Angreifer"]] = false
											Gangwar["Active"][Gangwar.datas[ID]["Verteidiger"]] = false
											Gangwar.datas[ID]["Angreifer"] = false
											Gangwar.datas[ID]["Verteidiger"] = false
											Gangwar.datas[ID]["ActiveGangwar"] = false
											Gangwar.destroyBurritos(ID)
											if(isTimer(Gangwar.datas[ID]["WinTimer"]))then killTimer(Gangwar.datas[ID]["WinTimer"])end
										end
										if(counter_attacker == 0)then
											for _,v in pairs(getElementsByType("player"))do
												triggerClientEvent(v,"Gangwar.updateDatas",v,nil,nil,nil,nil,nil,"destroy")
												if(isEvil(v) and getElementData(v,"ImGangwar") == true)then
													Gangwar.giveBonus(v)
												end
											end

											for _,k in pairs(getElementsByType("player"))do
												if(getElementData(v,"loggedin") == 1)then
													if(getElementData(v,"Fraktion") == Gangwar.datas[ID]["Verteidiger"])then
														outputChatBox(loc(v,"Fraktionen_297"),v,125,0,0,true)
													elseif(getElementData(v,"Fraktion") == Gangwar.datas[ID]["Angreifer"])then
														outputChatBox(loc(v,"Fraktionen_298"),v,0,125,0,true)
													end
												end
											end

											if(isTimer(Gangwar.datas[ID]["CheckTimer"]))then killTimer(Gangwar.datas[ID]["CheckTimer"])end
											if(isTimer(Gangwar.datas[ID]["StopTimer"]))then killTimer(Gangwar.datas[ID]["StopTimer"])end
											if(isTimer(Gangwar.datas[ID]["UpdateTimeTimer"]))then killTimer(Gangwar.datas[ID]["UpdateTimeTimer"])end
											local verteidiger = Gangwar.datas[ID]["Verteidiger"]
											local r,g,b = Fraktionssystem["Fraktion"][verteidiger][1],Fraktionssystem["Fraktion"][verteidiger][2],Fraktionssystem["Fraktion"][verteidiger][3]
											setRadarAreaFlashing(Gangwar[ID],false)
											setRadarAreaColor(Gangwar[ID],r,g,b,175)
											Gangwar["Active"][Gangwar.datas[ID]["Angreifer"]] = false
											Gangwar["Active"][Gangwar.datas[ID]["Verteidiger"]] = false
											Gangwar.datas[ID]["Angreifer"] = false
											Gangwar.datas[ID]["Verteidiger"] = false
											Gangwar.datas[ID]["ActiveGangwar"] = false
											if(isTimer(Gangwar.datas[ID]["WinTimer"]))then killTimer(Gangwar.datas[ID]["WinTimer"])end
											Gangwar.destroyBurritos(ID)
										end
									end,50,0,ID)
									
									setTimer(function(ID)
										Gangwar.datas[ID]["Blocked"] = false
									end,21600000,1,ID)
									
									Gangwar.datas[ID]["WinTimer"] = setTimer(function(ID)
										for _,v in pairs(getElementsByType("player"))do
											triggerClientEvent(v,"Gangwar.updateDatas",v,nil,nil,nil,nil,nil,"destroy")
											if(isEvil(v) and getElementData(v,"ImGangwar") == true)then
												Gangwar.giveBonus(v)
											end
										end

										for _,k in pairs(getElementsByType("player"))do
											if(getElementData(v,"loggedin") == 1)then
												if(getElementData(v,"Fraktion") == Gangwar.datas[ID]["Verteidiger"])then
													outputChatBox(loc(v,"Fraktionen_299"),v,125,0,0,true)
												elseif(getElementData(v,"Fraktion") == Gangwar.datas[ID]["Angreifer"])then
													outputChatBox(loc(v,"Fraktionen_300"),v,0,125,0,true)
												end
											end
										end

										if(isTimer(Gangwar.datas[ID]["UpdateTimeTimer"]))then killTimer(Gangwar.datas[ID]["UpdateTimeTimer"])end
										if(isTimer(Gangwar.datas[ID]["CheckTimer"]))then killTimer(Gangwar.datas[ID]["CheckTimer"])end
										local r,g,b = Fraktionssystem["Fraktion"][Gangwar.datas[ID]["Angreifer"]][1],Fraktionssystem["Fraktion"][Gangwar.datas[ID]["Angreifer"]][2],Fraktionssystem["Fraktion"][Gangwar.datas[ID]["Angreifer"]][3]
										setRadarAreaFlashing(Gangwar[ID],false)
										setRadarAreaColor(Gangwar[ID],r,g,b,175)
										dbExec(handler,"UPDATE gangareas SET owner = '"..Gangwar.datas[ID]["Angreifer"].."' WHERE ID = '"..ID.."'")
										Gangwar["Active"][Gangwar.datas[ID]["Angreifer"]] = false
										Gangwar["Active"][Gangwar.datas[ID]["Verteidiger"]] = false
										Gangwar.datas[ID]["Angreifer"] = false
										Gangwar.datas[ID]["Verteidiger"] = false
										Gangwar.datas[ID]["ActiveGangwar"] = false
										Gangwar.destroyBurritos(ID)
									end,900000,1,ID)
									
									Gangwar.datas[ID]["CheckTimer"] = setTimer(function(ID)
										local counter = 0
										for _,v in pairs(getElementsByType("player"))do
											if(getElementData(v,"Fraktion") == Gangwar.datas[ID]["Angreifer"])then
												local x,y,z = getElementPosition(Gangwar.datas[ID]["Pickup"])
												if(getDistanceBetweenPoints3D(x,y,z,getElementPosition(v)) <= 15)then
													if(not(isPedDead(v)))then
														counter = counter + 1
													end
												end
											end
										end
										if(counter == 0)then
											if(not(isTimer(Gangwar.datas[ID]["StopTimer"])))then
												Gangwar.datas[ID]["StopTimer"] = setTimer(function(ID)
													for _,v in pairs(getElementsByType("player"))do
														triggerClientEvent(v,"Gangwar.updateDatas",v,nil,nil,nil,nil,nil,"destroy")
														if(isEvil(v) and getElementData(v,"ImGangwar") == true)then
															Gangwar.giveBonus(v)
														end
													end

													for _,k in pairs(getElementsByType("player"))do
														if(getElementData(v,"loggedin") == 1)then
															if(getElementData(v,"Fraktion") == Gangwar.datas[ID]["Verteidiger"])then
																outputChatBox(loc(v,"Fraktionen_301"),v,125,0,0,true)
															elseif(getElementData(v,"Fraktion") == Gangwar.datas[ID]["Angreifer"])then
																outputChatBox(loc(v,"Fraktionen_302"),v,0,125,0,true)
															end
														end
													end

													if(isTimer(Gangwar.datas[ID]["CheckTimer"]))then killTimer(Gangwar.datas[ID]["CheckTimer"])end
													if(isTimer(Gangwar.datas[ID]["StopTimer"]))then killTimer(Gangwar.datas[ID]["StopTimer"])end
													if(isTimer(Gangwar.datas[ID]["UpdateTimeTimer"]))then killTimer(Gangwar.datas[ID]["UpdateTimeTimer"])end
													local verteidiger = Gangwar.datas[ID]["Verteidiger"]
													local r,g,b = Fraktionssystem["Fraktion"][verteidiger][1],Fraktionssystem["Fraktion"][verteidiger][2],Fraktionssystem["Fraktion"][verteidiger][3]
													setRadarAreaFlashing(Gangwar[ID],false)
													setRadarAreaColor(Gangwar[ID],r,g,b,175)
													Gangwar["Active"][Gangwar.datas[ID]["Angreifer"]] = false
													Gangwar["Active"][Gangwar.datas[ID]["Verteidiger"]] = false
													Gangwar.datas[ID]["Angreifer"] = false
													Gangwar.datas[ID]["Verteidiger"] = false
													Gangwar.datas[ID]["ActiveGangwar"] = false
													if(isTimer(Gangwar.datas[ID]["WinTimer"]))then killTimer(Gangwar.datas[ID]["WinTimer"])end
													Gangwar.destroyBurritos(ID)
												end,11000,1,ID)
											end
										else
											if(isTimer(Gangwar.datas[ID]["StopTimer"]))then
												killTimer(Gangwar.datas[ID]["StopTimer"])
											end
										end
									end,10000,0,ID)
								end,vorbereitungszeit,1,client,ID)
							else infobox(client,loc(client,"Fraktionen_303"),"error")end
						else infobox(client,loc(client,"Fraktionen_304"),"error")end
					else infobox(client,loc(client,"Fraktionen_305"),"error")end
				else infobox(client,loc(client,"Fraktionen_306"),"error")end
			else infobox(client,loc(client,"Fraktionen_307"),"error")end
		else infobox(client,loc(client,"Fraktionen_308"),"error")end
	else infobox(client,loc(client,"Fraktionen_309"),"error")end
end)

-- [[ BEFEHLE ]] --

addCommandHandler("showgangareas",function(player)
	if(getElementData(player,"loggedin") == 1)then
		if(isEvil(player))then
			local result = dbPoll(dbQuery(handler,"SELECT * FROM gangareas"),-1)
			for _,v in pairs(result)do
				local ID = v["ID"]
				if(Gangwar.datas[ID]["Blocked"] == true)then
					r,g,b = 150,0,0
				else
					r,g,b = 0,150,0
				end
				outputChatBox(ID..". "..v["name"],player,r,g,b)
			end
		end
	end
end)

addCommandHandler("changeareaowner",function(player,cmd,id,owner)
	if(getElementData(player,"loggedin") == 1)then
		if(getElementData(player,"Adminlevel") >= 2)then
			if(id and owner)then
				local id = tonumber(id)
				local owner = tonumber(owner)
				if(Gangwar.datas[id]["ActiveGangwar"] == false)then
					dbExec(handler,"UPDATE gangareas SET owner = '"..owner.."' WHERE ID = '"..id.."'")
					infobox(player,loc(player,"Fraktionen_310"),"info")
					local r,g,b = Fraktionssystem["Fraktion"][owner][1],Fraktionssystem["Fraktion"][owner][2],Fraktionssystem["Fraktion"][owner][3]
					setRadarAreaColor(Gangwar[id],r,g,b,175)
					Gangwar.datas[id]["Owner"] = owner
				else infobox(player,loc(player,"Fraktionen_311"),"error")end
			else infobox(player,loc(player,"Fraktionen_312"),"error")end
		end
	end
end)

addCommandHandler("resetareablock",function(player,cmd,id)
	if(getElementData(player,"loggedin") == 1)then
		if(getElementData(player,"Adminlevel") >= 2)then
			if(id)then
				local id = tonumber(id)
				if(Gangwar.datas[id]["Blocked"] == true)then
					Gangwar.datas[id]["Blocked"] = false
					infobox(player,loc(player,"Fraktionen_313"),"info")
				else infobox(player,loc(player,"Fraktionen_314"),"info")end
			else infobox(player,loc(player,"Fraktionen_315"),"info")end
		end
	end
end)

-- [[ FRAKTIONSPAYDAY ]] --

setTimer(function()
	for i = 6,9 do
		if(getMembersOnline("Fraktion",i) >= 2)then
			local gangareas = dbPoll(dbQuery(handler,"SELECT * FROM gangareas WHERE owner = '"..i.."'"),-1)
			local result = dbPoll(dbQuery(handler,"SELECT * FROM gangtags WHERE Besitzer = '"..Gangtags["TagNames"][i].."'"),-1)
			local fabriken = dbPoll(dbQuery(handler,"SELECT * FROM fabrikwars WHERE Besitzer = '"..i.."'"),-1)
			local GangtagsAnzahl = #result
			local fabrikenAnzahl = #fabriken
			
			for _,v in pairs(result)do Gangwar["Payday"][i] = Gangwar["Payday"][i] + 1 end
		
			local Geld,Gras,Materialien = Gangwar["Payday"][i] * 500,Gangwar["Payday"][i] * 25,Gangwar["Payday"][i] * 50
			local FabrikenMoney = fabrikenAnzahl * 1500
			local GesamtMoney = Geld + (GangtagsAnzahl * 150) + (FabrikenMoney)
			addToLager(i,"Geld",Geld,"fraktionslager")
			addToLager(i,"Gras",Gras,"fraktionslager")
			addToLager(i,"Materialien",Materialien,"fraktionslager")
			for _,v in pairs(getElementsByType("player"))do
				if(getElementData(v,"loggedin") == 1)then
					if(getElementData(v,"Fraktion") == i)then
						outputChatBox("_____| "..loc(v,"Fraktionen_316").." |_____",v,0,150,0)
						outputChatBox(loc(v,"Fraktionen_317"):format(Geld,Gras,Materialien),v,0,125,0)
						outputChatBox(loc(v,"Fraktionen_318"):format(GangtagsAnzahl*150,FabrikenMoney),v,0,125,0)
						outputChatBox(loc(v,"Fraktionen_319"),v,200,200,0)
					end
				end
			end
			Gangwar["Payday"][i] = 0
		end
	end
	for i = 1,3 do
		if(getMembersOnline("Fraktion",i) >= 2)then
			local Geld = Polizei["PaydayBonus"][i] * 350
			addToLager(i,"Geld",Geld,"fraktionslager")
			for _,v in pairs(getElementsByType("player"))do
				if(getElementData(v,"loggedin") == 1)then
					if(getElementData(v,"Fraktion") == i)then
						outputChatBox("_____| "..loc(v,"Fraktionen_320").." |_____",v,0,150,0)
						outputChatBox(loc(v,"Fraktionen_321"):format(Geld),v,0,125,0)
						outputChatBox(loc(v,"Fraktionen_322"),v,200,200,0)
					end
				end
			end
			Polizei["PaydayBonus"][i] = 0
		end
	end
end,3600000,0)

function Gangwar.destroyBurritos(ID)
	for _,v in pairs(getElementsByType("vehicle"))do
		if(getElementData(v,"GangwarID") == ID)then
			destroyElement(v)
		end
	end
end

--//Gangwaranzeige
function loadGangwarAnzeige(player)
	if(isEvil(player))then
		local result = dbPoll(dbQuery(handler,"SELECT * FROM gangareas"),-1)
		for i = 1,#result do
			if(Gangwar.datas[i]["Angreifer"] == getElementData(player,"Fraktion") or Gangwar.datas[i]["Verteidiger"] == getElementData(player,"Fraktion") and not(isTimer(Gangwar.datas[i]["VorbereitungsZeit"])))then
				local x,y,z = getElementPosition(Gangwar.datas[i]["Pickup"])
				setElementData(player,"GangwarID",i)
				setElementData(player,"ImGangwar",true)
				setElementData(player,"ImGangwarGestorben",false)
				setElementData(player,"TemporaerGWDamage",0)
				setElementData(player,"TemporaerGWKills",0)
				triggerClientEvent(player,"Gangwar.updateDatas",player,Gangwar.datas[i]["Angreifer"],Gangwar.datas[i]["Verteidiger"],x,y,z,"create")
				break
			end
		end
	end
end

addEvent("Gangwar.nichtMitmachen",true)
addEventHandler("Gangwar.nichtMitmachen",root,function(reason)
	local GangwarID = getElementData(client,"GangwarID")
	setElementData(client,"ImGangwarGestorben",true)
	setElementData(client,"ImGangwar",false)
	if(not(reason))then
		for _,v in pairs(getElementsByType("player"))do
			if(getElementData(v,"loggedin") == 1)then
				if(getElementData(v,"Fraktion") == Gangwar.datas[GangwarID]["Angreifer"])then
					outputChatBox(loc(v,"Fraktionen_323"):format(getPlayerName(client)),v,255,255,255,true)
				elseif(getElementData(v,"Fraktion") == Gangwar.datas[GangwarID]["Verteidiger"])then
					outputChatBox(loc(v,"Fraktionen_324"):format(getPlayerName(client)),v,255,255,255,true)
				end
			end
		end
	else
		for _,v in pairs(getElementsByType("player"))do
			if(getElementData(v,"loggedin") == 1)then
				if(getElementData(v,"Fraktion") == Gangwar.datas[GangwarID]["Angreifer"])then
					outputChatBox(loc(v,"Fraktionen_325"):format(getPlayerName(client),reason),v,255,255,255,true)
				elseif(getElementData(v,"Fraktion") == Gangwar.datas[GangwarID]["Verteidiger"])then
					outputChatBox(loc(v,"Fraktionen_326"):format(getPlayerName(client),reason),v,255,255,255,true)
				end
			end
		end
	end
end)

addEvent("Gangwar.mitmachen",true)
addEventHandler("Gangwar.mitmachen",root,function()
	local GangwarID = getElementData(client,"GangwarID")
	for _,v in pairs(getElementsByType("player"))do
		if(getElementData(v,"loggedin") == 1)then
			if(getElementData(v,"Fraktion") == Gangwar.datas[GangwarID]["Angreifer"])then
				outputChatBox(loc(v,"Fraktionen_327"):format(getPlayerName(client)),v,255,255,255,true)
			elseif(getElementData(v,"Fraktion") == Gangwar.datas[GangwarID]["Verteidiger"])then
				outputChatBox(loc(v,"Fraktionen_328"):format(getPlayerName(client)),v,255,255,255,true)
			end
		end
	end
end)

-- [[ BONUS ]] --

function Gangwar.giveBonus(player)
	local dmg = getElementData(player,"TemporaerGWDamage")*4
	local kills = getElementData(player,"TemporaerGWKills")*150
	outputChatBox("_____| "..loc(player,"Fraktionen_329").." |_____",player,0,150,0)
	outputChatBox(loc(player,"Fraktionen_330"):format(getElementData(player,"TemporaerGWDamage"),getElementData(player,"TemporaerGWKills")),player,0,125,0)
	outputChatBox(loc(player,"Fraktionen_331"):format(dmg+kills),player,200,200,0)
	setElementData(player,"Geld",getElementData(player,"Geld")+(dmg+kills))
	if(getElementData(player,"TemporaerGWDamage") == 0)then setPlayerAchievement(player,29) end
	if(getElementData(player,"TemporaerGWDamage") >= 450)then setPlayerAchievement(player,30) end
	setElementData(player,"ImGangwar",false)
	setElementData(player,"ImGangwarGestorben",false)
	setElementData(player,"TemporaerGWDamage",0)
	setElementData(player,"TemporaerGWKills",0)
end

-- [[ SPIELERBLIPS ]] --

function refreshFactionMemberBlips(id)
	local id = tonumber(id)
	for _,v in pairs(getElementsByType("player"))do
		if(getElementData(v,"loggedin") == 1)then
			if(getElementData(v,"Fraktion") >= 1)then
				if(getElementData(v,"Fraktion") == id)then
					triggerClientEvent(v,"createFactionMemberBlips",v)
				end
			end
		end
	end
end

addEventHandler("onPlayerQuit",root,function()
	if(getElementData(source,"loggedin") == 1)then
		if(tonumber(getElementData(source,"Fraktion")) >= 1)then
			refreshFactionMemberBlips(getElementData(source,"Fraktion"))
		end
	end
end)