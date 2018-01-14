-----------------------------------
--
-- Zone: Sea_Serpent_Grotto (176)
--
-----------------------------------
package.loaded["scripts/zones/Sea_Serpent_Grotto/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Sea_Serpent_Grotto/TextIDs");
require("scripts/zones/Sea_Serpent_Grotto/MobIDs");
require("scripts/globals/conquest");

function onInitialize(zone)
    -- Charybdis PH alternates, remove one
    local keys = {};
    for k, v in pairs(Charybdis_PH) do table.insert(keys,k); end
    DespawnMob(keys[math.random(#keys)]);

    UpdateTreasureSpawnPoint(SSG_TREASURE_CHEST);
    UpdateTreasureSpawnPoint(SSG_TREASURE_COFFER);
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
        player:setPos(-60.566,-2.127,412,54);
    end
    return cs;
end;

function onRegionEnter(player,region)
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
