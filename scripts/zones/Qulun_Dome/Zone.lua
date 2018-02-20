-----------------------------------
--
-- Zone: Qulun_Dome (148)
--
-----------------------------------
package.loaded["scripts/zones/Qulun_Dome/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Qulun_Dome/TextIDs");
require("scripts/zones/Qulun_Dome/MobIDs");
require("scripts/globals/conquest");
-----------------------------------

function onInitialize(zone)
    UpdateNMSpawnPoint(DIAMOND_QUADAV);
    GetMobByID(DIAMOND_QUADAV):setRespawnTime(math.random(900, 10800));
end;

function onZoneIn(player,prevZone)
    local cs = -1;
    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(337.901,38.091,20.087,129);
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
