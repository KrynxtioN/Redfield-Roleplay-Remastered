local filepaths = {}
local fileamounts = 0
local downloadcounter = 1

function drawDownloadProgress()
	if(isWindowOpen())then
        dxDrawRectangle(565*(x/1440), 801*(y/900), 310*(x/1440), 28*(y/900), tocolor(0, 0, 0, 255), false)
        dxDrawRectangle(565*(x/1440), 801*(y/900), 310*(x/1440), 28*(y/900), tocolor(0, 255, 0, 255), false)
        dxDrawText(downloadcounter.."/"..fileamounts.." Dateien heruntergeladen.", 565*(x/1440), 801*(y/900), 875*(x/1440), 829*(y/900), tocolor(0, 0, 0, 255), 1.30*(x/1440), "default-bold", "center", "center", false, false, false, false, false)
	end
end

function loadNextFile_Bonus(fileName)
	if(fileName == filepaths[downloadcounter])then
		if(downloadcounter < fileamounts)then
			downloadcounter = downloadcounter + 1
			downloadFile(filepaths[downloadcounter])
		else
			removeEventHandler("onClientFileDownloadComplete",root,loadNextFile_Bonus)
			removeEventHandler("onClientRender",root,drawDownloadProgress)
		end
	end
end

addEvent("downloadFiles_Bonus",true)
addEventHandler("downloadFiles_Bonus",root,function(filepathsarray)
	fileamounts = #filepathsarray
	for i = 1,fileamounts do
		filepaths[i] = filepathsarray[i]
	end
	addEventHandler("onClientFileDownloadComplete",root,loadNextFile_Bonus)
	addEventHandler("onClientRender",root,drawDownloadProgress)
	downloadFile(filepaths[downloadcounter])
end)

addEventHandler("onClientResourceStart",getResourceRootElement(getThisResource()),function()
	triggerServerEvent("clientLoadedResource_Bonus",localPlayer)
end)