-----------------------------------
-- Area: Windurst Walls
-- NPC: Ambrosius
-- 
-- Quest NPC for "The Postman Always KOs Twice"
-----------------------------------
package.loaded["scripts/zones/Windurst_Walls/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/zones/Windurst_Walls/TextIDs");

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    QuestStatus = player:getQuestStatus(WINDURST,THE_POSTMAN_ALWAYS_KO_S_TWICE);

    if (QuestStatus == QUEST_AVAILABLE) then
        player:startEvent(0x0030);
    elseif (QuestStatus == QUEST_ACCEPTED) then
        player:startEvent(0x0031);
    elseif (QuestStatus == QUEST_COMPLETED) then
        player:startEvent(0x0038);
    end
end;

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    QuestStatus = player:getQuestStatus(WINDURST,THE_POSTMAN_ALWAYS_KO_S_TWICE);

    if (QuestStatus ~= QUEST_AVAILABLE) then
        reward = 0;
        
        if (trade:hasItemQty(584,1)) then reward = reward+1 end;
        if (trade:hasItemQty(585,1)) then reward = reward+1 end;
        if (trade:hasItemQty(586,1)) then reward = reward+1 end;
        if (trade:hasItemQty(587,1)) then reward = reward+1 end;
        
        if (trade:getItemCount() == reward) then
            if (reward == 1) then
                if (QuestStatus == QUEST_ACCEPTED) then
                    player:startEvent(0x0034,GIL_RATE*50);
                elseif (QuestStatus == QUEST_COMPLETED) then
                    player:startEvent(0x0039,GIL_RATE*50);
                end
            elseif (reward == 2) then
                if (QuestStatus == QUEST_ACCEPTED) then
                    player:startEvent(0x0035,GIL_RATE*150,2);
                elseif (QuestStatus == QUEST_COMPLETED) then
                    player:startEvent(0x003a,GIL_RATE*150,2);
                end
            elseif (reward == 3) then
                if (QuestStatus == QUEST_ACCEPTED) then
                    player:startEvent(0x0036,GIL_RATE*250,3);
                elseif (QuestStatus == QUEST_COMPLETED) then
                    player:startEvent(0x003b,GIL_RATE*250,3);
                end
            elseif (reward == 4) then
                if (QuestStatus == QUEST_ACCEPTED) then
                    player:startEvent(0x0037,GIL_RATE*500,4);
                elseif (QuestStatus == QUEST_COMPLETED) then
                    player:startEvent(0x003c,GIL_RATE*500,4);
                end
            end
        end
    end
end; 

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    --printf("Update CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    --printf("Finish CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 0x0030 and option == 0) then
        player:addQuest(WINDURST,THE_POSTMAN_ALWAYS_KO_S_TWICE);
    elseif (csid == 0x0034) then
        player:tradeComplete();
        player:addGil(GIL_RATE*50);
        player:addFame(WINDURST,80);
        player:completeQuest(WINDURST,THE_POSTMAN_ALWAYS_KO_S_TWICE);
    elseif (csid == 0x0035) then
        player:tradeComplete();
        player:addGil(GIL_RATE*150);
        player:addFame(WINDURST,80);
        player:completeQuest(WINDURST,THE_POSTMAN_ALWAYS_KO_S_TWICE);
    elseif (csid == 0x0036) then
        player:tradeComplete();
        player:addGil(GIL_RATE*250);
        player:addFame(WINDURST,80);
        player:completeQuest(WINDURST,THE_POSTMAN_ALWAYS_KO_S_TWICE);
    elseif (csid == 0x0037) then
        player:tradeComplete();
        player:addGil(GIL_RATE*500);
        player:addFame(WINDURST,80);
        player:completeQuest(WINDURST,THE_POSTMAN_ALWAYS_KO_S_TWICE);
    elseif (csid == 0x0039) then
        player:tradeComplete();
        player:addGil(GIL_RATE*50);
        player:addFame(WINDURST,5);
    elseif (csid == 0x003a) then
        player:tradeComplete();
        player:addGil(GIL_RATE*150);
        player:addFame(WINDURST,15);
    elseif (csid == 0x003b) then
        player:tradeComplete();
        player:addGil(GIL_RATE*250);
        player:addFame(WINDURST,25);
    elseif (csid == 0x003c) then
        player:tradeComplete();
        player:addGil(GIL_RATE*500);
        player:addFame(WINDURST,50);
    end
end;




