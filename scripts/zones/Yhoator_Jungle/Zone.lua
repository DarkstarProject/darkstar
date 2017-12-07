-----------------------------------
--
-- Zone: Yhoator_Jungle (124)
--
-----------------------------------
package.loaded[ "scripts/zones/Yhoator_Jungle/TextIDs"] = nil;
package.loaded["scripts/globals/chocobo_digging"] = nil;
-----------------------------------
require("scripts/zones/Yhoator_Jungle/TextIDs");
require("scripts/zones/Yhoator_Jungle/MobIDs");
require("scripts/globals/icanheararainbow");
require("scripts/globals/chocobo_digging");
require("scripts/globals/conquest");
require("scripts/globals/zone");

-----------------------------------
-- Chocobo Digging vars
-----------------------------------
local itemMap = {
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

local messageArray = { DIG_THROW_AWAY, FIND_NOTHING, ITEM_OBTAINED };

-----------------------------------
-- onChocoboDig
-----------------------------------
function onChocoboDig(player, precheck)
    return chocoboDig(player, itemMap, precheck, messageArray);
end;

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)
    UpdateNMSpawnPoint(WOODLAND_SAGE);
    GetMobByID(WOODLAND_SAGE):setRespawnTime(math.random(900, 10800));

    UpdateNMSpawnPoint(BISQUE_HEELED_SUNBERRY);
    GetMobByID(BISQUE_HEELED_SUNBERRY):setRespawnTime(math.random(900, 10800));

    UpdateNMSpawnPoint(BRIGHT_HANDED_KUNBERRY);
    GetMobByID(BRIGHT_HANDED_KUNBERRY):setRespawnTime(math.random(900, 10800));

    SetRegionalConquestOverseers(zone:getRegionID())
end;

-----------------------------------
-- onConquestUpdate
-----------------------------------

function onConquestUpdate(zone, updatetype)
    local players = zone:getPlayers();

    for name, player in pairs(players) do
        conquestUpdate(zone, player, updatetype, CONQUEST_BASE);
    end
end;

-----------------------------------
-- onZoneIn
-----------------------------------

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

------------------------
-----------
-- onRegionEnter
-----------------------------------

function onRegionEnter( player, region)
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate( player, csid, option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 2) then
        lightCutsceneUpdate(player); -- Quest: I Can Hear A Rainbow
    end
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish( player, csid, option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 2) then
        lightCutsceneFinish(player); -- Quest: I Can Hear A Rainbow
    end
end;