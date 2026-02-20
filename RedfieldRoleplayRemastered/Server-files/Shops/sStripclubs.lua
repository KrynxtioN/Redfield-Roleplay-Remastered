-- [[ PEDS ERSTELLEN ]] --

function Stripclub.createPeds(id)
	for i,v in ipairs(Stripclub["Nutten"])do
		if(not(isElement(Stripclub.peds[id][i])))then
			Stripclub.peds[id][i] = createPed(v[1],v[2],v[3],v[4],v[5])
			setElementInterior(Stripclub.peds[id][i], 3)
			setElementDimension(Stripclub.peds[id][i],id)
			setElementFrozen(Stripclub.peds[id][i],true)
			
			setTimer(function(ped,anim1,anim2)
				setPedAnimation(ped,anim1,anim2)
			end,250,1,Stripclub.peds[id][i],v[6],v[7])
			
			addEventHandler("onPedWasted",Stripclub.peds[id][i],function(_,player)
				infobox(player,loc(player,"Shops_142"),"error")
				takeMoney(player,1000)
				destroyElement(source)
				Stripclub.createPeds(getElementDimension(player))
			end)
		end
	end
end

for i = 1,6 do
	Stripclub.peds[i]  = {}
	Stripclub.createPeds(i)
end