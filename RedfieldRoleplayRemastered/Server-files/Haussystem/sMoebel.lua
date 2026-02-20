-- [[ MÖBEL ERSTELLEN ]] --

function Moebel.load()
	local result = dbPoll(dbQuery(handler,"SELECT * FROM moebel"),-1)
	
	for _,v in pairs(result)do
		if(not(isElement(Moebel[v["ID"]])))then
			Moebel[v["ID"]] = createObject(v["Model"],v["Spawnx"],v["Spawny"],v["Spawnz"],0,0,v["Rotation"])
			setElementInterior(Moebel[v["ID"]],v["Interior"])
			setElementDimension(Moebel[v["ID"]],v["Dimension"])
			setElementData(Moebel[v["ID"]],"MoebelID",v["ID"])
			setElementCollisionsEnabled(Moebel[v["ID"]],true)
			setElementDoubleSided(Moebel[v["ID"]],true)
		end
	end
end
Moebel.load()

-- [[ KAUFEN ]] --

addEvent("Moebel.buy",true)
addEventHandler("Moebel.buy",root,function(model,name)
	local preis = getPlayerData("moebelhaus","ID","1","Objekt"..model.."Preis")
	if(hasMoney(client,preis))then
		local old = getPlayerData("moebelhaus","ID","1","Objekt"..model)
		if(old >= 1)then
			takeMoney(client,preis)
			dbExec(handler,"UPDATE moebelhaus SET Objekt"..model.." = '"..old-1 .."'")
			dbExec(handler,"INSERT INTO moebelinventory (Besitzer,Model,Name) VALUES ('"..getPlayerName(client).."','"..model.."','"..name.."')")
			infobox(client,loc(client,"Haussystem_66"):format(preis),"info")
		else infobox(client,loc(client,"Haussystem_67"),"error")end
	end
end)

-- [[ PREIS LADEN ]] --

addEvent("Moebel.getPreis",true)
addEventHandler("Moebel.getPreis",root,function(model)
	local preis = getPlayerData("moebelhaus","ID","1","Objekt"..model.."Preis")
	triggerClientEvent(client,"Moebel.refreshPreis",client,preis)
end)

-- [[ MÖBELSTÜCK PLATZIEREN ]] --

addEvent("Moebel.platzieren",true)
addEventHandler("Moebel.platzieren",root,function(model,x,y,z,rz,name)
	dbExec(handler,"INSERT INTO moebel (Model,Name,Besitzer,Spawnx,Spawny,Spawnz,Rotation,Interior,Dimension) VALUES ('"..model.."','"..name.."','"..getPlayerName(client).."','"..x.."','"..y.."','"..z.."','"..rz.."','"..getElementInterior(client).."','"..getElementDimension(client).."')")
	Moebel.load()
	infobox(client,loc(client,"Haussystem_68"),"info")
	dbExec(handler,"DELETE FROM moebelinventory WHERE ID = '"..getElementData(client,"ClickedMoebelID").."'")
end)

-- [[ MÖBELSTÜCK LÖSCHEN ]] --

function Moebel.deleteObject(player)
	for _,v in pairs(getElementsByType("object"))do
		if(getElementData(v,"MoebelID"))then
			local x,y,z = getElementPosition(v)
			if(getDistanceBetweenPoints3D(x,y,z,getElementPosition(player)) <= 1)then
				local MoebelID = getElementData(v,"MoebelID")
				local besitzer = getPlayerData("moebel","ID",MoebelID,"Besitzer")
				local name = getPlayerData("moebel","ID",MoebelID,"Name")
				if(besitzer == getPlayerName(player))then
					dbExec(handler,"INSERT INTO moebelinventory (Besitzer,Model,Name) VALUES ('"..getPlayerName(player).."','"..getElementModel(v).."','"..name.."')")
					dbExec(handler,"DELETE FROM moebel WHERE ID = '"..MoebelID.."'")
					destroyElement(v)
				else infobox(player,loc(player,"Haussystem_69"):format(besitzer),"error")end
				break
			end
		end
	end
end