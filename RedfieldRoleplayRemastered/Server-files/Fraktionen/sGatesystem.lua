-- [[ GATES ERSTELLEN ]] --

local result = dbPoll(dbQuery(handler,"SELECT * FROM gates"),-1)

if(#result >= 1)then
	for i,v in pairs(result)do
		local gate = createObject(v["Model"],v["Spawnx"],v["Spawny"],v["Spawnz"],v["Spawnrotx"],v["Spawnroty"],v["Spawnrotz"])
		setElementInterior(gate,v["Interior"])
		setElementDimension(gate,v["Dimension"])
		setElementData(gate,"GateID",i)
		Gates[i] = {v["Movex"],v["Movey"],v["Movez"],v["Moverotx"],v["Moveroty"],v["Moverotz"],v["Fraktion"],v["Unternehmen"],v["BarriereMove"],false}
	end
end

-- [[ GATE ÖFFNEN ]] --

function Gates.open(player)
	local counter = 0
	for _,v in pairs(getElementsByType("object"))do
		if(getElementData(v,"GateID"))then
			local id = getElementData(v,"GateID")
			local x,y,z = getElementPosition(v)
			if(getDistanceBetweenPoints3D(x,y,z,getElementPosition(player)) <= 20)then
				if(getElementData(player,"RedfieldAdminmodus") ~= true)then
					if(Gates[id][7] > 0)then
						if(getElementData(player,"Fraktion") ~= Gates[id][7])then
							return false
						end
					end
					if(Gates[id][8] > 0)then
						if(getElementData(player,"Unternehmen") ~= Gates[id][8])then
							return false
						end
					end
				end
				if(getElementData(v,"GateMoving") ~= true)then
					setElementData(v,"GateMoving",true)
					if(Gates[id][10] == false)then
						Gates[id][10] = true
						Gates[id].save = {x,y,z,0,Gates[id][9],0}
						moveObject(v,5000,Gates[id][1],Gates[id][2],Gates[id][3],Gates[id][4],Gates[id][5],Gates[id][6])
					else
						Gates[id][10] = false
						moveObject(v,5000,Gates[id].save[1],Gates[id].save[2],Gates[id].save[3],Gates[id].save[4],Gates[id].save[5],Gates[id].save[6])
					end
					setTimer(function(v) setElementData(v,"GateMoving",false) end,5000,1,v)
				end
				counter = counter + 1
				if(counter >= 2)then break end
			end
		end
	end
end