-----------------------------------
-- Area: West Ronfaure
--  NPC: Aaveleon
-- Involved in Quest: A Sentry's Peril
-- !pos -431 -45 343 100
-----------------------------------
package.loaded["scripts/zones/West_Ronfaure/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/zones/West_Ronfaure/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)

    if (player:getQuestStatus(SANDORIA,A_SENTRY_S_PERIL) == QUEST_ACCEPTED) then
        if (trade:hasItemQty(600,1) and trade:getItemCount() == 1) then
            player:startEvent(100);
        else
            player:startEvent(118);
        end
    end

end;

function onTrigger(player,npc)
    player:startEvent(101);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 100) then
        player:tradeComplete();
        player:addItem(601);
        player:messageSpecial(ITEM_OBTAINED,601);
    end

end;

