-----------------------------------
--
-- Zone: Yuhtunga_Jungle (123)
--
-----------------------------------
package.loaded["scripts/zones/Yuhtunga_Jungle/TextIDs"] = nil;
package.loaded["scripts/globals/chocobo_digging"] = nil;
-----------------------------------

require("scripts/zones/Yuhtunga_Jungle/TextIDs");
require("scripts/globals/icanheararainbow");
require("scripts/globals/zone");
require("scripts/globals/conquest");
require("scripts/globals/chocobo_digging");

-----------------------------------
-- Chocobo Digging vars
-----------------------------------
local itemMap = {
                    -- itemid, abundance, requirement
                    { 880, 185, DIGREQ_NONE },
                    { 628, 72, DIGREQ_NONE },
                    { 721, 91, DIGREQ_NONE },
                    { 4375, 40, DIGREQ_NONE },
                    { 702, 4, DIGREQ_NONE },
                    { 1983, 10, DIGREQ_NONE },
                    { 701, 29, DIGREQ_NONE },
                    { 4386, 4, DIGREQ_NONE },
                    { 703, 9, DIGREQ_NONE },
                    { 4448, 7, DIGREQ_NONE },
                    { 720, 3, DIGREQ_NONE },
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
    local manuals = {17281653,17281654,17281655,17281656};

    SetFieldManual(manuals);

    local Rose_Garden = 17281357;
    GetMobByID(Rose_Garden):setLocalVar("1",os.time() + math.random((36000), (37800)));

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
        player:setPos( 116.825, 6.613, 100, 140);
    end

    if (triggerLightCutscene(player)) then -- Quest: I Can Hear A Rainbow
        cs = 0x000b;
    end

    return cs;
end;

-----------------------------------
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

    if (csid == 0x000b) then
        lightCutsceneUpdate(player); -- Quest: I Can Hear A Rainbow
    end
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish( player, csid, option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 0x000b) then
        lightCutsceneFinish(player); -- Quest: I Can Hear A Rainbow
    end
end;