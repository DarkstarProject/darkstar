-----------------------------------
-- Area: West Ronfaure
--  NPC: Phairet
-- Involved in Quest: The Trader in the Forest
-- !pos -57 -1 -501 100
-----------------------------------
require("scripts/globals/quests");
local ID = require("scripts/zones/West_Ronfaure/IDs");
-----------------------------------

function onTrade(player,npc,trade)

    local theTraderInTheforest = player:getQuestStatus(SANDORIA,dsp.quest.id.sandoria.THE_TRADER_IN_THE_FOREST);

    if (theTraderInTheforest == QUEST_ACCEPTED) then
        if (trade:hasItemQty(592,1) == true and trade:getItemCount() == 1) then -- Trade Supplies Order
            player:startEvent(124);
        end
    elseif (theTraderInTheforest == QUEST_COMPLETED) then
        if (trade:getGil() == 50) then
            if (player:getFreeSlotsCount() == 0) then
                player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,4367);
            else
                player:tradeComplete();
                player:addItem(4367);
                player:messageSpecial(ID.text.ITEM_OBTAINED,4367); -- Clump of Batagreens
            end
        end
    end

end;

function onTrigger(player,npc)

    local theTraderInTheforest = player:getQuestStatus(SANDORIA,dsp.quest.id.sandoria.THE_TRADER_IN_THE_FOREST);
    local hasBatagreens = player:hasItem(4367); -- Clump of Batagreens

    if (theTraderInTheforest == QUEST_ACCEPTED) then
        if (hasBatagreens == true) then
            player:startEvent(125);
        else
            player:startEvent(117);
        end
    elseif (theTraderInTheforest == QUEST_COMPLETED or hasBatagreens == false) then
        player:startEvent(127,4367);
    else
        player:startEvent(117);
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 124) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,4367);
        else
            player:tradeComplete();
            player:addItem(4367);
            player:messageSpecial(ID.text.ITEM_OBTAINED, 4367);
        end
    end

end;