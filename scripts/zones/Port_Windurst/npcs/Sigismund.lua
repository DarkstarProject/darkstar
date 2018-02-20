-----------------------------------
-- Area: Windurst Waters
--  NPC: Sigismund
-- Starts and Finishes Quest: To Catch a Falling Star
-- !pos -110 -10 82 240
-----------------------------------
package.loaded["scripts/zones/Port_Windurst/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Port_Windurst/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/globals/titles");
require("scripts/globals/status");
-----------------------------------

function onTrade(player,npc,trade)
    starstatus = player:getQuestStatus(WINDURST,TO_CATCH_A_FALLIHG_STAR);
    if (starstatus == 1 and trade:hasItemQty(546,1) == true and trade:getItemCount() == 1 and trade:getGil() == 0) then
        player:startEvent(199); -- Quest Finish
    end
end;

function onTrigger(player,npc)
    starstatus = player:getQuestStatus(WINDURST,TO_CATCH_A_FALLIHG_STAR);
    if (starstatus == QUEST_AVAILABLE) then
        player:startEvent(196,0,546); -- Quest Start
    elseif (starstatus == QUEST_ACCEPTED) then
        player:startEvent(197,0,546); -- Quest Reminder
    elseif (starstatus == QUEST_COMPLETED and player:getVar("QuestCatchAFallingStar_prog") > 0) then
        player:startEvent(200); -- After Quest
        player:setVar("QuestCatchAFallingStar_prog",0)
    else
        player:startEvent(357);
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 196) then
        player:addQuest(WINDURST,TO_CATCH_A_FALLIHG_STAR);
    elseif (csid == 199) then
        player:tradeComplete(trade);
        player:completeQuest(WINDURST,TO_CATCH_A_FALLIHG_STAR);
        player:addFame(WINDURST,75);
        player:addItem(12316);
        player:messageSpecial(ITEM_OBTAINED,12316);
        player:setVar("QuestCatchAFallingStar_prog",2);
    end
end;



