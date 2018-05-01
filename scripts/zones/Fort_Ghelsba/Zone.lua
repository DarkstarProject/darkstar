-----------------------------------
--
-- Zone: Fort_Ghelsba (141)
--
-----------------------------------
package.loaded["scripts/zones/Fort_Ghelsba/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Fort_Ghelsba/TextIDs");
require("scripts/zones/Fort_Ghelsba/MobIDs");
require("scripts/globals/conquest");
-----------------------------------

function onInitialize(zone)
    UpdateTreasureSpawnPoint(FORT_GHELSBA_TREASURE_CHEST);
end;

function onZoneIn(player,prevZone)
    local cs = -1;
    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(219.949,-86.032,19.489,128);
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
