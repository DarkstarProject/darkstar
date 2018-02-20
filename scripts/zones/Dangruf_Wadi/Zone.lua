-----------------------------------
--
-- Zone: Dangruf_Wadi (191)
--
-----------------------------------
package.loaded["scripts/zones/Dangruf_Wadi/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/status");
require("scripts/globals/zone");
require("scripts/zones/Dangruf_Wadi/TextIDs");
-----------------------------------

function onInitialize(zone)
    zone:registerRegion(1, -133.5, 2, 132.6, -132.7, 4,  133.8);  -- I-8 Geyser
    zone:registerRegion(2, -213.5, 2,  92.6, -212.7, 4,   94.0);  -- H-8 Geyser
    zone:registerRegion(3,  -67.3, 2, 532.8,  -66.3, 4,  534.0);  -- J-3 Geyser

    UpdateTreasureSpawnPoint(17559924);
end;

function onConquestUpdate(zone, updatetype)
    local players = zone:getPlayers();

    for name, player in pairs(players) do
        conquestUpdate(zone, player, updatetype, CONQUEST_BASE);
    end
end;

function onZoneIn(player,prevZone)
    local cs = -1;
    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(-4.025,-4.449,0.016,112);
    end
    return cs;
end;

function onRegionEnter(player,region)
    switch (region:GetRegionID()): caseof
    {
    [1] = function (x)
    player:startEvent(10);
    SendEntityVisualPacket(17559897, "kkj2");
    end,
    [2] = function (x)
    player:startEvent(11);
    SendEntityVisualPacket(17559898, "kkj1");
    end,
    [3] = function (x)
    player:startEvent(12);
    SendEntityVisualPacket(17559899, "kkj3");
    end,
    }
    if (player:hasKeyItem(BLUE_ACIDITY_TESTER)) then
        player:delKeyItem(BLUE_ACIDITY_TESTER);
        player:addKeyItem(RED_ACIDITY_TESTER);
    end
end;

function onRegionLeave(player,region)
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onZoneWeatherChange(weather)
    local qm2 = GetNPCByID(17559911); -- Quest: An Empty Vessel
    if (weather == WEATHER_NONE or weather == WEATHER_SUNSHINE) then
        qm2:setStatus(STATUS_NORMAL);
    else
        qm2:setStatus(STATUS_DISAPPEAR);
    end
end;