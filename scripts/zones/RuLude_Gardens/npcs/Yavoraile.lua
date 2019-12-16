-----------------------------------
-- Area: Ru'Lud Gardens
--  NPC: Yavoraile
-- Standard Info NPC
-----------------------------------
require("scripts/globals/quests");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local WildcatJeuno = player:getCharVar("WildcatJeuno");
    if (player:getQuestStatus(JEUNO,dsp.quest.id.jeuno.LURE_OF_THE_WILDCAT) == QUEST_ACCEPTED and player:getMaskBit(WildcatJeuno,4) == false) then
        player:startEvent(10092);
    else
        player:startEvent(118);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 10092) then
        player:setMaskBit(player:getCharVar("WildcatJeuno"),"WildcatJeuno",4,true);
    end
end;
