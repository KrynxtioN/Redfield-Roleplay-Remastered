-- [[ NEUEN STYLE SPEICHERN ]] --

addEvent("Fightstyles.saveNewStyle",true)
addEventHandler("Fightstyles.saveNewStyle",root,function()
	local style = getPedFightingStyle(client)
	dbExec(handler,"UPDATE accounts SET Kampfstil = '"..style.."' WHERE Username = '"..getPlayerName(client).."'")
	infobox(client,loc(client,"CJ_16"),"info")
	setElementPosition(client,764.71478271484,9.5778760910034,1000.7110595703)
	setElementDimension(client,getElementData(client,"SavedDimension"))
	setElementData(client,"SavedDimension",nil)
end)

-- [[ BEI NIEDERLAGE ALTEN STYLE GEBEN ]] --

addEvent("Fightstyles.resetFightingstyle",true)
addEventHandler("Fightstyles.resetFightingstyle",root,function()
	local style = getPlayerData("accounts","Username",getPlayerName(client),"Kampfstil")
	setPedFightingStyle(client,style)
	setElementData(client,"SavedDimension",nil)
end)

-- [[ KAMPF STARTEN ]] --

addEvent("Fightstyles.startFight",true)
addEventHandler("Fightstyles.startFight",root,function(style)
	if(hasMoney(client,25000))then
		local dim = getFreeDimension()
		setElementData(client,"SavedDimension",getElementDimension(client))
		takeMoney(client,25000)
		infobox(client,loc(client,"CJ_17"),"info")
		setElementDimension(client,dim)
		setElementPosition(client,758.64978027344,-2.0171999931335,1001.5941772461)
		setPedRotation(client,316)
		setPedFightingStyle(client,Fightstyles["ID"][style])
		triggerClientEvent(client,"Fightstyles.startFight",client)
		triggerClientEvent(client,"setWindowDatas",client)
		outputLog(getPlayerName(client).." hat einen Kampf begonnen.","CJ")
	else infobox(client,loc(client,"CJ_18")"error")end
end)