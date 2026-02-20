-- [[ DAS FENSTER ÖFFNEN ]] --

addEvent("Fahrschule.openWindow",true)
addEventHandler("Fahrschule.openWindow",root,function()
	local result = dbPoll(dbQuery(handler,"SELECT * FROM fahrschule"),-1)
	local tbl = {}
	for _,v in pairs(result)do
		table.insert(tbl,{v["Schein"],v["TheorieKosten"],v["PraxisKosten"]})
	end
	triggerClientEvent(client,"Fahrschule.openWindow",client,tbl)
end)

-- [[ FAHRSCHULPRÜFUNG ]] --

addEvent("Fahrschule.server",true)
addEventHandler("Fahrschule.server",root,function(schein,type)
	local preis = getPlayerData("fahrschule","Schein",schein,type.."Kosten")
	if(hasMoney(client,preis))then
		if(type == "Theorie")then
			if(getElementData(client,schein..type) == 0)then
				takeMoney(client,preis)
				setElementData(client,"FahrschulLicense",schein)
				triggerClientEvent(client,"Fahrschule.openInformationsWindow",client,schein)
			else infobox(client,loc(client,"Unternehmen_47"):format(schein),"error")end
		else
			if(getMembersOnline("Unternehmen",5) >= 1)then
				infobox(client,loc(client,"Unternehmen_48"),"error")
				return false
			end
			if(getElementData(client,schein.."Theorie") == 0)then
				infobox(client,loc(client,"Unternehmen_49"),"error")
				return false
			end
						
			if(getElementData(client,schein..type) == 0)then
				takeMoney(client,preis)
				setElementData(client,"FahrschulLicense",schein)
				local license = getElementData(client,"FahrschulLicense")
				local tbl = Fahrschule["Fahrzeugspawn"][license]
				local dim = getFreeDimension()
				Fahrschule.vehicle[client] = createVehicle(tbl[1],tbl[2],tbl[3],tbl[4],tbl[5],tbl[6],tbl[7])
				Fahrschule.ped[client] = createPed(48,0,0,0,0)
				setElementInterior(client,0)
				setElementDimension(client,dim)
				setElementDimension(Fahrschule.vehicle[client],dim)
				setElementDimension(Fahrschule.ped[client],dim)
				warpPedIntoVehicle(client,Fahrschule.vehicle[client])
				warpPedIntoVehicle(Fahrschule.ped[client],Fahrschule.vehicle[client],1)
				
				addEventHandler("onVehicleExit",Fahrschule.vehicle[client],function(player)
					Fahrschule.giveLizenz(player)
				end)
				
				triggerClientEvent(client,"Fahrschule.praxisPruefungMarker",client,"create")
				triggerClientEvent(client,"setWindowDatas",client)
				if(license == "FlugscheinA" or license == "FlugscheinB" or license == "Helikopterschein")then
					outputChatBox(loc(client,"Unternehmen_50"),client,255,255,255,true)
				elseif(license == "Bootschein")then
					outputChatBox(loc(client,"Unternehmen_51"),client,255,255,255,true)
				else
					outputChatBox(loc(client,"Unternehmen_52"),client,255,255,255,true)
					outputChatBox(loc(client,"Unternehmen_53"),client,255,255,255)
				end
				setElementData(client,"InFahrschulPruefung",true)
			else infobox(client,loc(client,"Unternehmen_54"):format(schein),"error")end
		end
	end
end)

-- [[ LIZENZ GEBEN ]] --

function Fahrschule.giveLizenz(player,type)
	if(isElement(Fahrschule.vehicle[player]))then destroyElement(Fahrschule.vehicle[player])end
	if(isElement(Fahrschule.ped[player]))then destroyElement(Fahrschule.ped[player])end
	if(getElementData(player,"InFahrschulPruefung") == true)then
		setTimer(function(player)
			if(isElement(player) and not(isPedDead(player)))then
				setElementPosition(player,-2028.0001220703,-113.70680236816,1035.171875)
				setPedRotation(player,180)
				setElementInterior(player,3)
				setElementDimension(player,0)
			end
		end,50,1,player)
		if(type)then
			setElementData(player,getElementData(player,"FahrschulLicense").."Praxis",1)
			infobox(player,loc(player,"Unternehmen_55"),"info")
			if(getElementData(player,"TutorialTask") == 4)then
				if(getElementData(player,"FahrschulLicense") == "Fuehrerschein")then
					Tutorial.aufgabeErledigt(player)
				end
			end
		else
			infobox(player,loc(player,"Unternehmen_56"),"error")
		end
		triggerClientEvent(player,"Fahrschule.praxisPruefungMarker",player)
	end
	setElementData(player,"InFahrschulPruefung",false)
