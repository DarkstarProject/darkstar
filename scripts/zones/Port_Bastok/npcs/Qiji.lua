-----------------------------------
-- Area: Port Bastok
-- NPC:  Qiji
-- Starts & Ends Quest: Forever to Hold
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
        if (player:getVar("ForevertoHold_Event") == 1) then
            player:startEvent(0x7c);
            player:setVar("ForevertoHold_Event",2);
        end
    end
        
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
    ForevertoHold = player:getQuestStatus(BASTOK,FOREVER_TO_HOLD);

     if (player:getFameLevel(BASTOK) >= 2 and ForevertoHold == QUEST_AVAILABLE) then
        player:startEvent(0x7B);
    elseif (ForevertoHold == QUEST_ACCEPTED and player:getVar("ForevertoHold_Event") == 3) then
        player:startEvent(0x7e);
    else
        player:startEvent(0x21);
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

    if (csid == 0x7b) then
        player:addQuest(BASTOK,FOREVER_TO_HOLD);
        player:setVar("ForevertoHold_Event",1);
    elseif (csid == 0x7e) then
        player:addTitle(QIJIS_FRIEND);
        player:addGil(GIL_RATE*300);
        player:messageSpecial(GIL_OBTAINED,GIL_RATE*300);
        player:addFame(BASTOK,80);
        player:completeQuest(BASTOK,FOREVER_TO_HOLD);
    end
    
end;