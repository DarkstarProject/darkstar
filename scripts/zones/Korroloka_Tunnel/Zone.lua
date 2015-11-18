-----------------------------------
--
-- Zone: Korroloka_Tunnel (173)
--
-----------------------------------
package.loaded["scripts/zones/Korroloka_Tunnel/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/zone");
require("scripts/zones/Korroloka_Tunnel/TextIDs");

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)
    local tomes = {17486258,17486259,17486260,17486261};

    SetGroundsTome(tomes);
    
    -- Waterfalls (RegionID, X, Radius, Z)
	zone:registerRegion(1,   -87, 4, -105, 0,0,0); -- Left pool
	zone:registerRegion(2, 	-101, 7, -114, 0,0,0); -- Center Pool
	zone:registerRegion(3, 	-112, 3, -103, 0,0,0); -- Right Pool
    
end;

-----------------------------------
-- onZoneIn
-----------------------------------

function onZoneIn(player,prevZone)
    local cs = -1;
    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(-500,-21.824,0.358,60);
    end
    return cs;
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
-- onRegionEnter
-----------------------------------

function onRegionEnter(player,region)
    local pooltime = (os.time() - player:getVar("POOL_TIME"));
    
    if player:getVar("BathedInScent") == 1 then  -- pollen scent from touching all 3 Blue Rafflesias in Yuhtunga
        switch (region:GetRegionID()): caseof
        {
            [1] = function (x)  -- Left Pool
                player:messageSpecial(ENTERED_SPRING);
                player:setLocalVar("POOL_TIME", os.time());
            end,
            [2] = function (x)  -- Center Pool
                player:messageSpecial(ENTERED_SPRING);
                player:setLocalVar("POOL_TIME", os.time());
            end,
            [3] = function (x)  -- Right pool
                player:messageSpecial(ENTERED_SPRING);
                player:setLocalVar("POOL_TIME", os.time());
            end,
        }
    end
end;
    


-----------------------------------		
-- OnRegionLeave		
-----------------------------------		

function onRegionLeave(player,region)

	local RegionID = region:GetRegionID();
	local pooltime = (os.time() - player:getLocalVar("POOL_TIME"));
    
	if(RegionID <= 3 and player:getVar("BathedInScent") == 1) then
        if pooltime >= 300 then
            player:messageSpecial(LEFT_SPRING_CLEAN);
            player:setLocalVar("POOL_TIME", 0);
            player:setVar("BathedInScent", 0);
        else
            player:messageSpecial(LEFT_SPRING_EARLY);
            player:setLocalVar("POOL_TIME", 0);
        end
    end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;