end
addEvent("Fahrschule.giveLizenz",true)
addEventHandler("Fahrschule.giveLizenz",root,Fahrschule.giveLizenz)

-- [[ WAS PASSIERT, WENN DER SPIELER STIRBT / QUITTET ]] --

addEventHandler("onPlayerQuit",root,function() Fahrschule.giveLizenz(source) end)
addEventHandler("onPlayerWasted",root,function() Fahrschule.giveLizenz(source) end)

-- [[ LIZENZ VERGEBEN ]] --

addCommandHandler("giveLizenz",function(player,cmd,target,schein)
	if(getElementData(player,"Unternehmen") == 5 and isUnternehmenDuty(player))then
		if(target and schein)then
			if(Fahrschule["Lizenzen"][schein])then
				local preis = getPlayerData("fahrschule","Schein",schein,"PraxisKosten")
				local target = getPlayerFromName(target)
				if(existPlayer(player,target))then
					if(not(Fahrschule.licensePlayer[target]) or not(Fahrschule.licensePlayer[target][1]))then
						if(not(Fahrschule.licensePlayer[player]) or not(Fahrschule.licensePlayer[player][1]))then
							Fahrschule.licensePlayer[target] = {getPlayerName(player),schein,preis}
							Fahrschule.licensePlayer[player] = {getPlayerName(target),schein,preis}
							outputChatBox(loc(target,"Unternehmen_57"):format(getPlayerName(player),schein,preis),target,255,255,255,true)
							infobox(player,loc(player,"Unternehmen_65"):format(getPlayerName(target),schein,preis),"info")
							Fahrschule.timerPlayer[target] = setTimer(function(target,player)
								if(isElement(target))then Fahrschule.licensePlayer[target] = {} end
								if(isElement(player))then Fahrschule.licensePlayer[player] = {} end
							end,60000,1,target,player)
						else infobox(player,loc(player,"Unternehmen_58"),"error")end
					else infobox(player,loc(player,"Unternehmen_59"),"error")end
				end
			else infobox(player,loc(player,"Unternehmen_60"),"error")end
		else infobox(player,loc(player,"Unternehmen_61"),"error")end
	end
end)

addCommandHandler("acceptLizenz",function(player)
	if(Fahrschule.licensePlayer[player] and Fahrschule.licensePlayer[player][1])then
		local target = getPlayerFromName(Fahrschule.licensePlayer[player][1])
		local schein = Fahrschule.licensePlayer[player][2]
		local preis  = tonumber(Fahrschule.licensePlayer[player][3])
		if(hasMoney(player,preis))then
			if(getElementData(player,schein.."Praxis") == 0)then
				if(isElement(target) and getElementData(target,"loggedin") == 1)then
					infobox(target,loc(target,"Unternehmen_62"):format(getPlayerName(player),schein),"info")
				end
				addToLager(2,"Geld",preis/100*50,"unternehmenlager")
				setElementData(player,schein.."Praxis",1)
				infobox(player,loc(player,"Unternehmen_63"):format(schein),"info")
			else infobox(player,loc(player,"Unternehmen_64"),"error")end
		end
	end
end)

-- [[ TUTORIAL CHECK ]] --

addEvent("Fahrschule.checkTutorial",true)
addEventHandler("Fahrschule.checkTutorial",root,function()
	if(getElementData(client,"FuehrerscheinTheorie") == 1)then
		if(getElementData(client,"TutorialTask") == 3)then
			Tutorial.aufgabeErledigt(client)
		end
	end
	if(getElementData(client,"FuehrerscheinPraxis") == 1)then
		if(getElementData(client,"TutorialTask") == 4)then
			Tutorial.aufgabeErledigt(client)
		end
	end
end)