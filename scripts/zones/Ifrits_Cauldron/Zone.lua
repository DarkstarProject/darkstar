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
require("scripts/globals/zone");
-----------------------------------

function onInitialize(zone)
    UpdateNMSpawnPoint(ASH_DRAGON);
    GetMobByID(ASH_DRAGON):setRespawnTime(math.random(900, 10800));

    UpdateTreasureSpawnPoint(17617224);
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
    local VanadielHour = VanadielHour();
    if (VanadielHour % 3 == 0) then -- Opens flame spouts every 3 hours Vana'diel time
        GetNPCByID(FLAME_SPOUT_OFFSET+0):openDoor(90); -- Ifrit's Cauldron flame spout (H-6) Map 1
        GetNPCByID(FLAME_SPOUT_OFFSET+1):openDoor(90); -- Ifrit's Cauldron flame spout (H-6) Map 5
        GetNPCByID(FLAME_SPOUT_OFFSET+2):openDoor(90); -- Ifrit's Cauldron flame spout (I-10) Map 8
        GetNPCByID(FLAME_SPOUT_OFFSET+3):openDoor(90); -- Ifrit's Cauldron flame spout (E-7) Map 8
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;
