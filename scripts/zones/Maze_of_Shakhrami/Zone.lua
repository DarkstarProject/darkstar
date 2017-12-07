-----------------------------------
--
-- Zone: Maze_of_Shakhrami (198)
--
-----------------------------------
package.loaded["scripts/zones/Maze_of_Shakhrami/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Maze_of_Shakhrami/TextIDs");
require("scripts/zones/Maze_of_Shakhrami/MobIDs");
require("scripts/globals/conquest");
require("scripts/globals/zone");

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)
    if (math.random(2)==1) then
        DisallowRespawn(LEECH_KING, true);
        DisallowRespawn(ARGUS, false);
        UpdateNMSpawnPoint(ARGUS);
        GetMobByID(ARGUS):setRespawnTime(math.random(900, 43200));
    else
        DisallowRespawn(ARGUS, true);
        DisallowRespawn(LEECH_KING, false);
        UpdateNMSpawnPoint(LEECH_KING);
        GetMobByID(LEECH_KING):setRespawnTime(math.random(900, 43200));
    end

    UpdateTreasureSpawnPoint(17588773);
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
