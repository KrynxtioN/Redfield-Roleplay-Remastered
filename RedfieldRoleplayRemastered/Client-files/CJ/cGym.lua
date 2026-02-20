-- [[ MUSKELN UND FETT AKTUELL HALTEN ]] --

function Gym.dxDraw()
	Information.dxDraw(loc("CJ_5").."\n"..loc("CJ_6")..": "..getElementData(localPlayer,"Muskeln").."/1000 - "..loc("CJ_7").." "..getElementData(localPlayer,"Fett").."/1000","create")
end

-- [[ DIE MUSKELANZEIGE EINBLENDEN / AUSBLENDEN ]] --

addEvent("Gym.dxDraw",true)
addEventHandler("Gym.dxDraw",root,function(type)
	if(type == "create")then
		Information.dxDraw(loc("CJ_5").."\n"..loc("CJ_6")..": "..getElementData(localPlayer,"Muskeln").."/1000 - "..loc("CJ_7").." "..getElementData(localPlayer,"Fett").."/1000","create")
		addEventHandler("onClientRender",root,Gym.dxDraw)
	else
		Information.dxDraw(_,"destroy")
		removeEventHandler("onClientRender",root,Gym.dxDraw)
	end
end)