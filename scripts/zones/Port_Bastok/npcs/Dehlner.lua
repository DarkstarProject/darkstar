-----------------------------------
-- Area: Port Bastok
-- NPC: Dehlner
-- Standard Info NPC
-- Invlolved in Quest: A Foreman's Best Friend
-----------------------------------

require("scripts/globals/quests");
package.loaded["scripts/zones/Port_Bastok/TextIDs"] = nil;
require("scripts/zones/Port_Bastok/TextIDs");


-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 


-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

ForemansBestFriend = player:getQuestStatus(BASTOK,A_FOREMAN_S_BEST_FRIEND);

    if (ForemansBestFriend == QUEST_ACCEPTED) then
        player:startEvent(0x006f);
    else 
        player:startEvent(0x002e);
    end
end; 


-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;


-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;