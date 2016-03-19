-----------------------------------
-- Area: Port Bastok
-- NPC: Romilda
-- Involved in Quest: Forever to Hold
-- Starts & Ends Quest: Till Death Do Us Part
-----------------------------------
package.loaded["scripts/zones/Port_Bastok/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/titles");
require("scripts/globals/quests");
require("scripts/zones/Port_Bastok/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    
    if (trade:hasItemQty(12497,1) and trade:getItemCount() == 1) then -- Trade Brass Hairpin
        if (player:getVar("ForevertoHold_Event") == 2) then
            player:tradeComplete();
            player:startEvent(0x7D);
            player:setVar("ForevertoHold_Event",3);
        end
    elseif (trade:hasItemQty(12721,1) and trade:getItemCount() == 1) then -- Trade Cotton Gloves
        if (player:getVar("ForevertoHold_Event") == 3) then
            player:tradeComplete();
            player:startEvent(0x81);
            player:setVar("ForevertoHold_Event",4);
        end
    end
        
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

 pFame = player:getFameLevel(BASTOK);
 ForevertoHold = player:getQuestStatus(BASTOK,FOREVER_TO_HOLD);
 TilldeathdousPart = player:getQuestStatus(BASTOK,TILL_DEATH_DO_US_PART);
    
    if (pFame >= 3 and ForevertoHold == QUEST_COMPLETED and TilldeathdousPart == QUEST_AVAILABLE and player:getVar("ForevertoHold_Event") == 3) then
        player:startEvent(0x80);
    else
        player:startEvent(0x22);
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
    
    if (csid == 0x80) then
        player:addQuest(BASTOK,TILL_DEATH_DO_US_PART);
    elseif (csid == 0x81) then
        player:addTitle(QIJIS_RIVAL);
        player:addGil(GIL_RATE*2000);
        player:messageSpecial(GIL_OBTAINED,GIL_RATE*2000);
        player:addFame(BASTOK,160);
        player:completeQuest(BASTOK,TILL_DEATH_DO_US_PART);
    end
            
end;