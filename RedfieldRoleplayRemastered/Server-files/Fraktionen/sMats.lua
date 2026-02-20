-- [[ WAFFE HERSTELLEN ]] --

addEvent("Matslager.herstellen",true)
addEventHandler("Matslager.herstellen",root,function(artikel,preis)
	local FLager = getPlayerData("fraktionslager","ID",getElementData(client,"Fraktion"),"Materialien")
	if(FLager >= tonumber(preis))then
		local weapon,ammo = Ammunation["ID"][artikel][1],Ammunation["ID"][artikel][2]
		giveWeapon(client,weapon,ammo,true)
		infobox(client,loc(client,"Fraktionen_343"),"info")
		dbExec(handler,"UPDATE fraktionslager SET Materialien = '"..FLager - preis.."' WHERE ID = '"..getElementData(client,"Fraktion").."'")
	else infobox(client,loc(client,"Fraktionen_344"),"error")end
end)

addEvent("givePlayerArmor",true)
addEventHandler("givePlayerArmor",root,function()
	setPedArmor(client,100)
end)