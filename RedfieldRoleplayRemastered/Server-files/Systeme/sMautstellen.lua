-- [[ SCHRANKEN ]] --

SF_TO_BAYSIDE1 = createObject(968,-2671.8999023438,1274.9000244141,55.099998474121,0,90,0)
SF_TO_BAYSIDE2 = createObject(968,-2673.3000488281,1274.9000244141,55.099998474121,0,90,180)
BAYSIDE_TO_SF1 = createObject(968,-2690.3999023438,1274.9000244141,55.099998474121,0,90,0)
BAYSIDE_TO_SF2 = createObject(968,-2691.1000976563,1274.9000244141,55.099998474121,0,90,180)
PDBRIDGE_TO_LV = createObject(968,-1658.3366699219,544.06451416016,38.013599395752,0,90,316)
PDBRIDGE_TO_SF = createObject(968,-1673.7727050781,547.53491210938,37.986000061035,0,90,138)
REDCOUNTY_TO_LS = createObject(968,-965.19537353516,-368.55899047852,36.080001831055,0,270,349)
REDCOUNTY_TO_SF = createObject(968,-977.84149169922,-359.60739135742,36.080001831055,0,270,168.7)
LSBRIDGE_TO_LS = createObject(968,52.119800567627,-1540.7475585938,4.9236001968384,0,90,82.74853515625)
LSBRIDGE_TO_SF = createObject(968,55.647899627686,-1522.9211425781,4.7635998725891,0,90,264.75)
BLUEBERRYACRES_TO_LV = createObject(968,-185.06109619141,274.10470581055,11.799200057983,0,270,344.5)
BLUEBERRYACRES_TO_LS = createObject(968,-201.08619689941,269.90908813477,11.799200057983,0,270,163.74536132813)
KIESGRUBE_TO_LV = createObject(968,612.30432128906,353.95401000977,18.62859916687,0,270,34)
KIESGRUBE_TO_SF = createObject(968,595.62628173828,352.77130126953,18.62859916687,0,270,214.74719238281)
LVKREUZ_TO_LV = createObject(968,1743.685546875,525.7802734375,27.432712554932,0,90,338)
LVKREUZ_TO_LS = createObject(968,1735.615234375,524.4130859375,27.657754898071,0,270,342)


-- [[ MARKER ]] --

Mautstellen = {
	{-2668.1000976563,1270.8000488281,54.299999237061,SF_TO_BAYSIDE1,"Golden Gate",-90,90},
	{-2677.1000976563,1270.8000488281,54.299999237061,SF_TO_BAYSIDE2,"Golden Gate",-90,90},
	{-2686.1000976563,1278,54.299999237061,BAYSIDE_TO_SF1,"Golden Gate",-90,90},
	{-2695,1278.1999511719,54.299999237061,BAYSIDE_TO_SF2,"Golden Gate",-90,90},
	{-1657.4422607422,539.59240722656,37.220699310303,PDBRIDGE_TO_LV,"PD-Bridge",-90,90},
	{-1674.6778564453,551.92327880859,37.220699310303,PDBRIDGE_TO_SF,"PD-Bridge",-90,90},
	{-969.71838378906,-370.46011352539,35.16849899292,REDCOUNTY_TO_LS,"Red County",90,-90},
	{-973.55432128906,-357.82290649414,35.16849899292,REDCOUNTY_TO_SF,"red County",90,-90},
	{49.990898132324,-1537.2181396484,3.9274001121521,LSBRIDGE_TO_LS,"LS-Bridge",-90,90},
	{57.911800384521,-1526.6710205078,3.9274001121521,LSBRIDGE_TO_SF,"LS-Bridge",-90,90},
	{-189.62550354004,272.67889404297,10.946499824524,BLUEBERRYACRES_TO_LV,"Blueberry Acres",90,-90},
	{-196.62539672852,271.30480957031,10.946499824524,BLUEBERRYACRES_TO_LS,"Blueberry Acres",90,-90},
	{610.58801269531,349.69030761719,17.780700683594,KIESGRUBE_TO_LV,"Kiesgrube",90,-90},
	{597.34259033203,357.21929931641,17.780700683594,KIESGRUBE_TO_SF,"Kiesgrube",90,-90},
	{1746.1235351563,522.0625,26.555999755859,LVKREUZ_TO_LV,"LV-Kreuz",-90,90},
	{1733.1804199219,528.04412841797,26.555999755859,LVKREUZ_TO_LS,"LV-Kreuz",90,-90},
}

-- [[ MARKER ERSTELLEN ]] --

for _,v in pairs(Mautstellen)do
	local marker = createMarker(v[1],v[2],v[3],"cylinder",5,0,0,0,0)
	
	addEventHandler("onMarkerHit",marker,function(player)
		if(getElementType(player) == "vehicle")then
			local player = getVehicleOccupant(player,0)
			if(getElementDimension(player) == getElementDimension(source))then
				if(getElementData(player,"Wanteds") >= 1)then
					for _,v in pairs(getElementsByType("player"))do
						if(getElementData(v,"loggedin") == 1)then
							if(isStateFaction(v))then
								outputChatBox(loc(v,"Systeme_280"):format(getPlayerName(player),v[5]),v,255,0,0)
							end
						end
					end
				end
				if(getElementData(v[4],"MautstelleMove") ~= true)then
					local price = getPlayerData("mautstellen","ID",1,"ZollkostenPreis")
					if(hasMoney(player,price))then
						setElementData(v[4],"MautstelleMove",true)
						takeMoney(player,price)
						local x,y,z = getElementPosition(v[4])
						local rot1,rot2 = v[6],v[7]
						moveObject(v[4],3500,x,y,z,0,rot1,0)
						setTimer(function(object,rot)
							local x,y,z = getElementPosition(object)
							moveObject(object,3500,x,y,z,0,rot2,0)
							setTimer(function(object)
								setElementData(object,"MautstelleMove",false)
							end,3500,1,object)
						end,10000,1,v[4],rot2)
						if(getPlayerData("business","Databasename","Mautstellen","Besitzer") ~= "Niemand")then
							addBizKasse("Mautstellen",price)
						end
					end
				end
			end
		end
	end)
end