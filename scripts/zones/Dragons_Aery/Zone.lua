-----------------------------------
--
-- Zone: Dragons_Aery (154)
--
-----------------------------------
package.loaded["scripts/zones/Dragons_Aery/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Dragons_Aery/TextIDs");
require("scripts/zones/Dragons_Aery/MobIDs");
require("scripts/globals/conquest");
require("scripts/globals/settings");
require("scripts/globals/zone");
-----------------------------------

function onInitialize(zone)
    if (LandKingSystem_NQ ~= 1) then
        UpdateNMSpawnPoint(FAFNIR);
        GetMobByID(FAFNIR):setRespawnTime(math.random(900, 10800));
    end
end;

function onZoneIn(player,prevZone)
    local cs = -1;

    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(-60.006,-2.915,-39.501,202);
    end

    return cs;
end;

function onConquestUpdate(zone, updatetype)
    dsp.conq.onConquestUpdate(zone, updatetype)
end;

function onRegionEnter(player,region)
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
