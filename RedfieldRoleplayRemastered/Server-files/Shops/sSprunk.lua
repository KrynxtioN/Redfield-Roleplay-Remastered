-- [[ AUTOMATEN ERSTELLEN ]] --

for _,v in pairs(Sprunk["Automaten"])do
	local sprunk = createObject(1775,v[1],v[2],v[3],v[4],v[5],v[6])
	setElementInterior(sprunk,v[7])
	setElementDimension(sprunk,v[8])
	setElementData(sprunk,"Dosen",getPlayerData("sprunkautomaten","ID",v[9],"Dosen"))
	setElementData(sprunk,"DosenPreis",getPlayerData("sprunkautomaten","ID",v[9],"DosenPreis"))
	setElementData(sprunk,"SprunkID",v[9])
end

-- [[ SPRUNK-DATAS SETZEN ]] --
function Sprunk.setDatas(player)
	local dosen = getPlayerData("sprunkautomaten","ID",1,"Dosen")
	local dosenPreis = getPlayerData("sprunkautomaten","ID",1,"DosenPreis")
	triggerClientEvent(player,"Sprunk.refreshTable",player,dosen,dosenPreis)
end

-- [[ HARNDRANG HINZUFÜGEN ]] --

function addHarndrang(player)
	setElementData(player,"Harndrang",getElementData(player,"Harndrang") + 2)
	if(getElementData(player,"Harndrang") > 100)then
		setElementData(player,"Harndrang",100)
	end
end