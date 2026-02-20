local Positions = {
	{774.59387207031,7.1871790885925,1000.7084960938,"Boxer"},
	{-2265.6999511719,177.60000610352,35.299999237061,"Busfahrer"},
	{-1061.0999755859,-1192.3000488281,129.19999694824,"Farmer"},
	{-2003.9000244141,-2363,30.60000038147,"Holzfaeller"},
	{2494.3999023438,-2257.6999511719,3,"Meeresreiniger"},
	{-1897.5999755859,-1682.6999511719,23,"Muellmann"},
	{-1413.5999755859,-297.89999389648,6.1999998092651,"Pilot"},
	{-1988.3000488281,1039.0999755859,55.700000762939,"Postbote"},
	{2138.8000488281,-1994.0999755859,13.5,"Schrottplatzmitarbeiter"},
	{-2239.8037109375,285.93090820313,35.320301055908,"Taxifahrer"},
	{1234.1302490234,146.03689575195,20.097200393677,"Hoehlenforscher"},
}

-- [[ JOBFENSTER ]] --

addEvent("Jobs.openWindow",true)
addEventHandler("Jobs.openWindow",root,function()
	if(isWindowOpen())then
		for _,v in pairs(Positions)do
			if(getDistanceBetweenPoints3D(v[1],v[2],v[3],getElementPosition(localPlayer)) <= 10)then
				if(getElementData(localPlayer,"Job") ~= v[4])then
					infobox(loc("Jobs_35"):format(v[4]),"error")
					return false
				end
				break
			end
		end
	
		local playerJob = getElementData(localPlayer,"Job")
        GUIEditor.window[1] = guiCreateWindow(407, 233, 433, 253, playerJob, false)

        GUIEditor.tabpanel[1] = guiCreateTabPanel(10, 24, 413, 219, false, GUIEditor.window[1])
		
		for i = 1,#Job["Jobbeschreibungen"][playerJob] do
			GUIEditor.tab[i] = guiCreateTab(Job["Jobbeschreibungen"][playerJob][i][1],GUIEditor.tabpanel[1])
			GUIEditor.label[i] = guiCreateLabel(10,10,393,140,Job["Jobbeschreibungen"][playerJob][i][2].."\n\nDeine Punkte: "..tonumber(getElementData(localPlayer,playerJob.."Punkte")).." - Benötigte Punkte: "..Job["Jobbeschreibungen"][playerJob][i][3],false,GUIEditor.tab[i])
			GUIEditor.button[i] = guiCreateButton(10,160,393,25,"Starten",false,GUIEditor.tab[i])
				
			addEventHandler("onClientGUIClick",GUIEditor.button[i],function()
				if(getElementData(localPlayer,playerJob.."Punkte") >= Job["Jobbeschreibungen"][playerJob][i][3])then
					setWindowDatas()
					triggerEvent(getElementData(localPlayer,"Job")..".level"..i,localPlayer)
				else infobox(loc("Jobs_36"),"error")end
			end,false)
		end
		setWindowDatas(#Job["Jobbeschreibungen"][playerJob])
    end
end)