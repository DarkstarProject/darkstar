-----------------------------------
-- Area: Port Jeuno
--  NPC: Karl
-- Starts and Finishes Quest: Child's Play
-- !pos -60 0.1 -8 246
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/shop");
require("scripts/globals/quests");
local ID = require("scripts/zones/Port_Jeuno/IDs");
-----------------------------------

function onTrade(player,npc,trade)
    if (player:getQuestStatus(JEUNO,dsp.quest.id.jeuno.CHILD_S_PLAY) == QUEST_ACCEPTED and trade:hasItemQty(776,1) == true and trade:getItemCount() == 1) then
        player:startEvent(1); -- Finish quest
    end
end;

function onTrigger(player,npc)
    local ChildsPlay = player:getQuestStatus(JEUNO,dsp.quest.id.jeuno.CHILD_S_PLAY);
    local WildcatJeuno = player:getVar("WildcatJeuno");

    if (player:getQuestStatus(JEUNO,dsp.quest.id.jeuno.LURE_OF_THE_WILDCAT_JEUNO) == QUEST_ACCEPTED and player:getMaskBit(WildcatJeuno,16) == false) then
        player:startEvent(316);
    elseif (player:getQuestStatus(JEUNO,dsp.quest.id.jeuno.THE_WONDER_MAGIC_SET) == QUEST_ACCEPTED and ChildsPlay == QUEST_AVAILABLE) then
        player:startEvent(0); -- Start quest
    elseif (ChildsPlay == QUEST_ACCEPTED) then
        player:startEvent(61); -- mid quest CS
    else
        player:startEvent(58); -- Standard dialog
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 0) then
        player:addQuest(JEUNO,dsp.quest.id.jeuno.CHILD_S_PLAY);
    elseif (csid == 1) then
        player:addTitle(dsp.title.TRADER_OF_MYSTERIES);
        player:addKeyItem(dsp.ki.WONDER_MAGIC_SET);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.WONDER_MAGIC_SET);
        player:addFame(JEUNO, 30);
        player:tradeComplete(trade);
        player:completeQuest(JEUNO,dsp.quest.id.jeuno.CHILD_S_PLAY);
    elseif (csid == 316) then
        player:setMaskBit(player:getVar("WildcatJeuno"),"WildcatJeuno",16,true);
    end
end;