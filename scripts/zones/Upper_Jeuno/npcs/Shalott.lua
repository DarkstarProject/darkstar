-----------------------------------
-- Area: Upper Jeuno
--  NPC: Shalott
-- Optional Involvement in Quest: Save My Son
--------------------------------

package.loaded["scripts/zones/Upper_Jeuno/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Upper_Jeuno/TextIDs");
require("scripts/globals/quests");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:getQuestStatus(JEUNO,SAVE_MY_SON) == QUEST_ACCEPTED) then
        player:startEvent(101);
    else
        player:startEvent(104);
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