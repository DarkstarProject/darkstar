-----------------------------------
-- Area: Ru'Lud Gardens
-- NPC:  Laityn
-- Involved In Quest: Recollections
-----------------------------------

require("scripts/globals/quests");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
    if (player:getQuestStatus(WINDURST,RECOLLECTIONS) == QUEST_ACCEPTED and player:getVar("recollectionsQuest") == 0) then
        player:startEvent(10003); -- Option CS for "Recollections"
    else
        player:startEvent(10006);
    end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    
    if (csid == 10003) then
        player:setVar("recollectionsQuest",1);
    end
    
end;