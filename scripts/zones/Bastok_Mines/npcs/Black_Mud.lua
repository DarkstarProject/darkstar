-----------------------------------
-- Area: Bastok Mines
-- NPC: Black Mud
-- Starts & Finishes Quest: Drachenfall
-----------------------------------
package.loaded["scripts/zones/Bastok_Mines/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/zones/Bastok_Mines/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

Drachenfall = player:getQuestStatus(BASTOK,DRACHENFALL);

    if (Drachenfall == QUEST_ACCEPTED) then
        count = trade:getItemCount();
        DrachenfallWater = trade:hasItemQty(492,1);

        if (DrachenfallWater == true and count == 1) then    
            player:startEvent(0x0067);
        end
    end
    
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

Drachenfall = player:getQuestStatus(BASTOK,DRACHENFALL);
Fame = player:getFameLevel(BASTOK);

    if (Drachenfall == QUEST_ACCEPTED) then
        BrassCanteen = player:hasItem(493);
        if (BrassCanteen == true) then
            player:startEvent(0x0065);
        else
            player:startEvent(0x0066);
        end
    elseif (Drachenfall == QUEST_AVAILABLE and Fame >= 2) then
        player:startEvent(0x0065);
    else
        player:startEvent(0x0064)
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

    if (csid == 0x0065) then
        Drachenfall = player:getQuestStatus(BASTOK,DRACHENFALL);
        
        if (Drachenfall == QUEST_AVAILABLE) then
            FreeSlots = player:getFreeSlotsCount();
            if (FreeSlots >= 1) then
                player:addQuest(BASTOK,DRACHENFALL);
                player:addItem(493);
                player:messageSpecial(ITEM_OBTAINED,493);
            else
                player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,493);
            end
        end
    elseif (csid == 0x0066) then
        FreeSlots = player:getFreeSlotsCount();
        if (FreeSlots >= 1) then
            player:addItem(493);
            player:messageSpecial(ITEM_OBTAINED,493);
        else
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,493);
        end
    elseif (csid == 0x0067) then
        player:tradeComplete();
        player:completeQuest(BASTOK,DRACHENFALL);
        player:addFame(BASTOK,120); 
        player:addTitle(DRACHENFALL_ASCETIC);
        player:addGil(GIL_RATE*2000);
        player:messageSpecial(GIL_OBTAINED,GIL_RATE*2000);
    end
    
end;




