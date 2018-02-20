-----------------------------------
-- Area: Port Bastok
--  NPC: Dehlner
-- Standard Info NPC
-- Invlolved in Quest: A Foreman's Best Friend
-----------------------------------
require("scripts/globals/quests");
package.loaded["scripts/zones/Port_Bastok/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Port_Bastok/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

ForemansBestFriend = player:getQuestStatus(BASTOK,A_FOREMAN_S_BEST_FRIEND);

    if (ForemansBestFriend == QUEST_ACCEPTED) then
        player:startEvent(111);
    else
        player:startEvent(46);
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