-- [[ PED ERSTELLEN ]] --

function Weedped.create()
	Weedped.price = math.random(5,12)
	local rnd = math.random(1,#Weedped["Spawns"])
	local tbl = Weedped["Spawns"][rnd]
	Weedped.ped = createPed(29,tbl[1],tbl[2],tbl[3],tbl[4])
	setPedAnimation(Weedped.ped,"DEALER","DEALER_IDLE")
	setElementData(Weedped.ped,"Weedped",true)
end
Weedped.create()


-- [[ WEED VERKAUFEN ]] --

addEvent("Weedped.sell",true)
addEventHandler("Weedped.sell",root,function(menge)
	local menge = tonumber(menge)
	if(getElementData(client,"Gras") >= menge)then
		if(isElement(Weedped.ped))then
			destroyElement(Weedped.ped)
			local price = menge*Weedped.price
			setElementData(client,"Gras",getElementData(client,"Gras")-menge)
			setElementData(client,"Geld",getElementData(client,"Geld")+price)
			infobox(client,loc(client,"Systeme_240"):format(menge,price),"info")
			triggerClientEvent(client,"setWindowDatas",client)
			setTimer(Weedped.create,3600000,1)
			Questsystem.addStufe(client,1)
		else infobox(client,loc(client,"Systeme_241"),"error")end
	else infobox(client,loc(client,"Systeme_242"),"error")end
end)