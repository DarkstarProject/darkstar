-----------------------------------
--
-- Zone: Heavens_Tower
--
-----------------------------------
package.loaded["scripts/zones/Heavens_Tower/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Heavens_Tower/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/missions");

-----------------------------------
--  onInitialize
-----------------------------------

function onInitialize(zone)
    zone:registerRegion(1, -1,-1,-35, 1,1,-33);
    zone:registerRegion(2, 6,-46,-30, 8,-44,-28);
end;

-----------------------------------
-- onZoneIn
-----------------------------------

function onZoneIn(player,prevZone)
    local cs = -1;

    if (player:getCurrentMission(SANDORIA) == JOURNEY_TO_WINDURST and player:getVar("MissionStatus") == 3) then
        cs = 42;
    elseif (player:getCurrentMission(BASTOK) == THE_EMISSARY_WINDURST and player:getVar("MissionStatus") == 2) then
        cs = 42;
    elseif (player:getCurrentMission(WINDURST) == DOLL_OF_THE_DEAD and player:getVar("MissionStatus") == 1) then
        cs = 335;
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
    switch (region:GetRegionID()): caseof
    {
        ---------------------------------
        [1] = function (x)  -- Heaven's Tower exit portal
            player:startEvent(41);
        end,
        ---------------------------------
        [2] = function (x)  -- Warp directly back to the first floor.
            player:startEvent(83);
        end,
        ---------------------------------
    }
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
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 41) then
        player:setPos(0,-17,135,60,239);
    elseif (csid == 335) then
        player:setVar("MissionStatus",2);
    elseif (csid == 42) then
        -- This cs should only play if you visit Windurst first.
        if (player:getNation() == SANDORIA) then
            player:setVar("MissionStatus",4);
        else
            player:setVar("MissionStatus",3);
        end
    end
end;
