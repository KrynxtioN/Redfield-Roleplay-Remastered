-- [[ DIE KRANKENHAUSANZEIGE ]] --

function Krankenhaus.dxDraw()
    dxDrawImage(567*(x/1440), 303*(y/900), 305*(x/1440), 294*(y/900), "Files/Images/Window1.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    dxDrawImage(567*(x/1440), 303*(y/900), 305*(x/1440), 25*(y/900), "Files/Images/Window2.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    dxDrawText("Krankenhaus", 567*(x/1440), 303*(y/900), 872*(x/1440), 328*(y/900), tocolor(255, 255, 255, 255), 1.00*(x/1440), "default-bold", "center", "center", false, false, false, false, false)
    dxDrawImage(577*(x/1440), 338*(y/900), 285*(x/1440), 140*(y/900), "Files/Images/Window2.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    dxDrawText(loc("Systeme_47"):format(Krankenhaus.time), 577*(x/1440), 338*(y/900), 862*(x/1440), 478*(y/900), tocolor(255, 255, 255, 255), 2.00*(x/1440), "default-bold", "center", "center", false, false, false, false, false)
    dxDrawText(loc("Systeme_48"), 577*(x/1440), 488*(y/900), 862*(x/1440), 511*(y/900), tocolor(255, 255, 255, 255), 1.00*(x/1440), "default-bold", "center", "center", false, true, false, false, false)
    dxDrawText(Krankenhaus.fakt, 577*(x/1440), 521*(y/900), 862*(x/1440), 587*(y/900), tocolor(255, 255, 255, 255), 1.00*(x/1440), "default-bold", "center", "center", false, true, false, false, false)
end

addEvent("Krankenhaus.dxDraw",true)
addEventHandler("Krankenhaus.dxDraw",root,function()
	Krankenhaus.time = 60
	setCameraMatrix(-2524.3015136719,592.09289550781,50.175701141357,-2525.1467285156,592.62396240234,50.115989685059)
	Krankenhaus.fakt = Fakten[math.random(1,#Fakten)]
	setWindowDatas()
	addEventHandler("onClientRender",root,Krankenhaus.dxDraw)
	
	setTimer(function()
		Krankenhaus.time = Krankenhaus.time - 1
		if(Krankenhaus.time == 0)then
			removeEventHandler("onClientRender",root,Krankenhaus.dxDraw)
			triggerServerEvent("spawnPlayerNew",localPlayer,localPlayer)
			setWindowDatas()
		end
	end,1000,Krankenhaus.time)
end)

-- [[ AIDSBEHANDLUNG ]] --

addEvent("Krankenhaus.aidsBehandlung",true)
addEventHandler("Krankenhaus.aidsBehandlung",root,function()
	if(isWindowOpen())then
        GUIEditor.window[1] = guiCreateWindow(523, 290, 352, 118, loc("Systeme_49"), false)

        GUIEditor.label[1] = guiCreateLabel(10, 28, 332, 41, loc("Systeme_50"), false, GUIEditor.window[1])
        GUIEditor.button[1] = guiCreateButton(10, 79, 333, 29, loc("Systeme_51"), false, GUIEditor.window[1])   
		setWindowDatas(1)
		
		addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
			triggerServerEvent("Krankenhaus.aidsBehandlung",localPlayer)
		end,false)
    end
end)

-- [[ SCHWANGERSCHAFT & ADOPTION ]] --

addEvent("Krankenhaus.openWindow",true)
addEventHandler("Krankenhaus.openWindow",root,function(playerChilds,childs)
	if(isWindowOpen())then
        GUIEditor.window[1] = guiCreateWindow(379, 189, 556, 376, loc("Systeme_52"), false)

        GUIEditor.tabpanel[1] = guiCreateTabPanel(10, 24, 536, 342, false, GUIEditor.window[1])

        GUIEditor.tab[1] = guiCreateTab(loc("Systeme_53"), GUIEditor.tabpanel[1])

        GUIEditor.button[1] = guiCreateButton(10, 82, 303, 29, loc("Systeme_54"), false, GUIEditor.tab[1])
        GUIEditor.label[1] = guiCreateLabel(10, 10, 516, 62, loc("Systeme_55"), false, GUIEditor.tab[1])
        GUIEditor.button[2] = guiCreateButton(223, 121, 303, 29, loc("Systeme_56"), false, GUIEditor.tab[1])
        GUIEditor.staticimage[1] = guiCreateStaticImage(10, 160, 516, 148, ":guieditor/images/examples/shruk.png", false, GUIEditor.tab[1])

        GUIEditor.tab[2] = guiCreateTab(loc("Systeme_57"), GUIEditor.tabpanel[1])

        GUIEditor.gridlist[1] = guiCreateGridList(10, 39, 203, 93, false, GUIEditor.tab[2])
        guiGridListAddColumn(GUIEditor.gridlist[1], loc("Systeme_58"), 0.5)
        guiGridListAddColumn(GUIEditor.gridlist[1], loc("Systeme_59"), 0.5)
        GUIEditor.label[2] = guiCreateLabel(10, 10, 203, 19, loc("Systeme_60"), false, GUIEditor.tab[2])
        GUIEditor.label[3] = guiCreateLabel(10, 142, 203, 29, loc("Systeme_61"), false, GUIEditor.tab[2])
        GUIEditor.gridlist[2] = guiCreateGridList(10, 181, 516, 127, false, GUIEditor.tab[2])
        guiGridListAddColumn(GUIEditor.gridlist[2], loc("Systeme_62"), 0.5)
        guiGridListAddColumn(GUIEditor.gridlist[2], loc("Systeme_63"), 0.5)
        GUIEditor.label[4] = guiCreateLabel(223, 10, 303, 83, loc("Systeme_64"), false, GUIEditor.tab[2])
        GUIEditor.button[3] = guiCreateButton(223, 103, 303, 29, loc("Systeme_65"), false, GUIEditor.tab[2])
        GUIEditor.button[4] = guiCreateButton(223, 142, 303, 29, loc("Systeme_66"), false, GUIEditor.tab[2]) 
		
		setWindowDatas(4)
	end
end)