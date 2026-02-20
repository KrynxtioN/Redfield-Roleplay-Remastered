-- [[ BAUSTELLE GENERIEREN ]] --

function Baustelle.create()
	local rnd = math.random(1,Baustelle.possibleBaustellen)
	startResource(getResourceFromName("Baustelle"..rnd))
	Baustelle.id = rnd
	Baustelle.createPeds()
	Baustelle.createVehicles()
end

-- [[ PEDS ERSTELLEN ]] --

function Baustelle.createPeds()
	if(Baustelle["PedCoordinates"][Baustelle.id])then
		for i,v in ipairs(Baustelle["PedCoordinates"][Baustelle.id])do
			Baustelle.peds[i] = createPed(v[1],v[2],v[3],v[4],v[5])
			setElementFrozen(Baustelle.peds[i],true)
			setElementData(Baustelle.peds[i],"Baustelle",true)
			if(v[6] and v[7])then
				setTimer(function(ped)
					setPedAnimation(ped,v[6],v[7])
				end,500,1,Baustelle.peds[i])
			end
		end
	end
end

-- [[ FAHRZEUGE ERSTELLEN ]] --

function Baustelle.createVehicles()
	if(Baustelle["VehicleCoordinates"][Baustelle.id])then
		for i,v in ipairs(Baustelle["VehicleCoordinates"][Baustelle.id])do
			Baustelle.vehicles[i] = createVehicle(v[1],v[2],v[3],v[4],v[5],v[6],v[7])
			setVehicleLocked(Baustelle.vehicles[i],true)
			setVehicleDamageProof(Baustelle.vehicles[i],true)
		end
	end
end

--Baustelle.create()