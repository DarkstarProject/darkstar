-----------------------------------
-- Area: Upper Jeuno
--  NPC: Rouliette
-- Starts and Finishes Quest: Candle-making
-- @zone 244
-- !pos -24 -2 11
-----------------------------------
package.loaded["scripts/zones/Upper_Jeuno/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/zones/Upper_Jeuno/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
    if (player:getQuestStatus(JEUNO,CANDLE_MAKING) == QUEST_ACCEPTED and trade:hasItemQty(531,1) == true and trade:getItemCount() == 1) then
        player:startEvent(37);
    end
end;

function onTrigger(player,npc)
    --Prerequisites for this quest : A_CANDLELIGHT_VIGIL ACCEPTED

    if (player:getQuestStatus(JEUNO,CANDLE_MAKING) ~= QUEST_COMPLETED and
       player:getQuestStatus(JEUNO,A_CANDLELIGHT_VIGIL) == QUEST_ACCEPTED) then
        player:startEvent(36);  -- Start Quest Candle-making
    else
        player:startEvent(30);  --Standard dialog
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 36 and player:getQuestStatus(JEUNO,CANDLE_MAKING) == QUEST_AVAILABLE) then
        player:addQuest(JEUNO,CANDLE_MAKING);
    elseif (csid == 37) then
        player:addTitle(BELIEVER_OF_ALTANA);
        player:addKeyItem(HOLY_CANDLE);
        player:messageSpecial(KEYITEM_OBTAINED,HOLY_CANDLE);
        player:addFame(JEUNO,30);
        player:tradeComplete(trade);
        player:completeQuest(JEUNO,CANDLE_MAKING);
    end
end;

