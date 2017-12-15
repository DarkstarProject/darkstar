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

    UpdateTreasureSpawnPoint(17396210);
    UpdateTreasureSpawnPoint(17396211);
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

Oz_Handle_Table =
{
    [0] = {[17396196] = 8, [17396197] = 8, [17396198] = 8, [17396199] = 8},
    [1] = {[17396196] = 8, [17396197] = 9, [17396198] = 9, [17396199] = 9},
    [2] = {[17396196] = 9, [17396197] = 8, [17396198] = 9, [17396199] = 9},
    [3] = {[17396196] = 9, [17396197] = 8, [17396198] = 8, [17396199] = 9},
    [4] = {[17396196] = 9, [17396197] = 8, [17396198] = 9, [17396199] = 8},
    [5] = {[17396196] = 8, [17396197] = 8, [17396198] = 9, [17396199] = 8},
    [6] = {[17396196] = 9, [17396197] = 9, [17396198] = 8, [17396199] = 9},
    [7] = {[17396196] = 9, [17396197] = 9, [17396198] = 9, [17396199] = 8},
    [8] = {[17396196] = 8, [17396197] = 8, [17396198] = 9, [17396199] = 9},
};

function onGameHour(zone)
    local VanadielHour = VanadielHour();
    if (VanadielHour % 24 == 0) then -- Change handles every game day
        Oz_handleSet = math.random(0,8);
        for i,v in pairs(Oz_Handle_Table[Oz_handleSet]) do
            GetNPCByID(i):setAnimation(v);
        end
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