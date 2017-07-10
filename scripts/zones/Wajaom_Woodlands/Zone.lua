-----------------------------------
--
-- Zone: Wajaom_Woodlands (51)
--
-----------------------------------
package.loaded["scripts/zones/Wajaom_Woodlands/TextIDs"] = nil;
package.loaded["scripts/globals/chocobo_digging"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/missions");
require("scripts/globals/quests");
require("scripts/globals/titles");
require("scripts/zones/Wajaom_Woodlands/TextIDs");
require("scripts/globals/chocobo_digging");

-----------------------------------
-- Chocobo Digging vars
-----------------------------------
local itemMap = {
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
                    { 1255, 10, DIGREQ_NONE }, -- all ores
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
end;

-----------------------------------
-- onZoneIn
-----------------------------------

function onZoneIn(player,prevZone)
    local cs = -1;
    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        if (player:getCurrentMission(TOAU) == UNRAVELING_REASON) then
            player:setPos(-200.036,-10,79.948,254);
            cs = 11;
        else
            player:setPos(610.542,-28.547,356.247,122);
        end
    elseif (player:getVar("threemenandaclosetCS") == 2 and prevZone == 50) then
        cs = 0x01fe;
    end
    return cs;
end;

-----------------------------------
-- onRegionEnter
-----------------------------------

function onRegionEnter(player,region)
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("Update CSID: %u",csid);
    -- printf("Update RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("Finish CSID: %u",csid);
    -- printf("Finish RESULT: %u",option);
    if (csid == 0x01fe) then
        player:setVar("threemenandaclosetCS",3);
    elseif (csid == 11) then
        player:startEvent(21);
    elseif (csid == 21) then
        player:startEvent(22);
    elseif (csid == 22) then
        player:completeMission(TOAU,UNRAVELING_REASON);
        player:setTitle(ENDYMION_PARATROOPER);
        player:setVar("TOAUM40_STARTDAY", 0);
        player:addMission(TOAU,LIGHT_OF_JUDGMENT);
    end
end;
