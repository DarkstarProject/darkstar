-----------------------------------
-- Area: Ru'Lud Gardens
--  NPC: Laityn
-- Involved In Quest: Recollections
-----------------------------------
require("scripts/globals/quests");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:getQuestStatus(WINDURST,RECOLLECTIONS) == QUEST_ACCEPTED and player:getVar("recollectionsQuest") == 0) then
        player:startEvent(10003); -- Option CS for "Recollections"
    else
        player:startEvent(10006);
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 10003) then
        player:setVar("recollectionsQuest",1);
    end

end;