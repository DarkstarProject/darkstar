-----------------------------------
--
-- Zone: Giddeus (145)
--
-----------------------------------
package.loaded["scripts/zones/Giddeus/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Giddeus/TextIDs");
require("scripts/zones/Giddeus/MobIDs");
require("scripts/globals/conquest");
-----------------------------------

function onInitialize(zone)
    UpdateTreasureSpawnPoint(GIDDEUS_TREASURE_CHEST);
end;

function onZoneIn(player,prevZone)
    local cs = -1;
    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(-135.904,-5.788,-300.668,2);
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
