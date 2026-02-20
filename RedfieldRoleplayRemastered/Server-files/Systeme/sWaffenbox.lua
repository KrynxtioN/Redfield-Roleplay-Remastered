-- [[ DAS FENSTER ÖFFNEN ]] --

function Waffenbox.openWindow(player,state)
	local tbl = {}
	for i = 1,3 do
		table.insert(tbl,{getPlayerData("waffenbox","Username",getPlayerName(player),"Slot"..i.."Gun"),getPlayerData("waffenbox","Username",getPlayerName(player),"Slot"..i.."Ammo")})
	end
	triggerClientEvent(player,"Waffenbox.openWindow",player,tbl,state)
end
addEvent("Waffenbox.openWindow",true)
addEventHandler("Waffenbox.openWindow",root,Waffenbox.openWindow)


-- [[ WAFFE REINLEGEN / RAUSNEHMEN ]] --

addEvent("Waffenbox.server",true)
addEventHandler("Waffenbox.server",root,function(slot)
	local waffe,munition = getPedWeapon(client),getPedTotalAmmo(client)
	local gun = getPlayerData("waffenbox","Username",getPlayerName(client),"Slot"..slot.."Gun")

	if(gun == 1337)then
		if(waffe >= 1)then
			dbExec(handler,"UPDATE waffenbox SET Slot"..slot.."Gun = '"..waffe.."', Slot"..slot.."Ammo = '"..munition.."' WHERE Username = '"..getPlayerName(client).."'")
			takeWeapon(client,waffe)
		else infobox(client,loc(client,"Systeme_239"),"error")end
	else
		giveWeapon(client,gun,getPlayerData("waffenbox","Username",getPlayerName(client),"Slot"..slot.."Ammo"),true)
		dbExec(handler,"UPDATE waffenbox SET Slot"..slot.."Gun = '1337', Slot"..slot.."Ammo = '0' WHERE Username = '"..getPlayerName(client).."'")
	end
	Waffenbox.openWindow(client,true)
end)