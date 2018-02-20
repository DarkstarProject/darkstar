-----------------------------------
--
-- Zone: Bhaflau_Thickets (52)
--
-----------------------------------
package.loaded["scripts/zones/Bhaflau_Thickets/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Bhaflau_Thickets/TextIDs");
require("scripts/zones/Bhaflau_Thickets/MobIDs");
require("scripts/globals/chocobo_digging");
require("scripts/globals/zone");
-----------------------------------

local itemMap =
{
    -- itemid, abundance, requirement
                    { 770, 50, DIGREQ_NONE },
                    { 2150, 60, DIGREQ_NONE },
                    { 622, 197, DIGREQ_NONE },
                    { 2155, 23, DIGREQ_NONE },
                    { 739, 5, DIGREQ_NONE },
                    { 17296, 133, DIGREQ_NONE },
                    { 703, 69, DIGREQ_NONE },
                    { 2213, 135, DIGREQ_NONE },
                    { 838, 21, DIGREQ_NONE },
                    { 4096, 100, DIGREQ_NONE },  -- all crystals
                    { 1255, 10, DIGREQ_NONE }, -- all ores -- all ores
                    { 688, 144, DIGREQ_BURROW },
                    { 702, 14, DIGREQ_BURROW },
                    { 690, 23, DIGREQ_BURROW },
                    { 1446, 3, DIGREQ_BURROW },
                    { 700, 14, DIGREQ_BURROW },
                    { 699, 37, DIGREQ_BURROW },
                    { 701, 28, DIGREQ_BURROW },
                    { 696, 23, DIGREQ_BURROW },
                    { 678, 9, DIGREQ_BORE },
                    { 645, 3, DIGREQ_BORE },
                    { 768, 193, DIGREQ_BORE },
                    { 737, 22, DIGREQ_BORE },
                    { 2475, 3, DIGREQ_BORE },
                    { 738, 3, DIGREQ_BORE },
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
    UpdateNMSpawnPoint(HARVESTMAN);
    GetMobByID(HARVESTMAN):setRespawnTime(math.random(900, 10800));
end;

function onZoneIn(player,prevZone)
    local cs = -1;
    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(-100,-13.5,-479.514,60);
    end
    return cs;
end;

function afterZoneIn(player)
    player:entityVisualPacket("1pb1");
    player:entityVisualPacket("2pb1");
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
    if (csid == 108) then
        player:setPos(0,0,0,0,66);
    end
end;
