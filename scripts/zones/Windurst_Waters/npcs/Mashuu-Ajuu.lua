-----------------------------------
-- Area: Windurst Waters
--  NPC: Mashuu-Ajuu
-- Starts and Finished Quest: Reap What You Sow
-- Involved in Quest: Making the Grade
-- Working 100% 
--  @zone = 238
--  @pos = 129 -6 167
-----------------------------------
package.loaded["scripts/zones/Windurst_Waters/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/keyitems");    
require("scripts/zones/Windurst_Waters/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    local reapstatus = player:getQuestStatus(WINDURST,REAP_WHAT_YOU_SOW);
    if (reapstatus >= 1 and trade:getItemCount() == 1 and trade:getGil() == 0) then
        if (trade:hasItemQty(4565,1) == true) then
            player:startEvent(0x01db,500,131);                     -- REAP WHAT YOU SOW + GIL: Quest Turn In: Sobbing Fungus turned in
        elseif (trade:hasItemQty(4566,1) == true) then
            player:startEvent(0x01dd,700);                     -- REAP WHAT YOU SOW + GIL + Stationary Set: Deathball turned in    
        end
    end    
end;      

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local reapstatus = player:getQuestStatus(WINDURST,REAP_WHAT_YOU_SOW);
    if (player:getQuestStatus(WINDURST,MAKING_THE_GRADE) == QUEST_ACCEPTED) then
        player:startEvent(0x01c0); -- During Making the GRADE
    elseif (reapstatus == QUEST_AVAILABLE) then 
        rand = math.random(1,2);
        if (rand == 1) then
            player:startEvent(0x01cf,0,4565,572);                 -- REAP WHAT YOU SOW + HERB SEEDS: QUEST START
        else
            player:startEvent(0x01ad);                          -- Standard Conversation
        end
    elseif (reapstatus == QUEST_ACCEPTED) then
        rand = math.random(1,2);
        if (rand == 1) then
            player:startEvent(0x01d0,0,4565,572);                  -- REAP WHAT YOU SOW + HERB SEEDS: OBJECTIVE REMINDER
        else
            player:startEvent(0x01dc);                          -- Another Conversation During Quest
        end
    elseif (reapstatus == QUEST_COMPLETED and player:needToZone()) then 
        player:startEvent(0x01de);                              -- REAP WHAT YOU SOW: After Quest
    elseif (reapstatus == QUEST_COMPLETED and player:needToZone() == false and player:getVar("QuestReapSow_var") == 0) then 
        rand = math.random(1,2);
        if (rand == 1) then
            player:startEvent(0x01df,0,4565,572);                -- REAP WHAT YOU SOW + HERB SEEDS: REPEATABLE QUEST START
        else
            player:startEvent(0x01ad);                          -- Standard Conversation
        end
    elseif (reapstatus == QUEST_COMPLETED and player:getVar("QuestReapSow_var") == 1) then 
        rand = math.random(1,2);
        if (rand == 1) then
            player:startEvent(0x01d0,0,4565,572);                  -- REAP WHAT YOU SOW + HERB SEEDS: OBJECTIVE REMINDER
        else
            player:startEvent(0x01dc);                          -- Another Conversation During Quest
        end
    else
        player:startEvent(0x01ad);                              -- Standard Conversation
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
    if (((csid == 0x01cf and option == 3) or (csid == 0x01df and option == 3)) and player:getFreeSlotsCount() == 0) then  -- REAP WHAT YOU SOW + HERB SEEDS: QUEST START - ACCEPTED - INVENTORY FULL
        player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,572);
    elseif (csid == 0x01cf and option == 3) then                      -- REAP WHAT YOU SOW + HERB SEEDS: QUEST START - ACCEPTED
        player:addQuest(WINDURST,REAP_WHAT_YOU_SOW);
        player:addItem(572);
        player:messageSpecial(ITEM_OBTAINED,572);
    elseif ((csid == 0x01db or csid == 0x01dd) and player:getQuestStatus(WINDURST,REAP_WHAT_YOU_SOW) == QUEST_ACCEPTED and player:getFreeSlotsCount() == 0) then -- inventory full on quest turn in
        player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,131);
    elseif (csid == 0x01db) then                                -- REAP WHAT YOU SOW + 500 GIL: Quest Turn In: Sobbing Fungus turned in
        player:addGil(GIL_RATE*500);
        player:tradeComplete(trade);
        player:needToZone(true);
        if (player:getQuestStatus(WINDURST,REAP_WHAT_YOU_SOW) == QUEST_ACCEPTED) then
            player:completeQuest(WINDURST,REAP_WHAT_YOU_SOW);
            player:addFame(WINDURST,75);
            player:addItem(131);
            player:messageSpecial(ITEM_OBTAINED,131);
        elseif (player:getQuestStatus(WINDURST,REAP_WHAT_YOU_SOW) == QUEST_COMPLETED) then
            player:addFame(WINDURST,8);
            player:setVar("QuestReapSow_var",0);
        end
    elseif (csid == 0x01dd) then                                -- REAP WHAT YOU SOW + GIL + Stationary Set: Quest Turn In: Deathball turned in
        player:addGil(GIL_RATE*700);
        player:tradeComplete(trade);
        player:needToZone(true);
        if (player:getQuestStatus(WINDURST,REAP_WHAT_YOU_SOW) == QUEST_ACCEPTED) then
            player:completeQuest(WINDURST,REAP_WHAT_YOU_SOW);
            player:addFame(WINDURST,75);
            player:addItem(131);
            player:messageSpecial(ITEM_OBTAINED,131);
        elseif (player:getQuestStatus(WINDURST,REAP_WHAT_YOU_SOW) == QUEST_COMPLETED) then
            player:addFame(WINDURST,8);
            player:setVar("QuestReapSow_var",0);
        end
    elseif (csid == 0x01df and option == 3) then                 -- REAP WHAT YOU SOW + HERB SEEDS: REPEATABLE QUEST START - ACCEPTED
        player:setVar("QuestReapSow_var",1);
        player:addItem(572);
        player:messageSpecial(ITEM_OBTAINED,572);
    end
end;
