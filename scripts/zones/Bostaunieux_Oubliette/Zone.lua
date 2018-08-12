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

function onInitialize(zone)
    UpdateNMSpawnPoint(DREXERION_THE_CONDEMNED);
    GetMobByID(DREXERION_THE_CONDEMNED):setRespawnTime(math.random(900, 10800));

    UpdateNMSpawnPoint(PHANDURON_THE_CONDEMNED);
    GetMobByID(PHANDURON_THE_CONDEMNED):setRespawnTime(math.random(900, 10800));

    UpdateNMSpawnPoint(BLOODSUCKER);
    GetMobByID(BLOODSUCKER):setRespawnTime(3600);
end;

function onZoneIn(player,prevZone)
    local cs = -1;
    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(99.978,-25.647,72.867,61);
    end
    return cs;
end;

function onConquestUpdate(zone, updatetype)
    dsp.conq.onConquestUpdate(zone, updatetype)
end;

function onRegionEnter(player,region)
end;

function onConquestUpdate(zone, updatetype)
    dsp.conq.onConquestUpdate(zone, updatetype)
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;