local Strength,Phase = 0,0
local screenSource = dxCreateScreenSource(x,y)
ErdbebenShader = dxCreateShader("Files/Shader/Erdbeben.fx")
ErdbebenRenderTarget = dxCreateRenderTarget(x,y,true)

function renderErdbeben()
	screenSource:update()
	ErdbebenShader:setValue("screenSource",screenSource)
	ErdbebenShader:setValue("Strength",Strength)
	dxSetRenderTarget(ErdbebenRenderTarget,true)
	dxDrawImage(0,0,x,y,ErdbebenShader)
	dxSetRenderTarget()
	dxDrawImage(0,0,x,y,ErdbebenRenderTarget)
end

function getShakeValue()
	Phase = Phase + 65*math.pi/256
	if(Phase >= 65*math.pi)then
		Phase = Phase-65*math.pi
	end
	return (math.sin(0.5*Phase)-0.5)/120
end

addEvent("createErdbeben",true)
addEventHandler("createErdbeben",root,function()
	Strength = 12
	addEventHandler("onClientHUDRender",root,renderErdbeben)
	setTimer(function()
		Strength = 0
		removeEventHandler("onClientHUDRender",root,renderErdbeben)
	end,15000,1)
end)