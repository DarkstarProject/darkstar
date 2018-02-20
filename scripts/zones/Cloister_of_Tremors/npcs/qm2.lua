-----------------------------------
-- Area: Cloister of Tremors
--  NPC: qm2 (???)
-- Involved in Quest: Open Sesame
-- Notes: Used to obtain a Tremor Stone
-- !pos -545.184,1.855,-495.693 209
-----------------------------------
package.loaded["scripts/zones/Cloister_of_Tremors/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/zones/Cloister_of_Tremors/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local TREMORSTONE = 2796;

    -- Give Player a Tremorstone if they don't have one
    if (player:hasItem(TREMORSTONE) == false) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,TREMORSTONE);
        else
            player:addItem(TREMORSTONE);
            player:messageSpecial(ITEM_OBTAINED, TREMORSTONE);
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
