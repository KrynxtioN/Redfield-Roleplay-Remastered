-- [[ ERFAHRUNGSPUNKTE VERGEBEN ]] --

function Levelsystem.givePoints(player,points)
	local level = getElementData(player,"Level")+1
	setElementData(player,"Erfahrungspunkte",getElementData(player,"Erfahrungspunkte")+points)
	local nextLevel = Levelsystem.needExp*level
	if(getElementData(player,"Erfahrungspunkte") >= nextLevel)then
		setElementData(player,"Erfahrungspunkte",0)
		setElementData(player,"Level",getElementData(player,"Level")+1)
	end
	if(not(isElement(Meeresreiniger.veh[player])))then
		triggerClientEvent(player,loc(player,"Systeme_244"):format(points,Levelsystem.needExp*level-getElementData(player,"Erfahrungspunkte")),"create")
		setTimer(function(player)
			triggerClientEvent(player,"Information.dxDraw",player,_,"destroy")
		end,5000,1,player)
	end
end