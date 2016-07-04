-----------------------------------
-- Area: Windurst Waters
--  NPC: Ranpi-Monpi
-- Starts and Finishes Quest: A Crisis in the Making
-- Involved in quest: In a Stew, For Want of a Pot, The Dawn of Delectability
--  @zone = 238
--  @pos = -116 -3 52  (outside the shop he is in)
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

    IASvar = player:getVar("IASvar");
    
    -- In a Stew
    if (IASvar == 3) then
        count = trade:getItemCount();
        if (trade:hasItemQty(4373,3) and count == 3) then
            player:startEvent(0x022C); -- Correct items given, advance quest
        else
            player:startEvent(0x022B,0,4373); -- incorrect or not enough, play reminder dialog
        end
    
    end
    
end;      

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    crisisstatus = player:getQuestStatus(WINDURST,A_CRISIS_IN_THE_MAKING);
    IAS = player:getQuestStatus(WINDURST,IN_A_STEW);
    IASvar = player:getVar("IASvar");
    
    -- In a Stew
    if (IAS == QUEST_ACCEPTED and IASvar == 2) then
        player:startEvent(0x022A,0,4373);                    -- start fetch portion of quest
    elseif (IAS == QUEST_ACCEPTED and IASvar == 3) then
        player:startEvent(0x022B,0,4373);                    -- reminder dialog
    elseif (IAS == QUEST_ACCEPTED and IASvar == 4) then
        player:startEvent(0x022D);                             -- new dialog before finish of quest
    
    -- A Crisis in the Making
    elseif (crisisstatus == QUEST_AVAILABLE and player:getFameLevel(WINDURST) >= 2 and player:needToZone() == false) then -- A Crisis in the Making + ITEM: Quest Offer
        player:startEvent(0x0102,0,625); 
    elseif (crisisstatus == QUEST_ACCEPTED) then
        prog = player:getVar("QuestCrisisMaking_var");
        if (prog == 1) then -- A Crisis in the Making: Quest Objective Reminder
            player:startEvent(0x0106,0,625); 
        elseif (prog == 2) then -- A Crisis in the Making: Quest Finish
            player:startEvent(0x010b); 
        end
    elseif (crisisstatus == QUEST_COMPLETED and player:needToZone() == false and player:getVar("QuestCrisisMaking_var") == 0) then  -- A Crisis in the Making + ITEM: Repeatable Quest Offer
        player:startEvent(0x0103,0,625); 
    elseif (crisisstatus == QUEST_COMPLETED and player:getVar("QuestCrisisMaking_var") == 1) then  -- A Crisis in the Making: Quest Objective Reminder
        player:startEvent(0x0106,0,625); 
    elseif (crisisstatus == QUEST_COMPLETED and player:getVar("QuestCrisisMaking_var") == 2) then -- A Crisis in the Making: Repeatable Quest Finish
        player:startEvent(0x010c); 
    else
    --Standard dialogs
        rand = math.random(1,3);
        if (rand == 1) then  -- STANDARD CONVO: sings song about ingredients
            player:startEvent(0x00f9); 
        elseif (rand == 2) then   -- STANDARD CONVO 2: sings song about ingredients
            player:startEvent(0x00fb);
        elseif (rand == 3) then   -- STANDARD CONVO 3:
            player:startEvent(0x0100);
        end
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
    
    -- A Crisis in the Making
    if (csid == 0x0102 and option == 1) then  -- A Crisis in the Making + ITEM: Quest Offer - ACCEPTED
        player:addQuest(WINDURST,A_CRISIS_IN_THE_MAKING);
        player:setVar("QuestCrisisMaking_var",1);
        player:needToZone(true);        
    elseif (csid == 0x0102 and option == 2) then  -- A Crisis in the Making + ITEM: Quest Offer - REFUSED
        player:needToZone(true);
    elseif (csid == 0x0103 and option == 1) then  -- A Crisis in the Making + ITEM: Repeatable Quest Offer - ACCEPTED
        player:setVar("QuestCrisisMaking_var",1);
        player:needToZone(true);        
    elseif (csid == 0x0103 and option == 2) then  -- A Crisis in the Making + ITEM: Repeatable Quest Offer - REFUSED
        player:needToZone(true);
    elseif (csid == 0x010b) then -- A Crisis in the Making: Quest Finish
        player:addGil(GIL_RATE*400);
        player:messageSpecial(GIL_OBTAINED,GIL_RATE*400);        
        player:setVar("QuestCrisisMaking_var",0);
        player:delKeyItem(OFF_OFFERING);    
        player:addFame(WINDURST,75);
        player:completeQuest(WINDURST,A_CRISIS_IN_THE_MAKING);
        player:needToZone(true);        
    elseif (csid == 0x010c) then -- A Crisis in the Making: Repeatable Quest Finish
        player:addGil(GIL_RATE*400);
        player:messageSpecial(GIL_OBTAINED,GIL_RATE*400);        
        player:setVar("QuestCrisisMaking_var",0);
        player:delKeyItem(OFF_OFFERING);
        player:addFame(WINDURST,8);
        player:needToZone(true);
    
    -- In a Stew
    elseif (csid == 0x022A) then        -- start fetch portion
        player:setVar("IASvar",3);
    elseif (csid == 0x022C) then
        player:tradeComplete();
        player:setVar("IASvar",4);
        player:addKeyItem(RANPIMONPIS_SPECIAL_STEW);
        player:messageSpecial(KEYITEM_OBTAINED,RANPIMONPIS_SPECIAL_STEW);
        
    end
end;
