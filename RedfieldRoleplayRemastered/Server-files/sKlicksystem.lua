-- [[ TABELLEN ]] --

local Trash = {
	["Schrott"] = {
		"benutztes Kondom","leere Chipstüte","zerknitterte Baseballkarte","Fischgräte",
	},
	["Items"] = {
		"Automatensprengkit","Schutzmechanismus","Raketentreibstoff",
	},
}

PflanzenItem = {
	[738] = "Aepfel",
	[858] = "Orangen",
	[3409] = "Gras",
}

local Telefonzelle = {timer = {}, points = {}}

-- [[ KLICKSYSTEM ]] --

addEventHandler("onPlayerClick",root,function(button,state,clickedElement)
	if(state == "down" and button == "left")then
		if(clickedElement)then
			if(getElementData(source,"elementClicked") ~= true)then
				local x,y,z = getElementPosition(source)
				local ox,oy,oz = getElementPosition(clickedElement)
				local model = getElementModel(clickedElement)
				
				if(clickedElement)then
					if(model == 615 and getElementData(clickedElement,"fallen") == true)then
						if(getDistanceBetweenPoints3D(ox,oy,oz,x,y,z) <= 15)then
							if(isPedInVehicle(source))then
								if(getElementData(getPedOccupiedVehicle(source),"holztruck") == true)then
									if(getElementData(clickedElement,"baumOwner") == getPlayerName(source))then
										destroyElement(clickedElement)
										Holzfaeller.takeStammFromGround(source)
									else infobox(source,loc(source,"Klicksystem_1"),"error")end
								end
							end
						end
					elseif(getElementData(clickedElement,"WohnwagenBesitzer"))then
						if(isPedInVehicle(source) and getPedOccupiedVehicleSeat(source) == 0)then
							local veh = getPedOccupiedVehicle(source)
							local model = getElementModel(veh)
							if(getElementData(clickedElement,"WohnwagenBesitzer") == getPlayerName(source))then
								if(Wohnwagen["Coordinates"][model])then
									if(getElementData(source,"clickedElement") ~= true)then
										if(getElementData(clickedElement,"Angekuppelt") == false)then
											local tbl = Wohnwagen["Coordinates"][model]
											attachElements(clickedElement,veh,tbl[1],tbl[2],tbl[3])
											setElementData(clickedElement,"Angekuppelt",true)
											setElementData(source,"ClickedWohnwagenID",getElementData(clickedElement,"WohnwagenID"))
										else
											local x,y,z = getElementPosition(clickedElement)
											local rx,ry,rz = getElementRotation(veh)
											detachElements(clickedElement)
											setElementPosition(clickedElement,x,y,z)
											setElementRotation(clickedElement,rx,ry,rz)
											setElementData(clickedElement,"Angekuppelt",false)
											bindKey(source,"mouse_wheel_down","down",Wohnwagen.runter)
											bindKey(source,"mouse_wheel_up","down",Wohnwagen.hoch)
											bindKey(source,"j","down",Wohnwagen.savePosition)
											outputChatBox(loc(source,"Klicksystem_2"),source,0,150,0)
											outputChatBox(loc(source,"Klicksystem_3"),source,0,150,0)
										end
									end
								else infobox(source,loc(source,"Klicksystem_4"),"error")end
							else infobox(source,loc(source,"Klicksystem_5"),"error")end
						end
					else
						if(getDistanceBetweenPoints3D(ox,oy,oz,x,y,z) <= 5)then
							if(model == 1359 or model == 1344)then
								if(getElementData(source,"DurchsuchtTrash") ~= true)then
									if(getElementData(clickedElement,"TrashIsNotReady") ~= true)then
										setElementData(source,"DurchsuchtTrash",true)
										toggleAllControls(source,false)
										setElementFrozen(source,true)
										setPedAnimation(source,"ped","ATM")
										setElementData(clickedElement,"TrashIsNotReady",true)
										setTimer(function(source)
											setElementData(source,"DurchsuchtTrash",false)
											setPedAnimation(source)
											setElementFrozen(source,false)
											toggleAllControls(source,true)
											if(math.random(1,3) == 2)then
												setElementData(source,"Pfandflaschen",getElementData(source,"Pfandflaschen")+1)
												infobox(source,loc(source,"Klicksystem_6"),"info")
												Questsystem.addStufe(source,3,1)
											else
												if(math.random(1,50) > 1)then
													infobox(source,loc(source,"Klicksystem_7"):format(Trash["Schrott"][math.random(1,#Trash["Schrott"])]),"info")
												else
													if(math.random(1,50) > 1)then
														if(math.random(1,3) == 2)then
															local Item = Trash["Items"][math.random(1,#Trash["Items"])]
															setElementData(source,Item,getElementData(source,Item)+1)
															infobox(source,"Du hast ein(en) "..Item.." gefunden.","info")
														else
															Sammelkarten.addKarte(source,math.random(1,25))
														end
													else
														setPlayerAchievement(source,11)
														infobox(source,"Du hast eine alte Actionfigur gefunden. Sie ist wertlos, du schmeißt sie weg.","info")
													end
												end
											end
											if(getElementData(source,"TutorialTask") == 5)then Tutorial.aufgabeErledigt(source) end
											setPlayerAchievement(source,4)
											
											setTimer(function(clickedElement)
												setElementData(clickedElement,"TrashIsNotReady",false)
											end,900000,1,clickedElement)
										end,4000,1,source)
									else infobox(source,"Diese Mülltonne ist leer!","error")end
								end
							elseif(model == 944)then
								Waffenbox.openWindow(source,false)
							elseif(getElementData(clickedElement,"GaragenBesitzer"))then
								setElementData(source,"GaragenID",getElementData(clickedElement,"GaragenID"))
								triggerClientEvent(source,"Garagen.openWindow",source,getElementData(clickedElement,"GaragenPreis"),getElementData(clickedElement,"GaragenBesitzer"))
							elseif(model == 2942)then
								setElementData(source,"ATMID",getElementData(clickedElement,"ATMID"))
								local ATMID = getElementData(source,"ATMID")
								if(isPedInVehicle(source))then
									local veh = getPedOccupiedVehicle(source)
									if(getPedOccupiedVehicleSeat(source) == 0)then
										if(getElementData(veh,"Besitzer") == "SAPD" and getElementModel(veh) == 428)then
											local Money = getElementData(veh,"ATMGeld")
											local ATMMoney = getPlayerData("atms","ID",ATMID,"Inhalt")
											if(Money)then
												if(ATMMoney < 750000)then
													if(Money >= (750000 - ATMMoney))then
														local newMoney = Money - (750000 - ATMMoney)
														local belohnung = newMoney/100*0.1
														setElementData(veh,"ATMGeld",newMoney)
														dbExec(handler,"UPDATE atms SET Inhalt = '750000' WHERE ID = '"..ATMID.."'")
														infobox(source,"Der ATM wurde befüllt.","info")
														Polizei.createATMBlips(source)
														setElementData(source,"Geld",getElementData(source,"Geld")+belohnung) 
														return false
													else
														infobox(source,"In deinem Transporter ist nicht mehr genug Geld!","error")
														return false
													end
												else
													infobox(source,"Der ATM ist bereits voll!","error")
													return false
												end
											end
										end
									end
								end
								if(getElementData(source,"AutomatensprengkitStatus") == true)then
									if(getElementData(clickedElement,"BereitsGesprengt") ~= true)then
										toggleAllControls(source,false)
										setElementFrozen(source,true)
										setPedAnimation(source,"BOMBER","BOM_Plant_Loop")
										ATM.robTimer[source] = setTimer(function(source,ATMID)
											local ATMInhalt = getPlayerData("atms","ID",ATMID,"Inhalt")
											local Beute = math.floor(ATMInhalt/100*0.1)
											setPedAnimation(source)
											setElementData(source,"Geld",getElementData(source,"Geld") + Beute)
											infobox(source,"Du konntest $"..Beute.." erbeuten.","info")
											setElementFrozen(source,false)
											toggleAllControls(source,true)
										end,8500,1,source,ATMID)
										setElementData(clickedElement,"BereitsGesprengt",true)
										setElementData(source,"AutomatensprengkitStatus",false)
										setElementData(source,"Automatensprengkit",getElementData(source,"Automatensprengkit")-1)
									else
										setElementData(source,"AutomatensprengkitStatus",false)
										infobox(source,"Der Automat wurde vor kurzem bereits gesprengt!","error")
									end
								else
									if(isStateFaction(source) and isStaatDuty(source) and isElement(ATM.moneyBag[source]))then
										local ATMInhalt = tonumber(getPlayerData("atms","ID",ATMID,"Inhalt"))
										if(ATMInhalt < 500000)then
											dbExec(handler,"UPDATE atms SET Inhalt = '500000' WHERE ID = '"..ATMID.."'")
											infobox(source,"Der Automat wurde befüllt.","info")
											destroyElement(ATM.moneyBag[source])
										else infobox(source,"Der Automat ist bereits voll! (ATM-Inhalt: $"..ATMInhalt..")","error")end
									else
										triggerClientEvent(source,"ATM.openWindow",source)
									end
								end
							elseif(model == 3927)then
								local text = getPlayerData("schwarzesbrett","ID",getElementData(clickedElement,"SchwarzesBrettID"),"Text")
								triggerClientEvent(source,"SchwarzesBrett.windowOpen",source,text)
								if(getElementData(source,"TutorialTask") == 1)then Tutorial.aufgabeErledigt(source) end
							elseif(getElementData(clickedElement,"Taucherkiste") == true)then
								Tauchen.setItem(source)
								destroyElement(clickedElement)
								setElementData(source,"TaucherPoints",getElementData(source,"TaucherPoints")+1)
							elseif(getElementType(clickedElement) == "vehicle")then
								if(isStateFaction(source) and getElementData(clickedElement,"ATMGeld"))then
									local money = tonumber(getElementData(clickedElement,"ATMGeld"))
									if(money >= 1)then
										infobox(source,"In dem Transporter befinden sich noch $"..money..".","info")
									else infobox(source,"In dem Transporter befindet sich kein Geld!","error")end
								else
									if(getElementData(clickedElement,"TaucherID"))then
										if(getElementData(source,"TaucherLevel") >= getElementData(clickedElement,"TaucherLevel"))then
											Autohaus.buy(source,getElementModel(clickedElement),0,-1936,271.29998779297,41,180,0,0,getPlayerName(source),getPlayerName(source))
											dbExec(handler,"DELETE FROM watervehicles WHERE ID = '"..getElementData(clickedElement,"TaucherID").."'")
											destroyElement(clickedElement)
											infobox(source,"Das Fahrzeug gehört nun dir.","info")
										else infobox("Dein Taucherlevel ist zu niedrig für diesen Fund! Du benötigst mindestens Taucherlevel "..getElementData(clickedElement,"TaucherLevel")..", um ihn einsammeln zu können.","error")end
									elseif(getElementData(clickedElement,"PostbotenOwner") == getPlayerName(source))then
										Postbote.takePaket(source)
									elseif(getElementData(clickedElement,"VehicleID"))then
										if(tonumber(getElementData(clickedElement,"Preis")) >= 1 and getElementData(clickedElement,"Firma") ~= getElementData(source,"Firma"))then
											setElementData(source,"VehicleID",getElementData(clickedElement,"VehicleID"))
											triggerClientEvent(source,"buyFirmenfahrzeug",source,getPlayerData("firma","ID",getElementData(clickedElement,"Firma"),"Name"),getElementData(clickedElement,"Preis"),getElementModel(clickedElement))
										else
											local owner = getElementData(clickedElement,"Besitzer")
											local id = getElementData(clickedElement,"VehicleID")
											local lastdriver = getElementData(clickedElement,"LetzterFahrer")
											if(not(lastdriver))then setElementData(clickedElement,"LetzterFahrer","Niemand")end
											triggerClientEvent(source,"Vehicles.openFahrzeugpanel",source,owner,id,lastdriver)
										end
									end
								end
							elseif(getElementType(clickedElement) == "player")then
								if(getPlayerName(clickedElement) ~= getPlayerName(source))then
									if(isTimer(TazerTimer[clickedElement]))then
										if(isPedInVehicle(source) and getPedOccupiedVehicleSeat(source) == 0)then
											local veh = getPedOccupiedVehicle(source)
											if(getElementData(veh,"Fraktion") == 1 or getElementData(veh,"Fraktion") == 2 or getElementData(veh,"Fraktion") == 3)then
												for i = 1,3 do
													if(getVehicleOccupant(veh,i) == false)then
														if(isTimer(TazerTimer[clickedElement]))then killTimer(TazerTimer[clickedElement])end
														toggleAllControls(clickedElement,false,true,false)
														warpPedIntoVehicle(clickedElement,veh,i)
														break
													end
												end
											end
										end
									else
										setElementData(source,"InteraktionPlayer",getPlayerName(clickedElement))
										triggerClientEvent(source,"Interaktion.openWindow",source)
									end
								end
							elseif(model == 3577 and getElementData(clickedElement,"DepotID"))then
								local DepotType = getElementData(clickedElement,"DepotType")
								local DepotID = getElementData(clickedElement,"DepotID")
								local DepotDatabase = getElementData(clickedElement,"DepotDatabase")
								if(getElementData(source,DepotType) == DepotID)then
									if(getElementData(source,"MoneybagMoneyForDepot") and getElementData(source,"MoneybagMoneyForDepot") > 0 and isElement(Casinoraub.playerMoneyBag[source]))then
										if(isElement(Casinoraub.playerMoneyBag[source]))then
											destroyElement(Casinoraub.playerMoneyBag[source])
										end
										local money = getElementData(source,"MoneybagMoneyForDepot")
										addToLager(getElementData(source,"Fraktion"),"Geld",money,"fraktionslager")
										infobox(source,"Du hast $4500 in das Lager gelegt.","info")
										setElementData(source,"MoneybagMoneyForDepot",0)
									else
										setElementData(source,"DepotDatabase",DepotDatabase)
										setElementData(source,"DepotType",DepotType)
										setElementData(source,"DepotID",DepotID)
										triggerClientEvent(source,"openFraktionsDepot",source)
									end
								end
							elseif(model == 1776)then
								if(getElementData(source,"Pfandflaschen") >= 1)then
									setElementData(source,"Pfandflaschen",getElementData(source,"Pfandflaschen")-1)
									setElementData(source,"Geld",getElementData(source,"Geld")+2)
									infobox(source,"Für die Abgabe einer Pfandflasche erhältst du $2.","info")
									Questsystem.addStufe(player,3,2)
								else infobox(source,"Du hast keine Pfandflaschen!","error")end
							elseif(getElementData(clickedElement,"Weedped") == true)then
								triggerClientEvent(source,"Weedped.openWindow",source,Weedped.price)
							elseif(getElementData(clickedElement,"PlantID"))then
								local plantID = getElementData(clickedElement,"PlantID")
								local plantIDTime = getPlayerData("pflanzen","ID",plantID,"STime")
								if(plantIDTime ~= 0 and plantIDTime - getSecTime(0) <= 0)then
									local model = getElementModel(clickedElement)
									setElementData(source,PflanzenItem[model],getElementData(source,PflanzenItem[model])+10)
									infobox(source,"Du hast die Pflanze geerntet.","info")
									dbExec(handler,"DELETE FROM pflanzen WHERE ID = '"..plantID.."'")
									destroyElement(clickedElement)
									if(getElementData(source,"TutorialTask") == 7)then Tutorial.aufgabeErledigt(source) end
									Questsystem.addStufe(source,2,3)
								else infobox(source,"Diese Pflanze muss noch "..math.floor(((plantIDTime - getSecTime(0))/60)*100)/100 .." Stunden wachsen, bis sie geerntet werden kann!","error")end
							elseif(getElementData(clickedElement,"GeldtransporterMoneyBag"))then
								if(not(isElement(Geldtransporter.playerBag[source])))then
									if(isStateFaction(source) and isStaatDuty(source))then
										destroyElement(clickedElement)
										Geldtransporter.takeMoneybag(source)
									end
								end
							elseif(getElementData(clickedElement,"FraktionsfahrzeugBuyID"))then
								if(isEvil(source))then
									setElementData(source,"FraktionsfahrzeugBuyID",getElementData(clickedElement,"FraktionsfahrzeugBuyID"))
									triggerClientEvent(source,"Fraktionsfahrzeughaendler.openWindow",source,Fraktionsfahrzeughaendler.model,Fraktionsfahrzeughaendler.preis)
								end
							elseif(model == 1581)then
								if(isEvil(source))then
									if(getElementData(clickedElement,"Matsraub") == true)then
										Matsraub.keyClick(source)
										destroyElement(clickedElement)
									elseif(getElementData(clickedElement,"Asservatenkammer") == true)then
										if(Asservatenkammer.code == nil)then
											Asservatenkammer.code = math.random(1111,9999)
											infobox(source,"Die PIN lautet "..Asservatenkammer.code..".","info")
											destroyElement(clickedElement)
										end
									elseif(getElementData(clickedElement,"Bankraub") == true)then
										if(getElementData(source,"Fraktion") == Bankraub.id)then
											destroyElement(clickedElement)
											setElementData(source,"BankraubKey",true)
											infobox(source,"Öffne nun die Türen zum Büro des Chefs!","info")
										end
									end
								end
							elseif(model == 3014 and getElementData(clickedElement,"Matsraub") == true)then
								if(getElementData(source,"Matsraub") ~= true)then
									Matsraub.click(source)
									destroyElement(clickedElement)
								else infobox(source,"Du hast bereits eine Ladung Materialien bei dir!","error")end
							elseif(getElementData(clickedElement,"Baustelle") == true)then
								if(model == 260 or model == 27 or model == 16)then
									if(isAntispamActive(source))then
										activateAntispam(source)
										local text = Baustelle["Gespraech"][math.random(1,#Baustelle["Gespraech"])]
										outputChatBox("Bauarbeiter: "..text,source,255,255,255)
										setPlayerAchievement(source,14)
									end
								end
							elseif(getElementData(clickedElement,"SprunkID"))then
								local SprunkID = getElementData(clickedElement,"SprunkID")
								local preis = getPlayerData("sprunkautomaten","ID",SprunkID,"DosenPreis")
								local dosen = getPlayerData("sprunkautomaten","ID",SprunkID,"Dosen")
								if(not(isTimer(DrinkTimer[source])))then
									if(getPlayerData("business","Databasename","Sprunk","Besitzer") ~= "Niemand")then
										if(dosen < 1)then
											infobox(source,"In dem Automaten sind keine Dosen mehr!","error")
											return false
										end
									end
									if(hasMoney(source,preis))then
										takeMoney(source,preis)
										if(getPlayerData("business","Databasename","Sprunk","Besitzer") ~= "Niemand")then
											dbExec(handler,"UPDATE sprunkautomaten SET Dosen = '"..dosen - 1 .."' WHERE ID = '"..SprunkID.."'")
											addBizKasse("Sprunk",preis)
										end
										playerDrink(source)
										for _,v in pairs(getElementsByType("player"))do
											Sprunk.setDatas(v)
										end
									end
								end
							elseif(model == 1216)then
								if(not(isPedInVehicle(source)))then
									if(getElementData(clickedElement,"Kaputt") ~= true)then
										triggerClientEvent(source,"Handy.openTelefonzelle",source)
										setElementData(source,"ClickedTelefonzelle",clickedElement)
									else
										if(getElementData(source,"Unternehmen") == 1 and isUnternehmenDuty(source))then
											if(not(isTimer(Telefonzelle[source])))then
												local x,y,z = getElementPosition(clickedElement)
												Telefonzelle.points[source] = 0
												toggleAllControls(source,false)
												setElementFrozen(source,true)
												setPedAnimation(source,"BOMBER","BOM_Plant_Loop")
												Telefonzelle.timer[source] = setTimer(function(source,x,y,z,clickedElement)
													Telefonzelle.points[source] = Telefonzelle.points[source] + 1
													triggerClientEvent(root,"Handy.repairTelefonzelle",root,x,y,z)
													if(Telefonzelle.points[source] >= 150)then
														toggleAllControls(source,true)
														setPedAnimation(source)
														Telefonzelle.points[source] = 0
														setElementFrozen(source,false)
														setElementData(clickedElement,"Kaputt",false)
													end
												end,50,150,source,x,y,z,clickedElement)
											end
										else
											infobox(source,"Diese Telefonzelle ist kaputt, kontaktiere einen Mechaniker, damit sie repariert wird!","error")
										end
									end
								end
							elseif(getElementData(clickedElement,"Taxiped") == true and getElementData(clickedElement,"InTaxi") ~= true)then
								if(isPedInVehicle(source) and getPedOccupiedVehicleSeat(source) == 0)then
									local veh = getPedOccupiedVehicle(source)
									if(getElementModel(veh) == 420)then
										if(not(getElementData(source,"TaxiPedID")) or getElementData(source,"TaxiPedID") == nil)then
											for i = 1,3 do
												if(getVehicleOccupant(veh,i) == false)then
													warpPedIntoVehicle(clickedElement,veh,i)
													triggerClientEvent(source,"Taxifahrer.createAbgabemarker",source)
													setElementData(clickedElement,"InTaxi",true)
													setElementData(source,"TaxiPedID",getElementData(clickedElement,"TaxiID"))
													
													for _,v in pairs(getElementsByType("player"))do
														if(getElementData(v,"ImTaxijob") == true)then
															Taxifahrer.refreshPedPositions(v)
														end
													end
													break
												end
											end
										end
									end
								end
							elseif(getElementData(clickedElement,"Asservatenkammer") == true)then
								if(getElementModel(clickedElement) == 2886)then
									triggerClientEvent(source,"Asservatenkammer.openKeypad",source)
								else
									if(getElementData(clickedElement,"wirdAusgeraubt") == false)then
										if(getElementData(source,"AsservatenkammerRaubAus") ~= true)then
											setElementData(source,"AsservatenkammerObject",clickedElement)
											setElementData(clickedElement,"wirdAusgeraubt",true)
											setElementFrozen(source,true)
											toggleAllControls(source,false)
											setPedAnimation(source,"BOMBER","BOM_Plant_Loop")
											setElementData(source,"AsservatenkammerRaubAus",true)
											
											Asservatenkammer.playerTimer[source] = setTimer(function(player,object)
												if(getElementModel(object) == 1550)then
													local money = math.random(1500,2000)
													setElementData(player,"Geld",getElementData(player,"Geld")+money)
													infobox(player,"Du hast $"..money.." eingesammelt.","info")
												elseif(getElementModel(object) == 2060)then
													local mats = math.random(50,75)
													setElementData(player,"Materialien",getElementData(player,"Materialien")+mats)
													infobox(player,"Du hast "..mats.." Materialien eingesammelt.","info")
												elseif(getElementModel(object) == 1279)then
													local drugs = math.random(15,30)
													setElementData(player,"Gras",getElementData(player,"Gras")+drugs)
													infobox(player,"Du hast "..drugs.."g Gras eingesammelt.","info")
												end
												if(isElement(clickedElement))then destroyElement(clickedElement)end
												setElementFrozen(player,false)
												toggleAllControls(player,true)
												setPedAnimation(player)
												setElementData(player,"AsservatenkammerRaubAus",nil)
												setElementData(player,"AsservatenkammerObject",nil)
												Asservatenkammer.objectsID = Asservatenkammer.objectsID - 1
												if(Asservatenkammer.objectsID == 0)then
													Asservatenkammer.refresh()
												end
											end,12000,1,source,clickedElement)
										else infobox(source,"Du sammelst bereits ein Objekt ein!","error")end
									else infobox(source,"Dieses Objekt wird bereits eingesammelt!","error")end
								end
							elseif(getElementData(clickedElement,"QuestID"))then
								setElementData(source,"QuestPedID",getElementData(clickedElement,"QuestPedID"))
								local QuestID = getElementData(clickedElement,"QuestID")
								local Name = Questsystem["Names"][QuestID][1]
								local Belohnung,Menge = Questsystem["Names"][QuestID][3],Questsystem["Names"][QuestID][2]
								local Aufgabe1 = Questsystem["Beschreibungen"][QuestID][1]
								triggerClientEvent(source,"Questsystem.openPedWindow",source,Name,Belohnung,Menge,Aufgabe1)
								setElementData(source,"QuestID",QuestID)
							elseif(getElementData(clickedElement,"Haustier"))then
								if(getElementData(clickedElement,"Besitzer") == getPlayerName(source))then
									triggerClientEvent(source,"Haustiere.openWindow",source)
								end
							elseif(model == 1302)then
								if(hasMoney(source,10))then
									takeMoney(source,10)
									setElementData(source,"Zigaretten",getElementData(source,"Zigaretten")+5)
									infobox(source,"Du hast dir eine Packung Zigaretten gekauft.","info")
									setPlayerAchievement(source,15)
								end
							elseif(model == 1808)then
								if(hasMoney(source,5))then
									takeMoney(source,5)
									playerDrink(source)
									setPlayerAchievement(source,16)
								end
							elseif(model == 2886 and getElementData(clickedElement,"Respawnbutton") == true)then
								local RespawnButtonType = getElementData(clickedElement,"RespawnButtonType")
								local ID = tonumber(getElementData(clickedElement,"RespawnButtonID"))
								if(RespawnButtonType == "Unternehmen")then
									if(getElementData(source,"Unternehmen") ~= ID and getElementData(source,"Unternehmenrang") < 3)then
										return false
									end
								elseif(RespawnButtonType == "Fraktion")then
									if(getElementData(source,"Fraktion") ~= ID and getElementData(source,"Fraktionrang") < 3)then
										return false
									end
								end
								if(getElementData(clickedElement,"RespawnbuttonTimer") ~= true)then
									for _,v in pairs(getElementsByType("vehicle"))do
										if(getElementData(v,RespawnButtonType) == ID)then
											if(getVehicleOccupant(v) == false)then
												local vehicleID = getElementData(v,"VehicleID")
												local x,y,z,rot = getPlayerData("vehicles","ID",vehicleID,"Spawnx"),getPlayerData("vehicles","ID",vehicleID,"Spawny"),getPlayerData("vehicles","ID",vehicleID,"Spawnz"),getPlayerData("vehicles","ID",vehicleID,"Spawnrotz")
												setElementPosition(v,x,y,z)
												setElementRotation(v,0,0,rot)
												setElementDimension(v,0)
												fixVehicle(v)
											end
										end
										infobox(source,"Dein/e "..RespawnButtonType.." wurde respawnt.","info")
										setElementData(clickedElement,"RespawnbuttonTimer",true)
										setTimer(function(button)
											setElementData(button,"RespawnbuttonTimer",false)
										end,900000,1,clickedElement)
									end
								else infobox(source,"Eure Fraktion kann nur alle 15 Minuten respawnt werden!","error")end
							end
						end
					end
				end
			end
		end
	end
end)

-- [[ WAS PASSIERT, WENN DER SPIELER STIRBT / QUITTET ]] --

function KlicksystemDestroyStuff(player)
	if(isTimer(Telefonzelle.timer[player]))then
		killTimer(Telefonzelle.timer[player])
	end
	Telefonzelle.timer[player] = 0
end

addEventHandler("onPlayerQuit",root,function() KlicksystemDestroyStuff(source) end)
addEventHandler("onPlayerWasted",root,function() KlicksystemDestroyStuff(source) end)