-- [[ SPRUNK-DATAS SETZEN ]] --

addEvent("Sprunk.refreshTable",true)
addEventHandler("Sprunk.refreshTable",root,function(dosen,preis)
	Sprunk.dosen = dosen
	Sprunk.preis = preis
end)