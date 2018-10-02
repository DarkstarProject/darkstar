-----------------------------------
--
-- Zone: Yhoator_Jungle (124)
--
-----------------------------------
local ID = require("scripts/zones/Yhoator_Jungle/IDs");
require("scripts/globals/icanheararainbow");
require("scripts/globals/chocobo_digging");
require("scripts/globals/conquest");
require("scripts/globals/zone");
-----------------------------------

local itemMap =
{
    -- itemid, abundance, requirement
    { 880, 282, DIGREQ_NONE },
    { 689, 177, DIGREQ_NONE },
    { 4432, 140, DIGREQ_NONE },
    { 923, 90, DIGREQ_NONE },
    { 702, 41, DIGREQ_NONE },
    { 700, 44, DIGREQ_NONE },
    { 4450, 47, DIGREQ_NONE },
    { 703, 26, DIGREQ_NONE },
    { 4449, 12, DIGREQ_NONE },
    { 4096, 100, DIGREQ_NONE },  -- all crystals
    { 4374, 17, DIGREQ_BURROW },
    { 4373, 41, DIGREQ_BURROW },
    { 4375, 15, DIGREQ_BURROW },
    { 4566, 3, DIGREQ_BURROW },
    { 688, 23, DIGREQ_BORE },
    { 696, 17, DIGREQ_BORE },
    { 690, 3, DIGREQ_BORE },
    { 699, 12, DIGREQ_BORE },
    { 701, 9, DIGREQ_BORE },
    { 1446, 3, DIGREQ_BORE },
    { 4570, 10, DIGREQ_MODIFIER },
    { 4487, 11, DIGREQ_MODIFIER },
    { 4409, 12, DIGREQ_MODIFIER },
    { 1188, 10, DIGREQ_MODIFIER },
    { 4532, 12, DIGREQ_MODIFIER },
};

local messageArray = { ID.text.DIG_THROW_AWAY, ID.text.FIND_NOTHING, ID.text.ITEM_OBTAINED };

function onChocoboDig(player, precheck)
    return chocoboDig(player, itemMap, precheck, messageArray);
end;

function onInitialize(zone)
    UpdateNMSpawnPoint(ID.mob.WOODLAND_SAGE);
    GetMobByID(ID.mob.WOODLAND_SAGE):setRespawnTime(math.random(900, 10800));

    UpdateNMSpawnPoint(ID.mob.BISQUE_HEELED_SUNBERRY);
    GetMobByID(ID.mob.BISQUE_HEELED_SUNBERRY):setRespawnTime(math.random(900, 10800));

    UpdateNMSpawnPoint(ID.mob.BRIGHT_HANDED_KUNBERRY);
    GetMobByID(ID.mob.BRIGHT_HANDED_KUNBERRY):setRespawnTime(math.random(900, 10800));

    dsp.conq.setRegionalConquestOverseers(zone:getRegionID())
end;

function onConquestUpdate(zone, updatetype)
    dsp.conq.onConquestUpdate(zone, updatetype)
end;

function onZoneIn( player, prevZone)
    local cs = -1;

    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos( 299.997, -5.838, -622.998, 190);
    end

    if (triggerLightCutscene(player)) then -- Quest: I Can Hear A Rainbow
        cs = 2;
    end

    return cs;
end;

function onRegionEnter( player, region)
end;

function onEventUpdate( player, csid, option)
    if (csid == 2) then
        lightCutsceneUpdate(player); -- Quest: I Can Hear A Rainbow
    end
end;

function onEventFinish( player, csid, option)
    if (csid == 2) then
        lightCutsceneFinish(player); -- Quest: I Can Hear A Rainbow
    end
end;