-----------------------------------
--
-- Zone: Maze_of_Shakhrami (198)
--
-----------------------------------
package.loaded["scripts/zones/Maze_of_Shakhrami/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/zone");
require("scripts/zones/Maze_of_Shakhrami/TextIDs");
require("scripts/zones/Maze_of_Shakhrami/MobIDs");

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)
    UpdateTreasureSpawnPoint(17588773);
    local whichNM = math.random(0,19);
    if (whichNM < 10) then
        SetRespawnTime(Argus, 900, 43200); -- 0-12 hours
    else
        SetRespawnTime(Leech_King, 900, 43200); -- 0-12 hours
    end
end;

-----------------------------------
-- onZoneIn
-----------------------------------

function onZoneIn(player,prevZone)
    local cs = -1;
    if ((player:getXPos() == 0) and (player:getYPos() == 0) and (player:getZPos() == 0)) then
        player:setPos(-140.246,-12.738,160.709,63);
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
