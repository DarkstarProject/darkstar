-----------------------------------
--
-- Zone: Castle_Oztroja (151)
--
-----------------------------------
package.loaded["scripts/zones/Castle_Oztroja/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Castle_Oztroja/TextIDs");
require("scripts/zones/Castle_Oztroja/MobIDs");
require("scripts/globals/conquest");
require("scripts/globals/zone");
-----------------------------------

function onInitialize(zone)
    UpdateNMSpawnPoint(YAGUDO_AVATAR);
    GetMobByID(YAGUDO_AVATAR):setRespawnTime(math.random(900, 10800));

    Oz_handleSet = math.random(0,8);
    Oz_passwordSet = math.random(0,8);

    UpdateTreasureSpawnPoint(OZTROJA_TREASURE_CHEST);
    UpdateTreasureSpawnPoint(OZTROJA_TREASURE_COFFER);
end;

function onZoneIn(player,prevZone)
    local cs = -1;
    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(-162.895,22.136,-139.923,2);
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

function onGameHour(zone)
    local VanadielHour = VanadielHour();
    if (VanadielHour % 24 == 0) then -- Change handles and passwords every game day
        Oz_handleSet = math.random(0,8);
        Oz_passwordSet = math.random(0,8);
        for i,v in pairs(OZ_HANDLE_TABLE[Oz_handleSet]) do
            GetNPCByID(i):setAnimation(v);
        end
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;