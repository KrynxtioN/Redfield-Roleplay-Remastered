-- [[ MOD LADEN ]] --

AstronautTXD = engineLoadTXD("Files/Mods/Astronaut.txd")
engineImportTXD(AstronautTXD,9)
AstronautDFF = engineLoadDFF("Files/Mods/Astronaut.dff")
engineReplaceModel(AstronautDFF,9)

SpitzhackeTXD = engineLoadTXD("Files/Mods/Spitzhacke.txd")
engineImportTXD(SpitzhackeTXD,336)
SpitzhackeDFF = engineLoadDFF("Files/Mods/Spitzhacke.dff")
engineReplaceModel(SpitzhackeDFF,336)

-- [[ TEXTUREN ]] --

function Moon.loadShader()
	if(fileExists("Files/Shader/Shader.fx"))then
		Moon.MyShader = dxCreateShader("Files/Shader/Shader.fx")
		Moon.MyTexture = dxCreateTexture("Files/Shader/Images/Moon.png")
		dxSetShaderValue(Moon.MyShader,"Tex0",Moon.MyTexture)
	else setTimer(Moon.loadShader,1000,1)end
end
setTimer(Moon.loadShader,5000,1)

-- [[ DAS FENSTER ]] --

addEvent("Moon.openWindow",true)
addEventHandler("Moon.openWindow",root,function(type)
	if(isWindowOpen())then
        GUIEditor.window[1] = guiCreateWindow(500, 262, 339, 134, loc("Nebenjobs_10"), false)

        GUIEditor.label[1] = guiCreateLabel(10, 28, 320, 58, loc("Nebenjobs_11"), false, GUIEditor.window[1])
        GUIEditor.button[1] = guiCreateButton(10, 96, 320, 28, loc("Nebenjobs_12"), false, GUIEditor.window[1])
		setWindowDatas(1)
		
		if(type == 2)then
			guiSetText(GUIEditor.label[1],loc("Nebenjobs_13"))
			guiSetText(GUIEditor.button[1],loc("Nebenjobs_14"))
		end
		
		addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
			triggerServerEvent("Moon.startRocket",localPlayer,guiGetText(source))
		end,false)
	end
end)

-- [[ TEXTUREN LADEN ]] --

function Moon.addTextures(objects)
	if(Moon.MyShader)then
		if(#objects >= 1)then
			for _,v in pairs(objects)do
				if(getElementModel(v[1]) == 16118)then
					engineApplyShaderToWorldTexture(Moon.MyShader,"des_redrock1",v[1])
					engineApplyShaderToWorldTexture(Moon.MyShader,"des_redrock2",v[1])
				elseif(getElementModel(v[1]) == 6959)then
					engineApplyShaderToWorldTexture(Moon.MyShader,"greyground256128",v[1])
				end
			end
		end
	else
		setTimer(function(objects)
			Moon.addTextures(objects)
		end,1000,1,objects)
	end
end
addEvent("Moon.addTextures",true)
addEventHandler("Moon.addTextures",root,Moon.addTextures)

-- [[ RAKETENSTART ]] --
function Moon.raketenStart(type)
	if(isElement(Moon.smokeEffect))then destroyElement(Moon.smokeEffect)end
	if(isTimer(Moon.smokeEffectTimer))then killTimer(Moon.smokeEffectTimer)end
	if(type)then
		local x,y,z = getElementPosition(localPlayer)
		Moon.smokeEffect = createEffect("riot_smoke",x,y,z)
		attachEffect(Moon.smokeEffect,localPlayer,Vector3(0,4,4))
		
		Moon.smokeEffectTimer = setTimer(function()
			Moon.raketenStart("create")
		end,10000,1)
	end
end
addEvent("Moon.raketenStart",true)
addEventHandler("Moon.raketenStart",root,Moon.raketenStart)

-- [[ MOON FEELING ]] --
addEvent("Moon.activateFeeling",true)
addEventHandler("Moon.activateFeeling",root,function(type)
	if(type == "create")then
		setSkyGradient(0,0,0)
	else
		resetSkyGradient()
	end
end)

-- [[ SPITZHACKENSOUND ]] --
addEvent("Moon.sound",true)
addEventHandler("Moon.sound",root,function(type)
	if(isTimer(Moon.soundTimer))then killTimer(Moon.soundTimer)end
	if(type)then
		Moon.soundTimer = setTimer(function()
			playSound("Files/Sounds/Spitzhacke.wav")
		end,1000,15)
	end
end)

-- [[ BLIP ]] --

addEvent("Moon.createBlip",true)
addEventHandler("Moon.createBlip",root,function(type,x,y,z)
	if(isElement(Moon.blip))then destroyElement(Moon.blip)end
	if(type)then
		Moon.blip = createBlip(x,y,z,0,2,255,0,0)
	end
end)