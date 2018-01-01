-----------------------------------
--
-- Zone: VeLugannon_Palace (177)
--
-----------------------------------
package.loaded["scripts/zones/VeLugannon_Palace/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/VeLugannon_Palace/TextIDs");
require("scripts/zones/VeLugannon_Palace/MobIDs");
require("scripts/globals/conquest");

function onInitialize(zone)
    UpdateTreasureSpawnPoint(VELUGANNON_TREASURE_COFFER);
end;

function onConquestUpdate(zone, updatetype)
    local players = zone:getPlayers();

    for name, player in pairs(players) do
        conquestUpdate(zone, player, updatetype, CONQUEST_BASE);
    end
end;

function onZoneIn(player,prevZone)
    local cs = -1;
    if ((player:getXPos() == 0) and (player:getYPos() == 0) and (player:getZPos() == 0)) then
        player:setPos(-100.01,-25.752,-399.468,59);
    end
    return cs;
end;

function onRegionEnter(player,region)
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
