-- [[ LOGS ]] --

local LogPath = "XML/"

function outputLog(text,logname)
	local date = DatumUhrzeit()
	if(not(logname))then logname = "allround" end
	logname = logname..".xml"
	log = getLog(LogPath..logname)
	fileSetPos(log,fileGetSize(log))
	fileWrite(log,date[1].."."..date[2].."."..date[3].." - "..date[4]..":"..date[5]..":"..date[6]..": "..text.."\n")
	fileClose(log)
end

function getLog(path)
	if(not(fileExists(path)))then
		fileClose(fileCreate(path))
	end
	return fileOpen(path,false)
end