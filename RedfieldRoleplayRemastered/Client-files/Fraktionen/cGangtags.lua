-- [[ TEXTUREN LADEN ]] --

addEvent("Gangtags.loadTextures",true)
addEventHandler("Gangtags.loadTextures",root,function(object,name)
	local MyShader = dxCreateShader("Files/Shader/Shader.fx")
	local MyTexture = dxCreateTexture("Files/Images/Gangtags/"..name..".png")
	dxSetShaderValue(MyShader,"Tex0",MyTexture)
	engineApplyShaderToWorldTexture(MyShader,"cj_don_post_2",object)
end)