-- [[ TABELLEN ]] --

local ModelID = {
	["Apfelsamen"] = 738,
	["Orangensamen"] = 858,
	["Hanfsamen"] = 3409,
}
local ID = 0

-- [[ ANPFLANZEN ]] --

function Pflanzensystem.anpflanzen(player,samen)
	if(getElementInterior(player) == 0 and getElementDimension(player) == 0)then
		if(not(isPedInVehicle(player)) and isPedOnGround(player) and not(isElementInWater(player)))then
			if(getElementData(player,"amAnpflanzen") ~= true)then
				local result = dbPoll(dbQuery(handler,"SELECT * FROM pflanzen WHERE Besitzer = '"..getPlayerName(player).."'"),-1)
				if(#result < 15)then
					local model = ModelID[samen]
					local x,y,z = getElementPosition(player)
					local rz = getPedRotation(player)
					setElementData(player,"amAnpflanzen",true)
					setElementFrozen(player,true)
					setPedAnimation(player,"BOMBER","BOM_Plant_Loop")
					if(getElementData(player,"TutorialTask") == 7)then time = 1 else time = 6 end
					dbExec(handler,"INSERT INTO pflanzen (Model,Spawnx,Spawny,Spawnz,Rotz,STime,Besitzer) VALUES ('"..model.."','"..x.."','"..y.."','"..z.."','"..rz.."','"..getSecTime(time).."','"..getPlayerName(player).."')")
					
					setTimer(function(player)
						setElementData(player,"amAnpflanzen",false)
						setPedAnimation(player)
						Pflanzensystem.createObject(model,x,y,z,rz,ID+1)
						setElementFrozen(player,false)
						Questsystem.addStufe(player,2,2)
					end,12500,1,player)
				else infobox(player,loc(player,"Systeme_267"),"error")end
			end
		else infobox(player,loc(player,"Systeme_268"),"error")end
	else infobox(player,loc(player,"Systeme_269"),"error")end
end

function Pflanzensystem.createObject(model,x,y,z,rz,id)
	local pflanze = createObject(model,x,y,z-1,0,0,rz)
	setElementData(pflanze,"PlantID",id)
	ID = id
end

-- [[ PFLANZEN LADEN ]] --

local result  = dbPoll(dbQuery(handler,"SELECT * FROM pflanzen"),-1)

if(#result >= 1)then
	for _,v in pairs(result)do
		Pflanzensystem.createObject(v["Model"],v["Spawnx"],v["Spawny"],v["Spawnz"],v["Rotz"],v["ID"])
		ID = v["ID"]
	end
end

-- [[ HANF ERNTEN ]] --

function Pflanzensystem.ernteHanf(player)
	for _,v in pairs(getElementsByType("object"))do
		if(getElementModel(v) == 3409)then
			local x,y,z = getElementPosition(v)
			if(getDistanceBetweenPoints3D(x,y,z,getElementPosition(player)) <= 2.5)then
				local plantID = getElementData(v,"PlantID")
				local plantIDTime = getPlayerData("pflanzen","ID",plantID,"STime")
				if(plantIDTime ~= 0 and plantIDTime - getSecTime(0) <= 0)then
					local model = getElementModel(v)
					setElementData(player,PflanzenItem[model],getElementData(player,PflanzenItem[model])+10)
					infobox(player,loc(player,"Systeme_270"),"info")
					dbExec(handler,"DELETE FROM pflanzen WHERE ID = '"..plantID.."'")
					destroyElement(v)
				else infobox(player,loc(player,"Systeme_271"),"error")end
			end
		end
	end
end