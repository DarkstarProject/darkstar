-----------------------------------
--
-- Zone: The_Boyahda_Tree (153)
--
-----------------------------------
package.loaded["scripts/zones/The_Boyahda_Tree/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/The_Boyahda_Tree/TextIDs");
require("scripts/zones/The_Boyahda_Tree/MobIDs");
require("scripts/globals/conquest");

function onInitialize(zone)
    UpdateTreasureSpawnPoint(BOYAHDA_TREASURE_COFFER);
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
        player:setPos(-140.008,3.787,202.715,64);
    end
    return cs;
end;

function onRegionEnter(player,region)
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
