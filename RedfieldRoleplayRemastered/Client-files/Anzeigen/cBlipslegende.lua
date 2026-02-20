local Blipslegende = { --// Blip-ID, Name
	{5,"Flughafen / Flugzeugladen"},
	{6,"Ammunation"},
	{7,"Friseur"},
	{9,"Angelladen / Bootshaus"},
	{10,"Burgershot"},
	{11,"Wohnwagenverkauf"},
	{12,"Lottoladen"},
	{14,"Cluckin' Bell"},
	{17,"Donutladen"},
	{18,"Deagle-Arena"},
	{21,"Stripclub / Sexshop"},
	{22,"Krankenhaus"},
	{23,"Bar"},
	{24,"Drogentransporter / Drogenschiff"},
	{25,"Casino",},
	{27,"Tuningshop"},
	{29,"Pizzeria",},
	{30,"Police Department"},
	{31,"Hotel"},
	{33,"Shooter-Arena"},
	{36,"Supermarkt"},
	{37,"Goldbarrenankauf"},
	{38,"Schwarzmarkt"},
	{39,"Tattoostudio"},
	{42,"Tankstelle"},
	{45,"Skinshop"},
	{51,"Warenhausraub"},
	{52,"Bank"},
	{54,"Fitnessstudio"},
	{55,"Autohaus / Bikeshop"},
	{56,"Stadthalle / Fahrschule"},
	{58,"Job"},
	{60,"Schmied"},
	{62,"Gartenclub"},
	{63,"Pay 'N Spray"},
}

-- [[ LEGENDE ANZEIGEN ]] --

addEventHandler("onClientRender", root,function()
	if(fileExists("Files/Images/Blips/63.png"))then
		if(isWindowOpen() and isPlayerMapVisible())then
			for i,v in ipairs(Blipslegende)do
				local i = i - 1
				dxDrawImage(1179*(x/1440), 4+(i*16)*(y/900), 12*(x/1440), 12*(y/900), "Files/Images/Blips/"..v[1]..".png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
				dxDrawText(v[2], 1201*(x/1440), 4+(i*16)*(y/900), 1430*(x/1440), 16+(i*16)*(y/900), tocolor(255, 255, 255, 255), 0.80*(x/1440), "default-bold", "left", "center", false, false, false, false, false)
			end
		end
	end
end)