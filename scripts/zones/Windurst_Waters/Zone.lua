-----------------------------------
--
-- Zone: Windurst_Waters (238)
--
-----------------------------------
package.loaded["scripts/zones/Windurst_Waters/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Windurst_Waters/TextIDs");
require("scripts/globals/events/harvest_festivals");
require("scripts/globals/missions");
require("scripts/globals/settings");
require("scripts/globals/zone");

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)
    -- Check if we are on Windurst Mission 1-3
    zone:registerRegion(1, 23,-12,-208, 31,-8,-197);

    applyHalloweenNpcCostumes(zone:getID())
end;

-----------------------------------
-- onZoneIn
-----------------------------------

function onZoneIn(player,prevZone)
    local cs = -1;

    -- FIRST LOGIN (START CS)
    if (player:getPlaytime(false) == 0) then
        if (OPENING_CUTSCENE_ENABLE == 1) then
            cs = 531;
        end
        player:setPos(-40,-5,80,64);
        player:setHomePoint();
    end

    -- MOG HOUSE EXIT
    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        position = math.random(1,5) + 157;
        player:setPos(position,-5,-62,192);
        if (player:getMainJob() ~= player:getVar("PlayerMainJob")) then
            cs = 30004;
        end
        player:setVar("PlayerMainJob",0);
    end

    if (player:getCurrentMission(COP) == THE_ROAD_FORKS and player:getVar("MEMORIES_OF_A_MAIDEN_Status") == 1) then -- COP MEMORIES_OF_A_MAIDEN--3-3B: Windurst Route
        player:setVar("MEMORIES_OF_A_MAIDEN_Status",2);
        cs = 871;
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
        [1] = function (x)  -- Windurst Mission 1-3, final cutscene with Leepe-Hoppe
            -- If we're on Windurst Mission 1-3
            if (player:getCurrentMission(WINDURST) == THE_PRICE_OF_PEACE and player:getVar("MissionStatus") == 2) then
                player:startEvent(0x0092);
            end
        end,
    }

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
    if (csid == 531) then
        player:messageSpecial(ITEM_OBTAINED, 536);
    elseif (csid == 30004 and option == 0) then
        player:setHomePoint();
        player:messageSpecial(HOMEPOINT_SET);
    elseif (csid == 146) then -- Returned from Giddeus, Windurst 1-3
        player:setVar("MissionStatus", 3);
        player:setVar("ghoo_talk", 0);
        player:setVar("laa_talk", 0);
    end
end;
