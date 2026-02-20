-- [[ EIN ITEM HERSTELLEN ]] --

addEvent("Craftingsystem.server",true)
addEventHandler("Craftingsystem.server",root,function(item)
	local state = true
	for _,v in pairs(Craftingsystem["Craftingitems"][item])do
		if(not(getElementData(client,v[1]) >= v[2]))then
			state = false
			break
		end
	end
	if(state == true)then
		for _,v in pairs(Craftingsystem["Craftingitems"][item])do
			setElementData(client,v[1],getElementData(client,v[1])-v[2])
		end
		setElementData(client,item,getElementData(client,item)+1)
		infobox(client,loc(client,"Systeme_218"),"info")
	else infobox(client,loc(client,"Systeme_219"),"error")end
end)