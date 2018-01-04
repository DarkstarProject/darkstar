-----------------------------------
--
-- Zone: The_Eldieme_Necropolis (195)
--
-----------------------------------
package.loaded["scripts/zones/The_Eldieme_Necropolis/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/The_Eldieme_Necropolis/TextIDs");
require("scripts/zones/The_Eldieme_Necropolis/MobIDs");
require("scripts/globals/conquest");

function onInitialize(zone)
    UpdateTreasureSpawnPoint(ELDIEME_TREASURE_CHEST);
    UpdateTreasureSpawnPoint(ELDIEME_TREASURE_COFFER);
end;

function onZoneIn(player,prevZone)
    -- rng af2
    if (player:getVar("fireAndBrimstone") == 2) then
        return 4;
    end

    local cs = -1;
    if ((player:getXPos() == 0) and (player:getYPos() == 0) and (player:getZPos() == 0)) then
        player:setPos(-438.878,-26.091,540.004,126);
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
    if (csid == 4) then
        player:setVar("fireAndBrimstone",3);
    end
end;
