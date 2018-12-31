-----------------------------------
-- Area: Selbina
--  NPC: Romeo
-- Starts and Finishes Quest: Donate to Recycling
-- !pos -11 -11 -6 248
-----------------------------------
local ID = require("scripts/zones/Selbina/IDs");
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/quests");
-----------------------------------

function onTrade(player,npc,trade)
    if (player:getQuestStatus(OTHER_AREAS_LOG,DONATE_TO_RECYCLING) == QUEST_ACCEPTED) then
        if ((trade:hasItemQty(16482,5) == true or trade:hasItemQty(16483,5) == true or trade:hasItemQty(16534,5) == true or
            trade:hasItemQty(17068,5) == true or trade:hasItemQty(17104,5) == true) and trade:getGil() == 0 and trade:getItemCount() == 5) then
            player:startEvent(21); -- Finish quest "Donate to Recycling"
        end
    end
end;

function onTrigger(player,npc)
    DonateToRecycling = player:getQuestStatus(OTHER_AREAS_LOG,DONATE_TO_RECYCLING);

    if (DonateToRecycling == QUEST_AVAILABLE) then
        player:startEvent(20); -- Start quest "Donate to Recycling"
    elseif (DonateToRecycling == QUEST_ACCEPTED) then
        player:startEvent(22); -- During quest "Donate to Recycling"
    else
        player:startEvent(23); -- Standard dialog
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 20) then
        player:addQuest(OTHER_AREAS_LOG,DONATE_TO_RECYCLING);
    elseif (csid == 21) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,89);
        else
            player:completeQuest(OTHER_AREAS_LOG,DONATE_TO_RECYCLING);
            player:addTitle(dsp.title.ECOLOGIST);
            player:addItem(89);
            player:messageSpecial(ID.text.ITEM_OBTAINED,89); -- Wastebasket
            player:addFame(SELBINA,30);
            player:tradeComplete();
        end
    end
end;
