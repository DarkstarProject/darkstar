-----------------------------------
--
-- Zone: Toraimarai_Canal (169)
--
-----------------------------------
package.loaded["scripts/zones/Toraimarai_Canal/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Toraimarai_Canal/TextIDs");
require("scripts/zones/Toraimarai_Canal/MobIDs");
require("scripts/globals/conquest")

function onInitialize(zone)
    UpdateTreasureSpawnPoint(TORAIMARAI_TREASURE_COFFER);
end;

function onZoneIn(player,prevZone)
    local cs = -1;
    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(-259.98,21.794,81.887,66);
    end
    return cs;
end;

function onConquestUpdate(zone, updatetype)
    local players = zone:getPlayers();

    for name, player in pairs(players) do
        conquestUpdate(zone, player, updatetype, CONQUEST_BASE);
    end
end;

function onRegionEnter(player,region)
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
