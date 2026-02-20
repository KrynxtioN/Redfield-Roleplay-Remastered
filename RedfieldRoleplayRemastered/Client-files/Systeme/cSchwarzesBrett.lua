-- [[ DAS FENSTER ]] --

addEvent("SchwarzesBrett.windowOpen",true)
addEventHandler("SchwarzesBrett.windowOpen",root,function(text)
	if(isWindowOpen())then
        GUIEditor.window[1] = guiCreateWindow(479, 286, 299, 313, loc("Systeme_94"), false)
        GUIEditor.memo[1] = guiCreateMemo(10, 28, 279, 275, text, false, GUIEditor.window[1])
        guiMemoSetReadOnly(GUIEditor.memo[1], true)
		setWindowDatas()
	end
end)