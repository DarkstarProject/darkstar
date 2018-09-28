-----------------------------------
--
-- Zone: Yughott_Grotto (142)
--
-----------------------------------
package.loaded["scripts/zones/Yughott_Grotto/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Yughott_Grotto/TextIDs");
require("scripts/zones/Yughott_Grotto/MobIDs");
require("scripts/globals/conquest");

function onInitialize(zone)
    UpdateTreasureSpawnPoint(YUGHOTT_TREASURE_CHEST);
end;

function onZoneIn(player,prevZone)
    local cs = -1;
    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(439.814,-42.481,169.755,118);
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