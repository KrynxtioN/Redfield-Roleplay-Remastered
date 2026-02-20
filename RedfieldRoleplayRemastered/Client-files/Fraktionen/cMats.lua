local Pos = {
	[6] = {
		{2011.3725585938,2183.0520019531,10.845399856567},
		{-2188.0139160156,695.13000488281,53.890598297119},
	},
	[7] = {
		{1685.6158447266,1912.44140625,11.023400306702},
		{-2456.3225097656,-96.945198059082,25.984399795532},
	},
	[8] = {
		{656.92077636719,-460.79330444336,16.333200454712},
		{-2216.3684082031,71.474899291992,35.327899932861},
	},
	[9] = {
		{-1476.9434814453,2646.5522460938,55.835899353027},
		{-2222.4973144531,-102.17900085449,35.320301055908},
	},
}

-- [[ DAS FENSTER ]] --

addEvent("Matslager.openWindow",true)
addEventHandler("Matslager.openWindow",root,function()
	if(isWindowOpen())then
		local fac = getElementData(localPlayer,"Fraktion")
		if(Pos[fac])then
			local state = false
			for _,v in pairs(Pos[fac])do
				if(getDistanceBetweenPoints3D(v[1],v[2],v[3],getElementPosition(localPlayer)) <= 5)then
					state = true
					break
				end
			end
			if(state == true)then
				setElementHealth(localPlayer,100)
				triggerServerEvent("givePlayerArmor",localPlayer)
				setElementData(localPlayer,"Hunger",100)
				GUIEditor.window[1] = guiCreateWindow(512, 224, 316, 324, loc("Fraktionen_77"), false)

				GUIEditor.gridlist[1] = guiCreateGridList(9, 25, 297, 249, false, GUIEditor.window[1])
				waffe = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Fraktionen_78"), 0.4)
				munition = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Fraktionen_79"), 0.2)
				matskosten = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Fraktionen_80"), 0.3)
				GUIEditor.button[1] = guiCreateButton(9, 284, 297, 30, loc("Fraktionen_81"), false, GUIEditor.window[1])
				setWindowDatas()
					
				for _,v in pairs(Matslager)do
					local row = guiGridListAddRow(GUIEditor.gridlist[1])
					guiGridListSetItemText(GUIEditor.gridlist[1],row,waffe,v[1],false,false)
					guiGridListSetItemText(GUIEditor.gridlist[1],row,munition,v[2],false,false)
					guiGridListSetItemText(GUIEditor.gridlist[1],row,matskosten,v[3],false,false)
				end
					
				addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
					local clicked = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),1)
					local preis = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),2)
					if(clicked ~= "")then
						triggerServerEvent("Matslager.herstellen",localPlayer,clicked,preis)
					end
				end,false)
			else infobox(loc("Fraktionen_99"),"error")end
		end
	end
end)