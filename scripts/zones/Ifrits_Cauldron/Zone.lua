-----------------------------------
--
-- Zone: Ifrits_Cauldron (205)
--
-----------------------------------
package.loaded["scripts/zones/Ifrits_Cauldron/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Ifrits_Cauldron/TextIDs");
require("scripts/zones/Ifrits_Cauldron/MobIDs");
require("scripts/globals/conquest");
-----------------------------------

function onInitialize(zone)
    UpdateNMSpawnPoint(ASH_DRAGON);
    GetMobByID(ASH_DRAGON):setRespawnTime(math.random(900, 10800));

    UpdateTreasureSpawnPoint(IFRITS_TREASURE_COFFER);
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
        player:setPos(-60.296,48.884,105.967,69);
    end
    return cs;
end;

function onRegionEnter(player,region)
end;

function onGameHour(zone)
    -- Opens flame spouts every 3 hours Vana'diel time. Doors are offset from spouts by 5.
    if (VanadielHour() % 3 == 0) then
        for i = 5, 8 do
            GetNPCByID(FLAME_SPOUT_OFFSET + i):openDoor(90);
        end
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
