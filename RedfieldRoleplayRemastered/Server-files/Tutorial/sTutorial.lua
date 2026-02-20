-- [[ AUFGABE ERLEDIGT ]] --

function Tutorial.aufgabeErledigt(player)
	setElementData(player,"TutorialTask",getElementData(player,"TutorialTask")+1)
	triggerClientEvent(player,"Tutorial.createNextTask",player)
	local tasks = getElementData(player,"TutorialTask")
	setElementData(player,"Geld",getElementData(player,"Geld")+Tutorial[tasks][2])
end
addEvent("Tutorial.aufgabeErledigt",true)
addEventHandler("Tutorial.aufgabeErledigt",root,Tutorial.aufgabeErledigt)

function givePlayerHandynummer(player)
	local nr = math.random(10000,99999)
	local result = dbPoll(dbQuery(handler,"SELECT * FROM accounts WHERE Handynummer = '"..nr.."'"),-1)
	if(#result == 0)then
		setElementData(player,"Handynummer",nr)
	else givePlayerHandynummer(player) end
end
addEvent("givePlayerHandynummer",true)
addEventHandler("givePlayerHandynummer",root,givePlayerHandynummer)