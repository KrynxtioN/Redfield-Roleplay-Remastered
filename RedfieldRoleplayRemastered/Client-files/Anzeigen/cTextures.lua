-- [[ SHADER NAMEN ]] --

local Textures = {"kmb_atm_sign","veding1_64","veding2_64"}

-- [[ SHADER LADEN UND TEXTUREN ANWENDEN ]] --

function loadTextures()
	if(fileExists("Files/Images/Textures/veding2_64.png") and fileExists("Files/Shader/Shader.fx"))then
		for _,v in pairs(Textures)do
			local MyShader = dxCreateShader("Files/Shader/Shader.fx")
			local MyTexture = dxCreateTexture("Files/Images/Textures/"..v..".png")
			dxSetShaderValue(MyShader,"Tex0",MyTexture)
			engineApplyShaderToWorldTexture(MyShader,v)
		end
	else
		setTimer(loadTextures,1000,1)
	end
end
setTimer(loadTextures,1000,1)