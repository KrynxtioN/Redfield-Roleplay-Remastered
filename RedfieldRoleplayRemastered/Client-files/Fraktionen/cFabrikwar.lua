addEvent("Fabrikwar.openWindow",true)
addEventHandler("Fabrikwar.openWindow",root,function()
	if(isWindowOpen())then
        GUIEditor.window[1] = guiCreateWindow(547, 366, 280, 70, loc("Fraktionen_62"), false)

        GUIEditor.button[1] = guiCreateButton(10, 26, 260, 34, loc("Fraktionen_63"), false, GUIEditor.window[1])
		setWindowDatas()
		
		addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
			triggerServerEvent("Fabrikwar.attack",localPlayer)
		end,false)
    end
end)

addEvent("Fabrikwar.loadBlips",true)
addEventHandler("Fabrikwar.loadBlips",root,function(datas)
	for i = 1,#Fabrikwar.blips do
		exports.customblips:destroyCustomBlip(Fabrikwar.blips[i])
	end
	Fabrikwar.blips = {}
	for i,v in pairs(datas)do
		Fabrikwar.blips[i] = exports.customblips:createCustomBlip(v[1],v[2],22,22,"Files/Images/Fabriken/Fabrik"..v[3]..".png",100)
	end
end)

local Rendered = false

addEvent("Fabrikwar.dxDraw",true)
addEventHandler("Fabrikwar.dxDraw",root,function(type,text)
	Fabrikwar.text = text
	if(isTimer(Fabrikwar.infoTimer))then killTimer(Fabrikwar.infoTimer)end
	if(type == "create")then
		if(Rendered == false)then
			Rendered = true
			addEventHandler("onClientRender",root,Fabrikwar.dxDraw)
		end
		Fabrikwar.infoTimer = setTimer(function()
			Rendered = false
			removeEventHandler("onClientRender",root,Fabrikwar.dxDraw)
		end,5000,1)
	else
		Rendered = false
		removeEventHandler("onClientRender",root,Fabrikwar.dxDraw)
	end
end)

function Fabrikwar.dxDraw()
	if(isWindowOpen())then
        dxDrawText(Fabrikwar.text, 10*(x/1440), 401*(y/900), 1430*(x/1440), 500*(y/900), tocolor(7, 63, 247, 255), 3.00*(x/1440), "default-bold", "center", "center", false, true, false, false, false)
	end
end