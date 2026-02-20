-- [[ MOD LADEN ]] --

function loadAlligatorMod()
	if(fileExists("Files/Mods/Alligator.dff"))then
		AlligatorTXD = engineLoadTXD("Files/Mods/Alligator.txd")
		engineImportTXD(AlligatorTXD,262)
		AlligatorDFF = engineLoadDFF("Files/Mods/Alligator.dff")
		engineReplaceModel(AlligatorDFF,262)
	else
		setTimer(loadAlligatorMod,1000,1)
	end
end
setTimer(loadAlligatorMod,5000,1)