-- [[ BEFEHL ZUM ÖFFNEN DES EIGENMENÜS ]] --

addCommandHandler("self",function()
	if(isWindowOpen())then
		if(fileExists("Files/Images/Selfmenue/Close.png"))then
			Eigenmenue.slot = 1
			setWindowDatas()
			addEventHandler("onClientRender",root,Eigenmenue.dxDraw)
			bindKey("enter","down",Eigenmenue.close)
			bindKey("arrow_l","down",Eigenmenue.links)
			bindKey("arrow_r","down",Eigenmenue.rechts)
			triggerEvent("Eigenmenue."..Eigenmenue["Images"][Eigenmenue.slot][1],localPlayer)
		else infobox(loc("Anzeigen_39"),"error")end
	end
end)

-- [[ DAS EIGENMENÜ ]] --

function Eigenmenue.dxDraw()
	if(infoboxState == false)then
		dxDrawRectangle(533*(x/1440), 49*(y/900), 375*(x/1440), 81*(y/900), tocolor(0, 0, 0, 175), false)
		dxDrawLine(534*(x/1440), 130*(y/900), 908*(x/1440), 130*(y/900), tocolor(255, 255, 255, 255), 1, false)
		dxDrawText(loc("Anzeigen_40"), 533*(x/1440), 140*(y/900), 908*(x/1440), 169*(y/900), tocolor(0,255,0, 255), 1.00*(x/1440), "default-bold", "center", "center", false, false, false, false, false)

		for i = 1,#Eigenmenue["Images"] do
			local coord = 543 + i*73 - 73
			dxDrawImage(coord*(x/1440), 59*(y/900), 63*(x/1440), 61*(y/900), "Files/Images/Selfmenue/"..Eigenmenue["Images"][i][1]..""..Eigenmenue["Images"][i][2]..".png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
		end
	end
end

-- [[ DAS EIGENMENÜ SCHLIESSEN ]] --

function Eigenmenue.close()
	setWindowDatas()
	unbindKey("enter","down",Eigenmenue.close)
	unbindKey("arrow_l","down",Eigenmenue.links)
	unbindKey("arrow_r","down",Eigenmenue.rechts)
	removeEventHandler("onClientRender",root,Eigenmenue.dxDraw)
	Eigenmenue["Images"][1][2] = "Farbe"
	for i = 2,4 do Eigenmenue["Images"][i][2] = "Grau" end
end

-- [[ NACH RECHTS & LINKS WECHSELN ]] --

function Eigenmenue.links()
	if(Eigenmenue.slot > 1)then
		if(isElement(GUIEditor.window[1]))then destroyElement(GUIEditor.window[1])end
		Eigenmenue["Images"][Eigenmenue.slot][2] = "Grau"
		Eigenmenue.slot = Eigenmenue.slot - 1
		Eigenmenue["Images"][Eigenmenue.slot][2] = "Farbe"
		triggerEvent("Eigenmenue."..Eigenmenue["Images"][Eigenmenue.slot][1],localPlayer)
	end
end

function Eigenmenue.rechts()
	if(Eigenmenue.slot < #Eigenmenue["Images"])then
		if(isElement(GUIEditor.window[1]))then destroyElement(GUIEditor.window[1])end
		Eigenmenue["Images"][Eigenmenue.slot][2] = "Grau"
		Eigenmenue.slot = Eigenmenue.slot + 1
		Eigenmenue["Images"][Eigenmenue.slot][2] = "Farbe"
		triggerEvent("Eigenmenue."..Eigenmenue["Images"][Eigenmenue.slot][1],localPlayer)
	end
end

-- [[ ADMINANZEIGE ]] --

addEvent("Eigenmenue.Admins",true)
addEventHandler("Eigenmenue.Admins",root,function()
	GUIEditor.window[1] = guiCreateWindow(352, 335, 339, 218, loc("Anzeigen_41"), false, "nocross")

    GUIEditor.gridlist[1] = guiCreateGridList(10, 27, 319, 181, false, GUIEditor.window[1])
    spieler = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Anzeigen_42"), 0.5)
    rang = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Anzeigen_43"), 0.5)
	setWindowDatas(_,_,true)
	
	for _,v in pairs(getElementsByType("player"))do
		if(getElementData(v,"Adminlevel") >= 1)then
			local row = guiGridListAddRow(GUIEditor.gridlist[1])
			guiGridListSetItemText(GUIEditor.gridlist[1],row,spieler,getPlayerName(v),false,false)
			guiGridListSetItemText(GUIEditor.gridlist[1],row,rang,Adminsystem["Names"][getElementData(v,"Adminlevel")],false,false)
		end
	end
end)