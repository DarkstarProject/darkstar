-----------------------------------
-- Area: Davoi
--  NPC: Jar
-- Involved in Quest: Test my Mettle
-- Notes: Used to obtain Power Sandals
-- !pos 183, 0, -190 149
-----------------------------------
package.loaded["scripts/zones/Davoi/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/zones/Davoi/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local POWER_SANDALS = 13012;

    -- Give Player Power Sandals if they don't have them
    if (player:hasItem(POWER_SANDALS) == false) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED, POWER_SANDALS);
        else
            player:addItem(POWER_SANDALS);
            player:messageSpecial(ITEM_OBTAINED, POWER_SANDALS);
        end
    else
        player:messageSpecial(NOTHING_OUT_OF_THE_ORDINARY);
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID2: %u",csid);
    -- printf("RESULT2: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;
