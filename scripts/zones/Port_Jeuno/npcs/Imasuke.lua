-----------------------------------
-- Area: Port Jeuno
--  NPC: Imasuke
-- Starts and Finishes Quest: The Antique Collector
-- !pos -165 11 94 246
-----------------------------------
package.loaded["scripts/zones/Port_Jeuno/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/zones/Port_Jeuno/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
    local theAntiqueCollector = player:getQuestStatus(JEUNO,THE_ANTIQUE_COLLECTOR);

    -- THE ANTIQUE COLLECTOR (kaiser sword)
    if (theAntiqueCollector == QUEST_ACCEPTED and trade:hasItemQty(16631,1) and trade:getItemCount() == 1) then
        player:startEvent(15); -- End quest
    end;
end;

function onTrigger(player,npc)
    local circleOfTime = player:getQuestStatus(JEUNO,THE_CIRCLE_OF_TIME);
    local theAntiqueCollector = player:getQuestStatus(JEUNO,THE_ANTIQUE_COLLECTOR);
    local circleProgress = player:getVar("circleTime");

    -- CIRCLE OF TIME
    if (circleOfTime == QUEST_ACCEPTED) then
        if (circleProgress == 1) then
            player:startEvent(30);
        elseif (circleProgress == 2) then
            player:startEvent(29);
        elseif (circleProgress == 3) then
            player:startEvent(32);
        elseif (circleProgress == 4) then
            player:startEvent(33);
        elseif (circleProgress == 5) then
            player:startEvent(31);
        end;

    -- THE ANTIQUE COLLECTOR
    elseif (theAntiqueCollector == QUEST_AVAILABLE and player:getFameLevel(JEUNO) >= 3) then
        player:startEvent(13); -- Start quest
    elseif (theAntiqueCollector == QUEST_ACCEPTED) then
        player:startEvent(14); -- Mid CS

    -- DEFAULT DIALOG
    else
        player:startEvent(12);
    end;
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    -- THE ANTIQUE COLLECTOR
    if (csid == 13 and option == 1) then
        player:addQuest(JEUNO,THE_ANTIQUE_COLLECTOR);
    elseif (csid == 15) then
        player:addTitle(TRADER_OF_ANTIQUITIES);
        if (player:hasKeyItem(MAP_OF_DELKFUTTS_TOWER) == false) then
            player:addKeyItem(MAP_OF_DELKFUTTS_TOWER);
            player:messageSpecial(KEYITEM_OBTAINED,MAP_OF_DELKFUTTS_TOWER);
        end;
        player:addFame(JEUNO, 30);
        player:tradeComplete(trade);
        player:completeQuest(JEUNO,THE_ANTIQUE_COLLECTOR);

    -- CIRCLE OF TIME
    elseif (csid == 29 and option == 1) then
        player:setVar("circleTime",3);
    elseif (csid == 30 and option == 1) then
        player:setVar("circleTime",3);
    elseif (csid == 30 and option == 0) then
        player:setVar("circleTime",2);
    elseif (csid == 33) then
        player:setVar("circleTime",5);
    end;
end;
