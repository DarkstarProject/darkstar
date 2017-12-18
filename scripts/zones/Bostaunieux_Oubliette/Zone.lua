-----------------------------------
--
-- Zone: Bostaunieux_Oubliette (167)
--
-----------------------------------
package.loaded["scripts/zones/Bostaunieux_Oubliette/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Bostaunieux_Oubliette/TextIDs");
require("scripts/zones/Bostaunieux_Oubliette/MobIDs");
require("scripts/globals/zone");

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)
    UpdateNMSpawnPoint(DREXERION_THE_CONDEMNED);
    GetMobByID(DREXERION_THE_CONDEMNED):setRespawnTime(math.random(900, 10800));

    UpdateNMSpawnPoint(PHANDURON_THE_CONDEMNED);
    GetMobByID(PHANDURON_THE_CONDEMNED):setRespawnTime(math.random(900, 10800));

    UpdateNMSpawnPoint(BLOODSUCKER);
    GetMobByID(BLOODSUCKER):setRespawnTime(3600);
end;

-----------------------------------
-- onZoneIn
-----------------------------------

function onZoneIn(player,prevZone)
    local cs = -1;
    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(99.978,-25.647,72.867,61);
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
-- onConquestUpdate
-----------------------------------

function onConquestUpdate(zone, updatetype)
    local players = zone:getPlayers();

    for name, player in pairs(players) do
        conquestUpdate(zone, player, updatetype, CONQUEST_BASE);
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