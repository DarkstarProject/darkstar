-----------------------------------
-- Area: Bastok Markets
-- NPC: Aquillina
-- Starts & Finishes Repeatable Quest: A Flash In The Pan
-- Note: Reapeatable every 15 minutes.
-----------------------------------
package.loaded["scripts/zones/Bastok_Markets/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/zones/Bastok_Markets/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

FlashInThePan = player:getQuestStatus(BASTOK,A_FLASH_IN_THE_PAN);

    if (FlashInThePan >= QUEST_ACCEPTED) then
        PreviousTime = player:getVar("FlashInThePan");
        CurrentTime  = os.time();
        
        if (CurrentTime >= PreviousTime) then
            count  = trade:getItemCount();
            FlintStone = trade:hasItemQty(768,4);
            
            if (FlintStone == true and count == 4) then
                player:startEvent(219);
            end
        else
            player:startEvent(218);
        end
    end

end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

FlashInThePan = player:getQuestStatus(BASTOK,A_FLASH_IN_THE_PAN);

    if (FlashInThePan == QUEST_AVAILABLE) then
        player:startEvent(217);
    else
        player:startEvent(116);
    end
    
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID2: %u",csid);
    -- printf("RESULT2: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 217) then
        player:addQuest(BASTOK, A_FLASH_IN_THE_PAN);        
    elseif (csid == 219) then
        FlashInThePan = player:getQuestStatus(BASTOK,A_FLASH_IN_THE_PAN);
        CompleteTime = os.time();
        
        if (FlashInThePan == QUEST_ACCEPTED) then
            player:completeQuest(BASTOK, A_FLASH_IN_THE_PAN);
            player:addFame(BASTOK,75);
        else
            player:addFame(BASTOK,8);
        end
        
        player:tradeComplete();
        player:setVar("FlashInThePan",CompleteTime + 900);
        player:addGil(GIL_RATE*100);
        player:messageSpecial(GIL_OBTAINED,GIL_RATE*100);
    end        
    
end;


