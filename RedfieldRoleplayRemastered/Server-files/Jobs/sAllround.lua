-- [[ JOBGEHALT GEBEN ]] --

function giveJobMoney(player,money)
	if(Wetter.KeineKatastrophe == true)then
		if(Wetter.Oelpest == true or Wetter.Sandsturm == true)then
			money = money/100*85
		elseif(Wetter.Streik == true or Wetter.HoheTemperaturen == true)then
			money = money/100*110
		end
	end

	local time = getRealTime()
	local erfahrungspunkte = math.floor(money/50)
	Levelsystem.givePoints(player,erfahrungspunkte)
	if(daytable[time.weekday+1] == "Fr" and time.hour >= 10 or daytable[time.weekday+1] == "Sa" or daytable[time.weekday+1] == "So" and time.hour < 23)then
		money = money + (money/100*20)
		erfahrungspunkte = erfahrungspunkte + (erfahrungspunkte/100*20)
	end
	local bonus = money/100*getElementData(player,"Jobgehaltsbonus")
	local GesamtMoney = money + bonus
	
	setElementData(player,"Jobmoney",getElementData(player,"Jobmoney")+GesamtMoney)
	infobox(player,loc(player,"Jobs_42"):format(GesamtMoney),"info")
end
addEvent("giveJobMoney",true)
addEventHandler("giveJobMoney",root,giveJobMoney)