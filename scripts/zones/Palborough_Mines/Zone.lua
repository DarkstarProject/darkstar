-----------------------------------
--
-- Zone: Palborough_Mines (143)
--
-----------------------------------
package.loaded["scripts/zones/Palborough_Mines/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Palborough_Mines/TextIDs");
require("scripts/zones/Palborough_Mines/MobIDs");
require("scripts/globals/conquest");
-----------------------------------

function onInitialize(zone)
    UpdateTreasureSpawnPoint(PALBOROUGH_TREASURE_CHEST);
end;

function onZoneIn(player,prevZone)
    local cs = -1;
    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(114.483,-42,-140,96);
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
