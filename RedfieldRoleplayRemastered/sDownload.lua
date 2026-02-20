local filepaths = {}
local playersdownloaded = {}

addEventHandler("onResourceStart",resourceRoot,function()
	local meta = xmlLoadFile("meta.xml")
	local nodes = xmlNodeGetChildren(meta)
	if(nodes and nodes[1])then
		local j = 0
		for i = 1,#nodes do
			if(xmlNodeGetName(nodes[i]) == "file")then
				if(xmlNodeGetAttribute(nodes[i],"download") == "false")then
					j = j + 1
					filepaths[j] = xmlNodeGetAttribute(nodes[i],"src")
				end
			end
		end
	end
	xmlUnloadFile(meta)
end)

addEvent("clientLoadedResource_Bonus",true)
addEventHandler("clientLoadedResource_Bonus",root,function()
	if(filepaths[1] and not(playersdownloaded[client]))then
		playersdownloaded[client] = true
		triggerLatentClientEvent(client,"downloadFiles_Bonus",30000,false,client,filepaths)
	end
end)

addEventHandler("onPlayerQuit",root,function()
	playersdownloaded[source] = nil
end)