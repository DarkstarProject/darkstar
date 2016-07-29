-----------------------------------
-- Area: Port Jeuno
-- NPC: Imasuke
-- Starts and Finishes Quest: The Antique Collector
-- @zone 246
-- @pos -165 11 94
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
    if (player:getQuestStatus(JEUNO,THE_ANTIQUE_COLLECTOR) == QUEST_ACCEPTED and trade:hasItemQty(16631,1) == true and trade:getItemCount() == 1) then
        player:startEvent(0x000f); -- End quest
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    TheAntiqueCollector = player:getQuestStatus(JEUNO,THE_ANTIQUE_COLLECTOR);
    local circleOfTime = player:getQuestStatus(JEUNO,THE_CIRCLE_OF_TIME);



    if (circleOfTime == QUEST_ACCEPTED) then

        if (player:getVar("circleTime") == 1) then
            player:startEvent(0x1E);
        elseif (player:getVar("circleTime") == 2) then
            player:startEvent(0x1D);
        elseif (player:getVar("circleTime") == 3) then
            player:startEvent(0x20);
        elseif (player:getVar("circleTime") == 4) then
            player:startEvent(0x21);
        elseif (player:getVar("circleTime") == 5) then
            player:startEvent(0x1F);
        end
    elseif (player:getFameLevel(JEUNO) >= 3 and TheAntiqueCollector == QUEST_AVAILABLE) then
        player:startEvent(0x000d); -- Start quest
    elseif (TheAntiqueCollector == QUEST_ACCEPTED) then
        player:startEvent(0x000e); -- Mid CS
    else
        player:startEvent(0x000c); -- Standard dialog
    end
    --end
end;


-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 0x000d and option == 1) then
        player:addQuest(JEUNO,THE_ANTIQUE_COLLECTOR);
    elseif (csid == 0x000f) then
        player:addTitle(TRADER_OF_ANTIQUITIES);
        if (player:hasKeyItem(MAP_OF_DELKFUTTS_TOWER) == false) then
            player:addKeyItem(MAP_OF_DELKFUTTS_TOWER);
            player:messageSpecial(KEYITEM_OBTAINED,MAP_OF_DELKFUTTS_TOWER);
        end
        player:addFame(JEUNO, 30);
        player:tradeComplete(trade);
        player:completeQuest(JEUNO,THE_ANTIQUE_COLLECTOR);
    elseif (csid == 0x1D and option == 1) then
        player:setVar("circleTime",3);
    elseif (csid == 0x1E and option == 1) then
        player:setVar("circleTime",3);
    elseif (csid == 0x1E and option == 0) then
        player:setVar("circleTime",2);
    elseif (csid == 0x21) then
        player:setVar("circleTime",5);
    end
end;



