-----------------------------------
--
-- Zone: Promyvion-Mea (20)
--
-----------------------------------
 package.loaded["scripts/zones/Promyvion-Mea/TextIDs"] = nil;
----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/missions");
require("scripts/zones/Promyvion-Mea/TextIDs");

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)

    --                      -96,0,174,155              -- Level One Start
    zone:registerRegion(11,-122,-4,197,-117,4,202);    -- Level One Return
    zone:registerRegion(12,-283,-4,237,-276,4,242);    -- Level One MR

    --                      -70,0,-233,105             -- Level Two Start
    zone:registerRegion(21,-1,-4,-121,2,4,-118);       -- Level Two Return
    zone:registerRegion(22,-82,-4,-42,-78,4,-38);      -- Level Two MR1
    zone:registerRegion(23,-322,-4,-361,-318,4,-357);  -- Level Two MR2
    zone:registerRegion(24,-42,-4,-321,-37,4,-317);    -- Level Two MR3
    zone:registerRegion(25,77,-4,-241,81,4,-238);      -- Level Two MR4

    --                      -167,0,172,38              -- Level Three West Start
    zone:registerRegion(31,-161,-4,158,-157,4,161);    -- Level Three West Return
    zone:registerRegion(32,-42,-4,-2,-38,4,2);         -- Level Three West MR1  no receptacle
    zone:registerRegion(33,-241,-4,-42,-238,4,-37);    -- Level Three West MR2
    zone:registerRegion(34,-321,-4,-42,-318,4,-38);    -- Level Three West MR3

    --                      68,0,-76,254               -- Level THREE East Start
    zone:registerRegion(35,158,-4,-281,161,4,-278);    -- Level Three East Return
    zone:registerRegion(36,240,-4,-322,244,4,-317);    -- Level Three East MR1 OKK
    zone:registerRegion(37,198,-4,-2,201,4,2);         -- Level Three East MR2 no receptacle
    zone:registerRegion(38,358,-4,-41,362,4,-38);      -- Level Three East MR3

    --                      -106,0,384,38              -- Level FOUR Start
    zone:registerRegion(41,-82,-4,358,-78,4,361);      -- Level Four Return

end;

 -----------------------------------
 -- onZoneIn
 -----------------------------------

function onZoneIn(player,prevZone)
    local cs = -1;

    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(-93.268, 0, 170.749, 162); -- Floor 1 {R}
    end

    if (player:getCurrentMission(COP) == BELOW_THE_ARKS and player:getVar("PromathiaStatus") == 2) then
        player:completeMission(COP,BELOW_THE_ARKS);
        player:addMission(COP,THE_MOTHERCRYSTALS); -- start mission 1.3
        player:setVar("PromathiaStatus",0);
    elseif (player:getCurrentMission(COP) == THE_MOTHERCRYSTALS) then
        if (player:hasKeyItem(LIGHT_OF_HOLLA) and player:hasKeyItem(LIGHT_OF_DEM)) then
            if (player:getVar("cslastpromy") == 1) then
                player:setVar("cslastpromy",0)
                cs = 0x0034;
            end
        elseif (player:hasKeyItem(LIGHT_OF_HOLLA) or player:hasKeyItem(LIGHT_OF_DEM)) then
            if (player:getVar("cs2ndpromy") == 1) then
                player:setVar("cs2ndpromy",0)
                cs = 0x0033;
            end
        end
    end

    if (player:getVar("FirstPromyvionMea") == 1) then
        cs = 0x0032;
    elseif (ENABLE_COP_ZONE_CAP == 1) then
        player:addStatusEffect(EFFECT_LEVEL_RESTRICTION,30,0,0);-- ZONE LEVEL RESTRICTION
    end

     return cs;
end;

-----------------------------------
-- onRegionEnter
-----------------------------------

