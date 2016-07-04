-----------------------------------
-- Area: Bastok Mines
-- NPC: Tami
-- Starts & Finishes Repeatable Quest: Groceries
-- Note: Repeatable until proper completion
-----------------------------------
package.loaded["scripts/zones/Bastok_Mines/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/zones/Bastok_Mines/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

ViewedNote = player:getVar("GroceriesViewedNote");

    if (ViewedNote == 1) then
        count = trade:getItemCount();
        MeatJerky = trade:hasItemQty(4376,1);

        if (MeatJerky == true and count == 1) then
            player:startEvent(0x0071);
        end
    end
    
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

Groceries = player:getQuestStatus(BASTOK,GROCERIES);
GroceriesVar = player:getVar("Groceries");

    if (Groceries == QUEST_COMPLETED) then
        player:startEvent(0x0073);
    elseif (Groceries == QUEST_AVAILABLE or GroceriesVar == 0) then
        player:startEvent(0x006e);
    elseif (GroceriesVar == 1) then
        player:showText(npc,10510);
    elseif (GroceriesVar == 2) then
        player:startEvent(0x0070);
    end

end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID2: %u",csid);
--printf("RESULT2: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 0x006e) then
        Groceries = player:getQuestStatus(BASTOK,GROCERIES);
        
        if (Groceries == QUEST_AVAILABLE) then
            player:addQuest(BASTOK,GROCERIES);
        end
        player:addKeyItem(0x98);
        player:messageSpecial(KEYITEM_OBTAINED,0x98);
        player:setVar("Groceries",1);
    elseif (csid == 0x0070) then
        player:addFame(BASTOK,8);
        player:setVar("Groceries",0);
        player:addGil(GIL_RATE*10);
        player:messageSpecial(GIL_OBTAINED,GIL_RATE*10);
    elseif (csid == 0x0071) then
        FreeSlots = player:getFreeSlotsCount();
    
        if (FreeSlots >= 1) then
            player:tradeComplete();
            player:setVar("Groceries",0);
            player:setVar("GroceriesViewedNote",0);
            player:completeQuest(BASTOK,GROCERIES);
            player:addFame(BASTOK,75); 
            player:addItem(13594);
            player:messageSpecial(ITEM_OBTAINED,13594);
        else
            player:messageSpecial(FULL_INVENTORY_AFTER_TRADE,13594);
        end
    end
    
end;




