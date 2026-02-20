-- [[ THEORIE ]] --

addEvent("Waffenschein.theorie",true)
addEventHandler("Waffenschein.theorie",root,function()
	if(hasMoney(client,18500))then
		takeMoney(client,18500)
		triggerClientEvent(client,"Waffenschein.openInformationsWindow",client)
	end
end)

-- [[ PRAXIS ]] --

addEvent("Waffenschein.praxis",true)
addEventHandler("Waffenschein.praxis",root,function()
	if(getElementData(client,"WaffenscheinTheorie") == 1)then
		if(hasMoney(client,34750))then
			takeMoney(client,34750)
			triggerClientEvent(client,"setWindowDatas",client)
			Waffenschein.warpPlayerIntoGunlicensePruefung(client)
		end
	else infobox(client,loc(client,"Systeme_258"),"error")end
end)