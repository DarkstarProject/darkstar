-----------------------------------
-- Area: Selbina
-- NPC:  Romeo
-- Starts and Finishes Quest: Donate to Recycling
-- @zone 248
-- @pos -11 -11 -6
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
    if (player:getQuestStatus(OTHER_AREAS,DONATE_TO_RECYCLING) == QUEST_ACCEPTED) then
        if ((trade:hasItemQty(16482,5) == true or trade:hasItemQty(16483,5) == true or trade:hasItemQty(16534,5) == true or 
            trade:hasItemQty(17068,5) == true or trade:hasItemQty(17104,5) == true) and trade:getGil() == 0 and trade:getItemCount() == 5) then 
            player:startEvent(0x0015); -- Finish quest "Donate to Recycling"
        end
    end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    DonateToRecycling = player:getQuestStatus(OTHER_AREAS,DONATE_TO_RECYCLING);
    
    if (DonateToRecycling == QUEST_AVAILABLE) then
        player:startEvent(0x0014); -- Start quest "Donate to Recycling"
    elseif (DonateToRecycling == QUEST_ACCEPTED) then
        player:startEvent(0x0016); -- During quest "Donate to Recycling"
    else
        player:startEvent(0x0017); -- Standard dialog
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
    if (csid == 0x0014) then
        player:addQuest(OTHER_AREAS,DONATE_TO_RECYCLING);
    elseif (csid == 0x0015) then
        if (player:getFreeSlotsCount() == 0) then 
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,89);
        else 
            player:completeQuest(OTHER_AREAS,DONATE_TO_RECYCLING);
            player:addTitle(ECOLOGIST);
            player:addItem(89);
            player:messageSpecial(ITEM_OBTAINED,89); -- Wastebasket
            player:addFame(OTHER_AREAS,30);
            player:tradeComplete();
        end
    end
end;



