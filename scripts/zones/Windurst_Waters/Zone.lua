-----------------------------------
--
-- Zone: Windurst_Waters (238)
--
-----------------------------------
local ID = require("scripts/zones/Windurst_Waters/IDs");
require("scripts/globals/events/harvest_festivals");
require("scripts/globals/conquest");
require("scripts/globals/missions");
require("scripts/globals/settings");
require("scripts/globals/zone");
-----------------------------------

function onInitialize(zone)
    -- Check if we are on Windurst Mission 1-3
    zone:registerRegion(1, 23,-12,-208, 31,-8,-197);

    applyHalloweenNpcCostumes(zone:getID())
end;

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
        if (player:getMainJob() ~= player:getCharVar("PlayerMainJob")) then
            cs = 30004;
        end
        player:setCharVar("PlayerMainJob",0);
    end

    if (player:getCurrentMission(COP) == dsp.mission.id.cop.THE_ROAD_FORKS and player:getCharVar("MEMORIES_OF_A_MAIDEN_Status") == 1) then -- COP MEMORIES_OF_A_MAIDEN--3-3B: Windurst Route
        player:setCharVar("MEMORIES_OF_A_MAIDEN_Status",2);
        cs = 871;
    end

    return cs;
end;

function onConquestUpdate(zone, updatetype)
    dsp.conq.onConquestUpdate(zone, updatetype)
end;

function onRegionEnter(player,region)

    switch (region:GetRegionID()): caseof
    {
        [1] = function (x)  -- Windurst Mission 1-3, final cutscene with Leepe-Hoppe
            -- If we're on Windurst Mission 1-3
            if (player:getCurrentMission(WINDURST) == dsp.mission.id.windurst.THE_PRICE_OF_PEACE and player:getCharVar("MissionStatus") == 2) then
                player:startEvent(146);
            end
        end,
    }

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 531) then
        player:messageSpecial(ID.text.ITEM_OBTAINED, 536);
    elseif (csid == 30004 and option == 0) then
        player:setHomePoint();
        player:messageSpecial(ID.text.HOMEPOINT_SET);
    elseif (csid == 146) then -- Returned from Giddeus, Windurst 1-3
        player:setCharVar("MissionStatus", 3);
        player:setCharVar("ghoo_talk", 0);
        player:setCharVar("laa_talk", 0);
    end
end;
