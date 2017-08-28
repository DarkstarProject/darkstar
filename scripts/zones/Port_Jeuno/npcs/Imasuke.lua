-----------------------------------
-- Area: Port Jeuno
-- NPC: Imasuke
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
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    local theAntiqueCollector = player:getQuestStatus(JEUNO,THE_ANTIQUE_COLLECTOR);

    -- THE ANTIQUE COLLECTOR (kaiser sword)
    if (theAntiqueCollector == QUEST_ACCEPTED and trade:hasItemQty(16631,1) and trade:getItemCount() == 1) then
        player:startEvent(0x000f); -- End quest
    end;
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local circleOfTime = player:getQuestStatus(JEUNO,THE_CIRCLE_OF_TIME);
    local theAntiqueCollector = player:getQuestStatus(JEUNO,THE_ANTIQUE_COLLECTOR);
    local circleProgress = player:getVar("circleTime");

    -- CIRCLE OF TIME
    if (circleOfTime == QUEST_ACCEPTED) then
        if (circleProgress == 1) then
            player:startEvent(0x1E);
        elseif (circleProgress == 2) then
            player:startEvent(0x1D);
        elseif (circleProgress == 3) then
            player:startEvent(0x20);
        elseif (circleProgress == 4) then
            player:startEvent(0x21);
        elseif (circleProgress == 5) then
            player:startEvent(0x1F);
        end;

    -- THE ANTIQUE COLLECTOR
    elseif (theAntiqueCollector == QUEST_AVAILABLE and player:getFameLevel(JEUNO) >= 3) then
        player:startEvent(0x000d); -- Start quest
    elseif (theAntiqueCollector == QUEST_ACCEPTED) then
        player:startEvent(0x000e); -- Mid CS

    -- DEFAULT DIALOG
    else
        player:startEvent(0x000c);
    end;
end;


-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- THE ANTIQUE COLLECTOR
    if (csid == 0x000d and option == 1) then
        player:addQuest(JEUNO,THE_ANTIQUE_COLLECTOR);
    elseif (csid == 0x000f) then
        player:addTitle(TRADER_OF_ANTIQUITIES);
        if (player:hasKeyItem(MAP_OF_DELKFUTTS_TOWER) == false) then
            player:addKeyItem(MAP_OF_DELKFUTTS_TOWER);
            player:messageSpecial(KEYITEM_OBTAINED,MAP_OF_DELKFUTTS_TOWER);
        end;
        player:addFame(JEUNO, 30);
        player:tradeComplete(trade);
        player:completeQuest(JEUNO,THE_ANTIQUE_COLLECTOR);

    -- CIRCLE OF TIME
    elseif (csid == 0x1D and option == 1) then
        player:setVar("circleTime",3);
    elseif (csid == 0x1E and option == 1) then
        player:setVar("circleTime",3);
    elseif (csid == 0x1E and option == 0) then
        player:setVar("circleTime",2);
    elseif (csid == 0x21) then
        player:setVar("circleTime",5);
    end;
end;