function onRegionEnter(player,region)
    if (player:getAnimation() == 0) then
        switch (region:GetRegionID()): caseof
        {
            [11] = function (x)
                player:startEvent(0x002e);
            end,
            [12] = function (x)
                if (GetNPCByID(16859453):getAnimation() == 8) then
                    player:startEvent(30);
                end
            end, -- player:setPos(-70,0,-233,105);
            [21] = function (x)
                player:startEvent(41); -- player:setPos(-96,0,174,155);
            end,
            [22] = function (x)
                if (GetNPCByID(16859456):getAnimation() == 8) then
                    if (player:getVar("MemoryReceptacle") == 2) then
                        player:startEvent(37); -- player:setPos(-167,0,172,38);
                    else
                        player:startEvent(33); -- player:setPos(68,0,-76,254);
                    end
                end
            end,
            [23] = function (x)
                if (GetNPCByID(16859460):getAnimation() == 8) then
                    if (player:getVar("MemoryReceptacle") == 2) then
                        player:startEvent(37); -- player:setPos(-167,0,172,38);
                    else
                        player:startEvent(33); -- player:setPos(68,0,-76,254);
                    end
                end
            end,
            [24] = function (x)
                if (GetNPCByID(16859461):getAnimation() == 8) then
                    if (player:getVar("MemoryReceptacle") == 2) then
                        player:startEvent(37); -- player:setPos(-167,0,172,38);
                    else
                        player:startEvent(33); -- player:setPos(68,0,-76,254);
                    end
                end
            end,
            [25] = function (x)
                if (GetNPCByID(16859462):getAnimation() == 8) then
                    if (player:getVar("MemoryReceptacle") == 2) then
                        player:startEvent(37); -- player:setPos(-167,0,172,38);
                    else
                        player:startEvent(33); -- player:setPos(68,0,-76,254);
                    end
                end
            end,
            [31] = function (x)
                player:startEvent(30); -- player:setPos(-70,0,-233,105);
            end,
            [32] = function (x)
                player:startEvent(31); -- player:setPos(-106,0,384,38);
            end,
            [33] = function (x)
                if (GetNPCByID(16859455):getAnimation() == 8) then
                    player:startEvent(31); -- player:setPos(-106,0,384,38);
                end
            end,
            [34] = function (x)
                if (GetNPCByID(16859454):getAnimation() == 8) then
                    player:startEvent(31); -- player:setPos(-106,0,384,38);
                end
            end,
            [35] = function (x)
                player:startEvent(30); -- player:setPos(-70,0,-233,105);
            end,
            [36] = function (x)
                if (GetNPCByID(16859463):getAnimation() == 8) then
                    player:startEvent(31); -- player:setPos(-106,0,384,38);
                end
            end,
            [37] = function (x)
                if (GetNPCByID(16859458):getAnimation() == 8) then
                    player:startEvent(31); -- player:setPos(-106,0,384,38);
                end
            end,
            [38] = function (x)
                if (GetNPCByID(16859459):getAnimation() == 8) then
                    player:startEvent(31); -- player:setPos(-106,0,384,38);
                end
            end,
            [41] = function (x)
                if (player:getVar("MemoryReceptacle") == 2) then
                    player:startEvent(37); -- player:setPos(-167,0,172,38);
                else
                    player:startEvent(33); -- player:setPos(68,0,-76,254);
                end
            end,
        }
    end
end;

-----------------------------------
-- onRegionLeave
-----------------------------------

function onRegionLeave(player,region)
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,region)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 0x002e and option == 1) then
        player:setPos(279.988, -86.459, -25.994, 63, 14); -- To Hall of Transferance {R}
    elseif (csid == 0x0032) then
        player:setVar("FirstPromyvionMea",0);
        if (ENABLE_COP_ZONE_CAP == 1) then
            player:addStatusEffect(EFFECT_LEVEL_RESTRICTION,30,0,0); -- ZONE LEVEL RESTRICTION
        end
    end

    if (option == 1) then
        player:setVar("MemoryReceptacle",0);
    end

 end;