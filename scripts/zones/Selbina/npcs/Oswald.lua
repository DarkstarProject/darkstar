-----------------------------------
-- Area: Selbina
-- NPC: Oswald
-- Starts and Finishes Quest: Under the sea (finish), The gift, The real gift
-- @pos 48 -15 9 248
-----------------------------------
package.loaded["scripts/zones/Selbina/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Selbina/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/quests");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    if (player:getQuestStatus(OTHER_AREAS,THE_GIFT) == QUEST_ACCEPTED) then 
        if (trade:hasItemQty(4375,1) == true and trade:getGil() == 0 and trade:getItemCount() == 1) then 
            player:startEvent(0x0048,0,4375); -- Finish quest "The gift"
        end
    elseif (player:getQuestStatus(OTHER_AREAS,THE_REAL_GIFT) == QUEST_ACCEPTED) then 
        if (trade:hasItemQty(4484,1) == true and trade:getGil() == 0 and trade:getItemCount() == 1) then 
            player:startEvent(0x004b); -- Finish quest "The real gift"
        end
    end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    UnderTheSea = player:getQuestStatus(OTHER_AREAS,UNDER_THE_SEA);
    TheSandCharm = player:getQuestStatus(OTHER_AREAS,THE_SAND_CHARM);
    TheGift = player:getQuestStatus(OTHER_AREAS,THE_GIFT);
    TheRealGift = player:getQuestStatus(OTHER_AREAS,THE_REAL_GIFT);
    
    if (player:getVar("underTheSeaVar") == 1) then 
        player:startEvent(0x0020); -- During quest "Under the sea" - 1st dialog
    elseif (player:hasKeyItem(ETCHED_RING) == true) then 
        player:startEvent(0x0025); -- Finish quest "Under the sea"
    elseif (UnderTheSea == QUEST_COMPLETED and TheSandCharm == QUEST_AVAILABLE) then 
        player:startEvent(0x0026); -- New dialog after "Under the sea"
    elseif (UnderTheSea == QUEST_COMPLETED and TheSandCharm ~= QUEST_AVAILABLE and TheGift == QUEST_AVAILABLE) then 
        player:startEvent(0x0046,4375); -- Start quest "The gift"
    elseif (TheGift == QUEST_ACCEPTED) then 
        player:startEvent(0x0047); -- During quest "The gift"
    elseif (TheGift == QUEST_COMPLETED and TheSandCharm == QUEST_ACCEPTED) then 
        player:startEvent(0x004e); -- New dialog after "The gift"
    elseif (TheGift == QUEST_COMPLETED and TheSandCharm == QUEST_COMPLETED and TheRealGift == QUEST_AVAILABLE) then 
        player:startEvent(0x0049,4484); -- Start quest "The real gift"
    elseif (TheRealGift == QUEST_ACCEPTED) then 
        player:startEvent(0x004a,4484); -- During quest "The real gift"
    elseif (TheRealGift == QUEST_COMPLETED) then 
        player:startEvent(0x004c); -- Final dialog after "The real gift"
    else
        player:startEvent(0x001e); -- Standard dialog
    end

end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
    if (csid == 0x0020) then 
        player:setVar("underTheSeaVar",2);
    elseif (csid == 0x0025) then 
        if (player:getFreeSlotsCount() == 0) then 
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,13335);
        else 
            player:completeQuest(OTHER_AREAS,UNDER_THE_SEA);
            player:addTitle(LIL_CUPID);
            player:delKeyItem(ETCHED_RING);
            player:setVar("underTheSeaVar",0);
            player:addItem(13335);
            player:messageSpecial(ITEM_OBTAINED,13335); -- Amber Earring
            player:addFame(OTHER_AREAS,30);
        end
    elseif (csid == 0x0046 and option == 50) then
        player:addQuest(OTHER_AREAS,THE_GIFT);
    elseif (csid == 0x0048) then
        if (player:getFreeSlotsCount() == 0) then 
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,16497);
        else 
            player:completeQuest(OTHER_AREAS,THE_GIFT);
            player:addTitle(SAVIOR_OF_LOVE);
            player:addItem(16497);
            player:messageSpecial(ITEM_OBTAINED,16497); -- Sleep Dagger
            player:addFame(OTHER_AREAS,30);
            player:tradeComplete();
        end
    elseif (csid == 0x0049 and option == 50) then
        player:addQuest(OTHER_AREAS,THE_REAL_GIFT);
    elseif (csid == 0x004b) then
        if (player:getFreeSlotsCount() == 0) then 
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,17385);
        else 
            player:completeQuest(OTHER_AREAS,THE_REAL_GIFT);
            player:addTitle(THE_LOVE_DOCTOR);
            player:addItem(17385);
            player:messageSpecial(ITEM_OBTAINED,17385); -- Glass Fiber Fishing Rod
            player:addFame(OTHER_AREAS,30);
            player:tradeComplete();
        end
    end
end;



