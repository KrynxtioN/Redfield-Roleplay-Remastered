-- [[ PERSONALAUSWEIS / ARBEITSGENEHMIGUNG BEANTRAGEN ]] --

addEvent("Personalien.server",true)
addEventHandler("Personalien.server",root,function(type)
	if(type == "Personalausweis beantragen - Kosten: $25")then
		if(hasMoney(client,25))then
			if(getElementData(client,"Personalausweis") == 0)then
				setElementData(client,"Personalausweis",1)
				infobox(client,loc(client,"Systeme_226"),"info")
				takeMoney(client,25)
			else infobox(client,loc(client,"Systeme_227"),"error")end
		end
	elseif(type == "Arbeitsgenehmigung beantragen - Kosten: $150")then
		if(hasMoney(client,150))then
			if(getElementData(client,"Arbeitsgenehmigung") == 0)then
				setElementData(client,"Arbeitsgenehmigung",1)
				infobox(client,loc(client,"Systeme_228"),"info")
				takeMoney(client,150)
			else infobox(client,loc(client,"Systeme_229"),"error")end
		end
	end
	
	if(getElementData(client,"TutorialTask") == 2)then
		if(getElementData(client,"Arbeitsgenehmigung") == 1 and getElementData(client,"Personalausweis") == 1)then
			Tutorial.aufgabeErledigt(client)
		end
	end
end)