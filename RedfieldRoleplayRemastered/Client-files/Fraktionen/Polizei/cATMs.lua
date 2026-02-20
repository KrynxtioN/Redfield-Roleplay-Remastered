-- [[ BLIPS ERSTELLEN ]] --

addEvent("Polizei.createATMBlips",true)
addEventHandler("Polizei.createATMBlips",root,function(tbl,type)
	if(#Polizei.ATMBlips >= 1)then
		for _,v in pairs(Polizei.ATMBlips)do
			destroyElement(v)
		end
	end
	
	if(type)then
		Polizei.ATMBlips = {}
		for i,v in pairs (tbl)do
			Polizei.ATMBlips[i] = createBlip(v[1],v[2],v[3],0,2,0,255,0)
		end
	end
end)