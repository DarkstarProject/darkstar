-----------------------------------
-- Area: Metalworks
--  NPC: Unlucky Rat
-- Starts & Finishes Quest: Mean Machine
-----------------------------------
package.loaded["scripts/zones/Metalworks/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/zones/Metalworks/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)

    local MeanMachine = player:getQuestStatus(BASTOK,MEAN_MACHINE);

    if (MeanMachine == QUEST_ACCEPTED) then
        local FreeSlots = player:getFreeSlotsCount();

        if (FreeSlots >= 1) then
            count = trade:getItemCount();
            SlimeOil = trade:hasItemQty(637,1);

            if (SlimeOil == true and count == 1) then
                player:startEvent(557);
            end
        else
            player:messageSpecial(FULL_INVENTORY_AFTER_TRADE, 4731);
        end
    end

end;

function onTrigger(player,npc)

    local MeanMachine = player:getQuestStatus(BASTOK,MEAN_MACHINE);
    local Fame = player:getFameLevel(BASTOK);

    if (MeanMachine == QUEST_AVAILABLE and Fame >= 2) then
        player:startEvent(556);
    elseif (MeanMachine == QUEST_ACCEPTED) then
        player:startEvent(559);
    else
        player:startEvent(550);
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID2: %u",csid);
    -- printf("RESULT2: %u",option);

end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 556) then
        player:addQuest(BASTOK,MEAN_MACHINE);
    elseif (csid == 557) then
        player:completeQuest(BASTOK,MEAN_MACHINE);
        player:addFame(BASTOK,120);
        player:tradeComplete();
        player:addItem(4869);
        player:messageSpecial(ITEM_OBTAINED,4869);
    end

end;


