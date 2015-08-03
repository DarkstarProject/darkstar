-----------------------------------
--
-- Zone: Quicksand_Caves (208)
--
-----------------------------------
package.loaded["scripts/zones/Quicksand_Caves/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/zone");
require("scripts/zones/Quicksand_Caves/TextIDs");

base_id = 17629685;

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)

    local tomes = {17629766,17629767,17629768,17629769,17629770,17629771};
    
    SetGroundsTome(tomes);

	-- Weight Door System (RegionID, X, Radius, Z)
	zone:registerRegion(1,   -15, 5, -60, 0,0,0); -- 0x010D01EF Door
	zone:registerRegion(3, 	  15, 5,-180, 0,0,0); -- 0x010D01F1 Door
	zone:registerRegion(5, 	-580, 5,-420, 0,0,0); -- 0x010D01F3 Door
	zone:registerRegion(7, 	-700, 5,-420, 0,0,0); -- 0x010D01F5 Door
	zone:registerRegion(9, 	-700, 5,-380, 0,0,0); -- 0x010D01F7 Door
	zone:registerRegion(11, -780, 5,-460, 0,0,0); -- 0x010D01F9 Door
	zone:registerRegion(13, -820, 5,-380, 0,0,0); -- 0x010D01FB Door
	zone:registerRegion(15, -260, 5, 740, 0,0,0); -- 0x010D01FD Door
	zone:registerRegion(17, -340, 5, 660, 0,0,0); -- 0x010D01FF Door
	zone:registerRegion(19, -420, 5, 740, 0,0,0); -- 0x010D0201 Door
	zone:registerRegion(21, -340, 5, 820, 0,0,0); -- 0x010D0203 Door
	zone:registerRegion(23, -409, 5, 800, 0,0,0); -- 0x010D0205 Door
	zone:registerRegion(25, -400, 5, 670, 0,0,0); -- 0x010D0207 Door
	
	--[[ -- (Old)
	zone:registerRegion(1,-18,-1, -62,-13,1, -57);
	zone:registerRegion(3, 13,-1, -183, 18,1, -177);
	zone:registerRegion(5,-583,-1,-422,-577,1,-418);
	zone:registerRegion(7,-703,-1,-423,-697,1,-417);
	zone:registerRegion(9,-703,-1,-383,-697,1,-377);
	zone:registerRegion(11,-782,-1,-462,-777,1,-457);
	zone:registerRegion(13,-823,-1,-383,-817,1,-377);
	zone:registerRegion(15,-262,-1, 737,-257,1, 742);
	zone:registerRegion(17,-343,-1, 657,-337,1, 662);
	zone:registerRegion(19,-343,-1, 818,-337,1, 822);
	zone:registerRegion(21,-411,-1, 797,-406,1, 803);
	zone:registerRegion(23,-422,-1, 737,-417,1, 742);
	zone:registerRegion(25,-403,-1, 669,-397,1, 674);
	]]--
	
	-- Hole in the Sand
	zone:registerRegion(30,495,-9,-817,497,-7,-815); 	-- E-11 (Map 2)
	zone:registerRegion(31,815,-9,-744,817,-7,-742); 	-- M-9 (Map 2)
	zone:registerRegion(32,215,6,-17,217,8,-15); 		-- K-6 (Map 3)
	zone:registerRegion(33,-297,6,415,-295,8,417); 		-- E-7 (Map 6)
	zone:registerRegion(34,-137,6,-177,-135,8,-175); 	-- G-7 (Map 8)
	
	SetServerVariable("BastokFight8_1" ,0);
	SetServerVariable("Bastok8-1LastClear", os.time()-QM_RESET_TIME); -- Set a delay on ??? mission NM pop.
    
    UpdateTreasureSpawnPoint(17629735);

end;

-----------------------------------		
-- onConquestUpdate		
-----------------------------------		

function onConquestUpdate(zone, updatetype)
    local players = zone:getPlayers();
    
    for name, player in pairs(players) do
        conquestUpdate(zone, player, updatetype, CONQUEST_BASE);
    end
end;

-----------------------------------		
-- onZoneIn		
-----------------------------------		

function onZoneIn(player,prevZone)		
	local cs = -1;	
	if ((player:getXPos() == 0) and (player:getYPos() == 0) and (player:getZPos() == 0)) then	
		player:setPos(-980.193,14.913,-282.863,60);
	end	
	return cs;	
end;		

-----------------------------------		
-- onRegionEnter		
-----------------------------------		

function onRegionEnter(player,region)
	
	local RegionID = region:GetRegionID();	
	
	if (RegionID >= 30) then
		switch (RegionID): caseof
		{
			[30] = function (x)
			player:setPos(496,-6,-816);
			end,
			[31] = function (x)
			player:setPos(816,-6,-743);
			end,
			[32] = function (x)
			player:setPos(216,9,-16);
			end,
			[33] = function (x)
			player:setPos(-296,9,416);
			end,
			[34] = function (x)
			player:setPos(-136,9,-176);
			end,
		}
	else
		local race = player:getRace();
		 printf("entering region %u",RegionID);
		
		if (race == 8) then -- Galka
			weight = 3;
		elseif (race == 5 or race == 6) then -- Taru male or female
			weight = 1;
		else -- Hume/Elvaan/Mithra
			weight = 2;
		end
		
		local varname = "[DOOR]Weight_Sensor_"..RegionID;
		w = GetServerVariable(varname);
		w = w + weight;
		SetServerVariable(varname,w);
		
		if (player:hasKeyItem(2051) or w >= 3) then
			local door = GetNPCByID(base_id + RegionID - 1);
			door:openDoor(15); -- open door with a 15 second time delay.
			--platform = GetNPCByID(base_id + RegionID + 1);
			--platform:setAnimation(8); -- this is supposed to light up the platform but it's not working. Tried other values too.
		end
	end
	
end;

-----------------------------------		
-- OnRegionLeave		
-----------------------------------		

function onRegionLeave(player,region)

	local RegionID = region:GetRegionID();
	
	if (RegionID < 30) then
		local race = player:getRace();
		-- printf("exiting region %u",RegionID);
		
		if (race == 8) then -- Galka
			weight = 3;
		elseif (race == 5 or race == 6) then -- Taru male or female
			weight = 1;
		else -- Hume/Elvaan/Mithra
			weight = 2;
		end;
		local varname = "[DOOR]Weight_Sensor_"..RegionID;
		w = GetServerVariable(varname);
		lastWeight = w;
		w = w - weight;
		SetServerVariable(varname,w);
		
		if (lastWeight >= 3 and w < 3) then
			--platform = GetNPCByID(base_id + RegionID + 1);
			--platform:setAnimation(9);
		end
	end
	
end;

-----------------------------------	
-- onEventUpdate	
-----------------------------------	

function onEventUpdate(player,csid,option)	
	--printf("CSID: %u",csid);
	--printf("RESULT: %u",option);
end;	

-----------------------------------	
-- onEventFinish	
-----------------------------------	

function onEventFinish(player,csid,option)	
	--printf("CSID: %u",csid);
	--printf("RESULT: %u",option);
end;	
