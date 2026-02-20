-- [[ TABELLEN ]] --

local Types = {
	["Klamotten"] = {"CJ_19","CJ_20","skinshop","Skinshop"},
	["Haare"] = {"CJ_21","CJ_22","friseur","Friseur"},
	["Tattoos"] = {"CJ_23","CJ_24","tattoostudio","Tattoostudio"},
}

-- [[ ARTIKEL KAUFEN ]] --

addEvent("CJSkinshop.add",true)
addEventHandler("CJSkinshop.add",root,function(texture,model,id)
	if(getElementModel(client) == 0)then
		local ShopType = getElementData(client,"CJShopType")
		local lager = getPlayerData(Types[ShopType][3],"ID",getElementDimension(client),texture)
		if(getPlayerData("business","Databasename",Types[ShopType][4]..getElementDimension(client),"Besitzer") ~= "Niemand")then
			if(lager < 1)then
				infobox(client,loc(client,Types[ShopType][1]),"error")
				return false
			end
		end
		local preis = tonumber(getPlayerData(Types[ShopType][3],"ID",getElementDimension(client),texture.."Preis"))
		if(hasMoney(client,preis))then
			addPedClothes(client,texture,model,id)
			CJSkinshop.saveClothes(client)
			takeMoney(client,preis)
			infobox(client,loc(client,Types[ShopType][2]),"info")
			if(getPlayerData("business","Databasename",Types[ShopType][4]..getElementDimension(client),"Besitzer") ~= "Niemand")then
				dbExec(handler,"UPDATE "..Types[ShopType][3].." SET "..texture.." = '"..lager - 1 .."' WHERE ID = '"..getElementDimension(client).."'")
				addBizKasse(Types[ShopType][4]..getElementDimension(client),preis)
			end
			if(getElementData(client,"TutorialTask") == 8)then Tutorial.aufgabeErledigt(client) end
			setPlayerAchievement(client,3)
			outputLog(getPlayerName(client).." hat sich für $"..preis.." "..texture.."|"..model.." im CJ-Shop gekauft.","CJ")
		end
	else infobox(client,loc(client,"CJ_25"),"error")end
end)

-- [[ SHOPDATEN KRIEGEN ]] --

addEvent("CJSkinshop.getDatas",true)
addEventHandler("CJSkinshop.getDatas",root,function(type)
	local ShopType = getElementData(client,"CJShopType")
	local tbl = {}
	
	for _,v in pairs(CJSkinshop[type])do
		table.insert(tbl,{v[1],v[2],v[3],getPlayerData(Types[ShopType][3],"ID",getElementDimension(client),v[1]),getPlayerData(Types[ShopType][3],"ID",getElementDimension(client),v[1].."Preis"),getPlayerData(Types[ShopType][3],"ID",getElementDimension(client),v[1])})
	end
	triggerClientEvent(client,"CJSkinshop.setDatas",client,tbl)
end)

-- [[ KLAMOTTEN SPEICHERN ]] --

function CJSkinshop.saveClothes(player)
	local texture = ""
	local model = ""
	for i = 0,17,1 do
		local clothesTexture,clothesModel = getPedClothes(player,i)
		if(clothesTexture ~= false)then
			texture = texture..clothesTexture.."|"
			model = model..clothesModel.."|"
		else
			texture = texture.." |"
			model = model.." |"
		end
	end
	dbExec(handler,"UPDATE accounts SET ClothesTexture = '"..texture.."', ClothesModel = '"..model.."' WHERE Username = '"..getPlayerName(player).."'")
end

-- [[ SPIELER KLAMOTTEN ANZIEHEN ]] --

function CJSkinshop.setClothes(player)
	if(getElementModel(player) == 0)then
		local clothesTexture = getPlayerData("accounts","Username",getPlayerName(player),"ClothesTexture")
		local clothesModel = getPlayerData("accounts","Username",getPlayerName(player),"ClothesModel")
		for i = 0,17,1 do
			local wstring1 = gettok(clothesTexture,i + 1,string.byte("|"))
			local wstring2 = gettok(clothesModel,i + 1,string.byte("|"))
			if(wstring1 ~= " " and wstring2 ~= " ")then
				addPedClothes(player,wstring1,wstring2,i)
			end
		end
		setPedStat(player,23,getElementData(player,"Muskeln"))
		setPedStat(player,21,getElementData(player,"Fett"))
	end
end