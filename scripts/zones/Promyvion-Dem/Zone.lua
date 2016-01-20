-----------------------------------
--
-- Zone: Promyvion-Dem (18)
--
-----------------------------------
package.loaded["scripts/zones/Promyvion-Dem/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/missions");
require("scripts/zones/Promyvion-Dem/TextIDs");

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)

    --
    zone:registerRegion(11,157,-4,-82,161,4,-77);       -- Level 1  Return
    zone:registerRegion(12,117,-4,-283,122,4,-277);     -- Level 1   MR
    --
    zone:registerRegion(21,-383,-4,-2,-278,4,2);        -- Level Two Return
    zone:registerRegion(22,-82,-4,76,-77,4,80);         -- Level Two MR1
    zone:registerRegion(23,-361,-4,36,-356,4,42);       -- Level Two MR2
    zone:registerRegion(24,-83,-4,-83,-77,4,-76);       -- Level Two MR3
    zone:registerRegion(25,-282,-4,-202,-277,4,-196);   -- Level Two MR4
    --
    zone:registerRegion(31,-160,-4,437,-157,4,441);     -- Level Three West Return
    zone:registerRegion(32,-42,-4,317,-37,4,322);       -- Level Three West MR1
    zone:registerRegion(33,-322,-4,156,-316,4,162);     -- Level Three West MR2
    zone:registerRegion(34,-122,-4,157,-118,4,163);     -- Level Three West MR3
    --
    zone:registerRegion(35,-2,-4,-322,2,4,-317);        -- Level Three East Return
    zone:registerRegion(36,37,-4,-203,43,4,-198);       -- Level Three East MR1
    zone:registerRegion(37,-122,-4,-242,-116,4,-237);   -- Level Three East MR2
    zone:registerRegion(38,-122,-4,-402,-116,4,-396);   -- Level Three East MR3
    --
    zone:registerRegion(41,357,-4,237,361,4,242);       -- Level Four Return

end;

-----------------------------------
-- onZoneIn
-----------------------------------

function onZoneIn(player,prevZone)
    local cs = -1;

    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(185.891, 0, -52.331, 128, 18); -- {R}
    end

    if (player:getCurrentMission(COP) == BELOW_THE_ARKS and player:getVar("PromathiaStatus") == 2) then
        player:completeMission(COP,BELOW_THE_ARKS);
        player:addMission(COP,THE_MOTHERCRYSTALS); -- start mission 1.3
        player:setVar("PromathiaStatus",0);
    elseif (player:getCurrentMission(COP) == THE_MOTHERCRYSTALS) then
        if (player:hasKeyItem(LIGHT_OF_HOLLA) and player:hasKeyItem(LIGHT_OF_MEA)) then
            if (player:getVar("cslastpromy") == 1) then
                player:setVar("cslastpromy",0)
                cs = 0x0034;
            end
        elseif (player:hasKeyItem(LIGHT_OF_HOLLA) or player:hasKeyItem(LIGHT_OF_MEA)) then
            if (player:getVar("cs2ndpromy") == 1) then
                player:setVar("cs2ndpromy",0)
                cs = 0x0033;
            end
        end
    end

    if (player:getVar("FirstPromyvionDem") == 1) then
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
    -- regionID =region:GetRegionID();
    -- printf("regionID: %u",regionID);
    if (player:getAnimation()==0) then
        switch (region:GetRegionID()): caseof
        {
            [11] = function (x)
                player:startEvent(0x002E);
            end,
            [12] = function (x)
                if (GetNPCByID(16851268):getAnimation() == 8) then
                    player:startEvent(30);
                end
            end,
            [21] = function (x)
                player:startEvent(41);
            end,
            [22] = function (x)
                if (GetNPCByID(16851273):getAnimation() == 8) then
                    if (player:getVar("MemoryReceptacle") == 2) then
                        player:startEvent(35);
                    else
                        player:startEvent(34);
                    end
                end
            end,
            [23] = function (x)
                if (GetNPCByID(16851275):getAnimation() == 8) then
                    if (player:getVar("MemoryReceptacle") == 2) then
                        player:startEvent(35);
                    else
                        player:startEvent(34);
                    end
                end
            end,
            [24] = function (x)
                if (GetNPCByID(16851272):getAnimation() == 8) then
                    if (player:getVar("MemoryReceptacle") == 2) then
                        player:startEvent(35);
                    else
                        player:startEvent(34);
                    end
                end
            end,
            [25] = function (x)
                if (GetNPCByID(16851274):getAnimation() == 8) then
                    if (player:getVar("MemoryReceptacle") == 2) then
                        player:startEvent(35);
                    else
                        player:startEvent(34);
                    end
                end
            end,
            [31] = function (x)
                player:startEvent(30);
            end,
            [32] = function (x)
                if (GetNPCByID(16851277):getAnimation() == 8) then
                    player:startEvent(32);
                end
            end,
            [33] = function (x)
                if (GetNPCByID(16851276):getAnimation() == 8) then
                    player:startEvent(32);
                end
            end,
            [34] = function (x)
                if (GetNPCByID(16851278):getAnimation() == 8) then
                    player:startEvent(32);
                end
            end,
            [35] = function (x)
                player:startEvent(30);
            end,
            [36] = function (x)
                if (GetNPCByID(16851269):getAnimation() == 8) then
                    player:startEvent(32);
                end
            end,
            [37] = function (x)
                if (GetNPCByID(16851270):getAnimation() == 8) then
                    player:startEvent(32);
                end
            end,
            [38] = function (x)
                if (GetNPCByID(16851271):getAnimation() == 8) then
                    player:startEvent(32);
                end
            end,
            [41] = function (x)
                if (player:getVar("MemoryReceptacle") == 2) then
                    player:startEvent(31);
                else
                    player:startEvent(34);
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

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    --printf("CSID: %u",csid);
    --printf("RESULT: %u",option);

    if (csid == 0x002e and option == 1) then
        player:setPos(-226.193, -46.459, -280.046, 127, 14); -- To Hall of Transference {R}
    elseif (csid == 0x0032) then
        player:setVar("FirstPromyvionDem",0);
        if (ENABLE_COP_ZONE_CAP == 1) then
            player:addStatusEffect(EFFECT_LEVEL_RESTRICTION,30,0,0); -- ZONE LEVEL RESTRICTION
        end
    end

    if (option==1) then
        player:setVar("MemoryReceptacle",0);
    end
end;