-- [[ ANIMATION AUSFÜHREN ]] --

addEvent("Animationen.server",true)
addEventHandler("Animationen.server",root,function(animation)
	if(not(isPedInVehicle(client)))then
		setPedAnimation(client,Animationen["Animationen"][animation][1],Animationen["Animationen"][animation][2],Animationen["Animationen"][animation][3],Animationen["Animationen"][4],Animationen["Animationen"][5])
		infobox(client,loc(client,"Systeme_243"),"info")
		bindKey(client,"space","down",Animationen.stop)
	end
end)


-- [[ ANIMATION BEENDEN ]] --

function Animationen.stop(player)
	setPedAnimation(player)
	unbindKey(player,"space","down",Animationen.stop)
end