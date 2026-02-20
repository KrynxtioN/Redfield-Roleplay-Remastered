setElementData(localPlayer,"IntroSkip",false)
setElementData(localPlayer,"Language","DE")

-- [[ DATEN SETZEN / TRIGGERN ]] --

local Camflight = {
	{-2008.8765869141,325.63018798828,43.744400024414,-2008.2606201172,324.87072753906,43.535213470459,-1985.0811767578,296.29260253906,44.218101501465,-1984.4652099609,295.53314208984,44.00891494751,15000},
	{-1985.0811767578,296.29260253906,44.218101501465,-1984.4652099609,295.53314208984,44.00891494751,-2004.9931640625,230.1867980957,45.810199737549,-2005.5404052734,229.36964416504,45.629253387451,15000},
	{-2004.9931640625,230.1867980957,45.810199737549,-2005.5404052734,229.36964416504,45.629253387451,-2001.6365966797,-66.479103088379,52.630199432373,-2002.4720458984,-66.913261413574,52.29311370849,35000},
	{-2001.6365966797,-66.479103088379,52.630199432373,-2002.4720458984,-66.913261413574,52.29311370849,-2027.4392089844,-79.474502563477,49.957801818848,-2028.3255615234,-79.809112548828,49.63762283325,15000},
}
local ID = 0

function loadCamflight()
	ID = ID + 1
	if(ID <= #Camflight)then
		local x1,y1,z1,lx1,ly1,lz1 = Camflight[ID][1],Camflight[ID][2],Camflight[ID][3],Camflight[ID][4],Camflight[ID][5],Camflight[ID][6]
		local x2,y2,z2,lx2,ly2,lz2 = Camflight[ID][7],Camflight[ID][8],Camflight[ID][9],Camflight[ID][10],Camflight[ID][11],Camflight[ID][12]
		smoothMoveCamera(x1,y1,z1,lx1,ly1,lz1,x2,y2,z2,lx2,ly2,lz2,Camflight[ID][13])
		CamflightTimer = setTimer(loadCamflight,Camflight[ID][13],1)
	end
end

fadeCamera(true)

function loadAnmeldebereichStuff()
	ID = 0
	setElementDimension(localPlayer,0)
	setElementInterior(localPlayer,0)
	setCameraMatrix(-2008.8765869141,325.63018798828,43.744400024414,-2008.2606201172,324.87072753906,43.535213470459)
	loadCamflight()
end
loadAnmeldebereichStuff()
addEvent("loadAnmeldebereichStuff",true)
addEventHandler("loadAnmeldebereichStuff",root,loadAnmeldebereichStuff)

-- [[ DAS FENSTER ]] --

addEvent("Anmeldebereich.openWindow",true)
addEventHandler("Anmeldebereich.openWindow",root,function(type)
	if(not(isElement(GUIEditor.window[1])))then
		if(type == "Einloggen")then
			GUIEditor.window[1] = guiCreateWindow(391, 368, 442, 254, loc("Anmeldebereich_1"), false, "nocross")

			GUIEditor.label[1] = guiCreateLabel(10, 28, 422, 67, loc("Anmeldebereich_2"):format(Serverinfos.name), false, GUIEditor.window[1])
			GUIEditor.label[2] = guiCreateLabel(10, 105, 146, 28, loc("Anmeldebereich_3"), false, GUIEditor.window[1])
			GUIEditor.edit[1] = guiCreateEdit(166, 105, 266, 28, getPlayerName(localPlayer), false, GUIEditor.window[1])
			guiEditSetReadOnly(GUIEditor.edit[1], true)
			GUIEditor.label[3] = guiCreateLabel(10, 143, 146, 28, loc("Anmeldebereich_4"), false, GUIEditor.window[1])
			GUIEditor.edit[2] = guiCreateEdit(166, 143, 266, 28, "", false, GUIEditor.window[1])
			guiEditSetMasked(GUIEditor.edit[2],true)
			GUIEditor.button[1] = guiCreateButton(9, 215, 423, 29, type, false, GUIEditor.window[1])
			setWindowDatas(3,_,true)
			
			addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
				local edit = guiGetText(GUIEditor.edit[2])
				if(#edit >= 1)then
					triggerServerEvent("Anmeldebereich.server",localPlayer,edit,guiGetText(GUIEditor.button[1]))
				else infobox(loc("Anmeldebereich_5"),"error")end
			end,false)
		else
			GUIEditor.window[1] = guiCreateWindow(231, 290, 657, 315, loc("Anmeldebereich_6"), false,"nocross")

			GUIEditor.label[1] = guiCreateLabel(10, 28, 463, 76, loc("Anmeldebereich_7"):format(Serverinfos.name), false, GUIEditor.window[1])
			GUIEditor.label[2] = guiCreateLabel(10, 114, 177, 27, loc("Anmeldebereich_8"), false, GUIEditor.window[1])
			GUIEditor.label[3] = guiCreateLabel(10, 151, 177, 27, loc("Anmeldebereich_9"), false, GUIEditor.window[1])
			GUIEditor.label[4] = guiCreateLabel(10, 188, 463, 38, loc("Anmeldebereich_10"), false, GUIEditor.window[1])
			GUIEditor.label[5] = guiCreateLabel(10, 236, 177, 27, loc("Anmeldebereich_11"), false, GUIEditor.window[1])
			GUIEditor.edit[1] = guiCreateEdit(197, 114, 276, 27, getPlayerName(localPlayer), false, GUIEditor.window[1])
			guiEditSetReadOnly(GUIEditor.edit[1], true)
			GUIEditor.edit[2] = guiCreateEdit(197, 151, 276, 27, "", false, GUIEditor.window[1])
			guiEditSetMasked(GUIEditor.edit[2],true)
			GUIEditor.edit[3] = guiCreateEdit(197, 236, 276, 27, "", false, GUIEditor.window[1])
			GUIEditor.button[1] = guiCreateButton(10, 273, 463, 32, type, false, GUIEditor.window[1])
			GUIEditor.label[6] = guiCreateLabel(483, 28, 164, 76, loc("Anmeldebereich_12"), false, GUIEditor.window[1])
			GUIEditor.gridlist[1] = guiCreateGridList(483, 114, 164, 191, false, GUIEditor.window[1])
			ID = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Anmeldebereich_13"), 0.5)
			Sprache = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Anmeldebereich_14"), 0.5)    
			setWindowDatas(6,_,true)
			
			for i,v in ipairs(Languages)do
				local row = guiGridListAddRow(GUIEditor.gridlist[1])
				guiGridListSetItemText(GUIEditor.gridlist[1],row,ID,i,false,false)
				guiGridListSetItemText(GUIEditor.gridlist[1],row,Sprache,v,false,false)
			end
			
			addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
				local password = guiGetText(GUIEditor.edit[2])
				local clicked = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),2)
				local werber = guiGetText(GUIEditor.edit[3])
				if(#password >= 1 and clicked ~= "")then
					triggerServerEvent("Anmeldebereich.server",localPlayer,password,guiGetText(source),werber,clicked)
				else infobox(loc("Anmeldebereich_15"),"error")end
			end,false)
		end
	end
end)

-- [[ URINEFFEKT ]] --

addEvent("createUrin",true)
addEventHandler("createUrin",root,function(x,y,z,rot)
	local pissEffect = createEffect("coke_trail",x,y,z,0,0,rot)
	setTimer(function()
		destroyElement(pissEffect)
	end,7500,1)
end)