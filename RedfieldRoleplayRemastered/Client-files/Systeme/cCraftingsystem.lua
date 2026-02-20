-- [[ DAS FENSTER ]] --

addEvent("Craftingsystem.openWindow",true)
addEventHandler("Craftingsystem.openWindow",root,function()
    GUIEditor.window[1] = guiCreateWindow(408, 229, 493, 311, loc("Systeme_124"), false)

    GUIEditor.gridlist[1] = guiCreateGridList(10, 27, 220, 274, false, GUIEditor.window[1])
    item = guiGridListAddColumn(GUIEditor.gridlist[1], loc("Systeme_125"), 0.9)
    GUIEditor.button[1] = guiCreateButton(240, 273, 243, 28, loc("Systeme_126"), false, GUIEditor.window[1])
	setWindowDatas(_,_,true)
		
	for _,v in pairs(Craftingsystem["Items"])do
		local row = guiGridListAddRow(GUIEditor.gridlist[1])
		guiGridListSetItemText(GUIEditor.gridlist[1],row,item,v,false,false)
	end
		
	addEventHandler("onClientGUIClick",GUIEditor.gridlist[1],function()
		local clicked = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),1)
		if(clicked ~= "")then
			for i = 1,#Craftingsystem["Craftingitems"][clicked] do
				local tbl = Craftingsystem["PicturePositions"][i]
				GUIEditor.staticimage[i] = guiCreateStaticImage(tbl[1],tbl[2],tbl[3],tbl[4],"Files/Images/Inventar/"..Craftingsystem["Craftingitems"][clicked][i][1]..".png",false,GUIEditor.window[1])
				GUIEditor.label[i] = guiCreateLabel(tbl[1],tbl[2],tbl[3],tbl[4],Craftingsystem["Craftingitems"][clicked][i][2].."x",false,GUIEditor.window[1])
			end
			setWindowDatas(#Craftingsystem["Craftingitems"][clicked],_,true)
		end
	end,false)
	
	addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
		local clicked = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),1)
		if(clicked ~= "")then
			triggerServerEvent("Craftingsystem.server",localPlayer,clicked)
		else infobox(loc("Systeme_127"),"error")end
	end,false)
end)