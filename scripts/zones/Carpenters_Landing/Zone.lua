-----------------------------------
--
-- Zone: Carpenters_Landing (2)
--
-----------------------------------
package.loaded["scripts/zones/Carpenters_Landing/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Carpenters_Landing/TextIDs");
require("scripts/zones/Carpenters_Landing/MobIDs");
require("scripts/globals/chocobo_digging");
require("scripts/globals/zone");
-----------------------------------

local itemMap =
{
    -- itemid, abundance, requirement
                    { 4504, 152, DIGREQ_NONE },
                    { 688, 182, DIGREQ_NONE },
                    { 697, 83, DIGREQ_NONE },
                    { 4386, 3, DIGREQ_NONE },
                    { 17396, 129, DIGREQ_NONE },
                    { 691, 144, DIGREQ_NONE },
                    { 918, 8, DIGREQ_NONE },
                    { 699, 76, DIGREQ_NONE },
                    { 4447, 38, DIGREQ_NONE },
                    { 695, 45, DIGREQ_NONE },
                    { 4096, 100, DIGREQ_NONE },  -- all crystals
                    { 1255, 10, DIGREQ_NONE }, -- all ores
                    { 4100, 59, DIGREQ_BURROW },
                    { 4101, 59, DIGREQ_BURROW },
                    { 690, 15, DIGREQ_BORE },
                    { 1446, 8, DIGREQ_BORE },
                    { 700, 23, DIGREQ_BORE },
                    { 701, 8, DIGREQ_BORE },
                    { 696, 30, DIGREQ_BORE },
                    { 4570, 10, DIGREQ_MODIFIER },
                    { 4487, 11, DIGREQ_MODIFIER },
                    { 4409, 12, DIGREQ_MODIFIER },
                    { 1188, 10, DIGREQ_MODIFIER },
                    { 4532, 12, DIGREQ_MODIFIER },
};

local messageArray = { DIG_THROW_AWAY, FIND_NOTHING, ITEM_OBTAINED };

function onChocoboDig(player, precheck)
    return chocoboDig(player, itemMap, precheck, messageArray);
end;

function onInitialize(zone)
    UpdateNMSpawnPoint(TEMPEST_TIGON);
    GetMobByID(TEMPEST_TIGON):setRespawnTime(math.random(900, 10800));
end;

function onZoneIn(player,prevZone)
    local cs = -1;
    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(6.509,-9.163,-819.333,239);
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