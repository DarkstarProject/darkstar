-----------------------------------
-- Area: Ru'Lud Gardens
--  NPC: Muhoho
-- Standard Info NPC
-----------------------------------
require("scripts/globals/quests");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local WildcatJeuno = player:getVar("WildcatJeuno");
    if (player:getQuestStatus(JEUNO,dsp.quest.id.jeuno.LURE_OF_THE_WILDCAT_JEUNO) == QUEST_ACCEPTED and player:getMaskBit(WildcatJeuno,2) == false) then
        player:startEvent(10093);
    else
        player:startEvent(152);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 10093) then
        player:setMaskBit(player:getVar("WildcatJeuno"),"WildcatJeuno",2,true);
    end
end;
