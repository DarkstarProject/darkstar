-----------------------------------
-- Area: Port Jeuno
--  NPC: Karl
-- Starts and Finishes Quest: Child's Play
-- !pos -60 0.1 -8 246
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
    if (player:getQuestStatus(JEUNO,CHILD_S_PLAY) == QUEST_ACCEPTED and trade:hasItemQty(776,1) == true and trade:getItemCount() == 1) then
        player:startEvent(1); -- Finish quest
    end
end;

function onTrigger(player,npc)
    local ChildsPlay = player:getQuestStatus(JEUNO,CHILD_S_PLAY);
    local WildcatJeuno = player:getVar("WildcatJeuno");

    if (player:getQuestStatus(JEUNO,LURE_OF_THE_WILDCAT_JEUNO) == QUEST_ACCEPTED and player:getMaskBit(WildcatJeuno,16) == false) then
        player:startEvent(316);
    elseif (player:getQuestStatus(JEUNO,THE_WONDER_MAGIC_SET) == QUEST_ACCEPTED and ChildsPlay == QUEST_AVAILABLE) then
        player:startEvent(0); -- Start quest
    elseif (ChildsPlay == QUEST_ACCEPTED) then
        player:startEvent(61); -- mid quest CS
    else
        player:startEvent(58); -- Standard dialog
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 0) then
        player:addQuest(JEUNO,CHILD_S_PLAY);
    elseif (csid == 1) then
        player:addTitle(TRADER_OF_MYSTERIES);
        player:addKeyItem(WONDER_MAGIC_SET);
        player:messageSpecial(KEYITEM_OBTAINED,WONDER_MAGIC_SET);
        player:addFame(JEUNO, 30);
        player:tradeComplete(trade);
        player:completeQuest(JEUNO,CHILD_S_PLAY);
    elseif (csid == 316) then
        player:setMaskBit(player:getVar("WildcatJeuno"),"WildcatJeuno",16,true);
    end
end;