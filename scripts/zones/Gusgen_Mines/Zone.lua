-----------------------------------
--
-- Zone: Gusgen_Mines (196)
--
-----------------------------------
package.loaded["scripts/zones/Gusgen_Mines/TextIDs"] = nil;
----------------------------------

require("scripts/globals/settings");
require("scripts/globals/zone");
require("scripts/zones/Gusgen_Mines/TextIDs");
-----------------------------------

function onInitialize(zone)
    UpdateTreasureSpawnPoint(17580403);
end;

function onZoneIn(player,prevZone)
    local cs = -1;
    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(100.007,-61.63,-237.441,187);
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
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;
