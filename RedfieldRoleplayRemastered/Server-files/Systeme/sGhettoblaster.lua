-- [[ MUSIK STARTEN ]] --

addEvent("newPlaySound",true)
addEventHandler("newPlaySound",root,function(link)
	Ghettoblaster[client] = createObject(2226,0,0,0)
	exports.bone_attach:attachElementToBone(Ghettoblaster[client],client,12,0,0,0.4,0,180,0)
	for _,v in pairs(getElementsByType("player"))do
		triggerClientEvent(v,"createNewMusik",v,client,link)
	end
end)


-- [[ MUSIK STOPPEN ]] --

function deleteBlaster(player)
	if(isElement(Ghettoblaster[player]))then
		destroyElement(Ghettoblaster[player])
		for _,v in pairs(getElementsByType("player"))do
			triggerClientEvent(v,"deleteMusic",v,player)
		end
	end
end
addEvent("deleteBlaster",true)
addEventHandler("deleteBlaster",root,deleteBlaster)