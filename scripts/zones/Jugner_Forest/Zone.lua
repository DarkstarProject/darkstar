-----------------------------------
--
-- Zone: Jugner_Forest (104)
--
-----------------------------------
package.loaded[ "scripts/zones/Jugner_Forest/TextIDs"] = nil;
package.loaded["scripts/globals/chocobo_digging"] = nil;
-----------------------------------

require("scripts/zones/Jugner_Forest/TextIDs");
require("scripts/globals/zone");
require("scripts/globals/icanheararainbow");
require("scripts/globals/conquest");
require("scripts/globals/chocobo_digging");

-----------------------------------
-- Chocobo Digging vars
-----------------------------------
local itemMap = {
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
                    { 690, 15, DIGREQ_BORE },
                    { 1446, 8, DIGREQ_BORE },
                    { 702, 23, DIGREQ_BORE },
                    { 701, 8, DIGREQ_BORE },
                    { 696, 30, DIGREQ_BORE },
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
    zone:registerRegion(1, -484, 10, 292, 0, 0, 0); -- Sets Mark for "Under Oath" Quest cutscene.

    -- Fraelissa
    SetRespawnTime(17203447, 900, 10800);

    SetRegionalConquestOverseers(zone:getRegionID());
end;

-----------------------------------
-- onZoneIn
-----------------------------------

function onZoneIn( player, prevZone)
    local cs = -1;

    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos( 342, -5, 15.117, 169);
    end

    if (triggerLightCutscene(player)) then -- Quest: I Can Hear A Rainbow
        cs = 0x000f;
    end

    return cs;
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
-- onRegionEnter
-----------------------------------

function onRegionEnter( player, region)
    if (region:GetRegionID() == 1) then
        if (player:getVar("UnderOathCS") == 7) then -- Quest: Under Oath - PLD AF3
            player:startEvent(0x000E);
        end
    end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate( player, csid, option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 0x000f) then
        lightCutsceneUpdate(player); -- Quest: I Can Hear A Rainbow
    end
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish( player, csid, option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 0x000f) then
        lightCutsceneFinish(player); -- Quest: I Can Hear A Rainbow
    elseif (csid == 0x000E) then
        player:setVar("UnderOathCS",8); -- Quest: Under Oath - PLD AF3
    end
end;