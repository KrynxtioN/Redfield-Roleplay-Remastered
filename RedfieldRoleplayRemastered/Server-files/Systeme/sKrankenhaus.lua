-- [[ ADOPTIONSFENSTER ÖFFNEN ]] --

addEvent("Krankenhaus.openWindow",true)
addEventHandler("Krankenhaus.openWindow",root,function()
	local result = dbPoll(dbQuery(handler,"SELECT * FROM kinder"),-1)
	local playerChilds = {}
	local childs = {}
	
	if(#result >= 1)then
		for _,v in pairs(result)do
			if(v["Besitzer"] == getPlayerName(client))then table.insert(playerChilds,{})end
			if(v["Adoption"] == 1)then table.insert(childs,{})end
		end
	end
	triggerClientEvent(client,"Krankenhaus.openWindow",client,playerChilds,childs)
end)


-- [[ AIDSBEHANDLUNG ]] --

addEvent("Krankenhaus.aidsBehandlung",true)
addEventHandler("Krankenhaus.aidsBehandlung",root,function()
	if(getElementData(client,"Aids") == 1)then
		if(hasMoney(client,25000))then
			setElementData(client,"Aids",0)
			takeMoney(client,25000)
			infobox(client,loc(client,"Systeme_231"),"info")
		end
	else infobox(client,loc(client,"Systeme_232"),"error")end
end)