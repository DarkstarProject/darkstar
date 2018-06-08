-----------------------------------
--
-- Zone: Behemoths_Dominion (127)
--
-----------------------------------
package.loaded["scripts/zones/Behemoths_Dominion/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Behemoths_Dominion/TextIDs");
require("scripts/zones/Behemoths_Dominion/MobIDs");
require("scripts/globals/settings");
require("scripts/globals/zone");
-----------------------------------

function onInitialize(zone)
    if (LandKingSystem_NQ ~= 1) then
        UpdateNMSpawnPoint(BEHEMOTH);
        GetMobByID(BEHEMOTH):setRespawnTime(math.random(900, 10800));
    end
end;

function onConquestUpdate(zone, updatetype)
    local players = zone:getPlayers();

    for name, player in pairs(players) do
        conquestUpdate(zone, player, updatetype, CONQUEST_BASE);
    end
end;

function onZoneIn(player,prevZone)
    local cs = -1;
    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(358.134,24.806,-60.001,123);
    end
    return cs;
end;

function onRegionEnter(player,region)
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
