-----------------------------------
-- Area: Ru'Lud Gardens
--  NPC: Yavoraile
-- Standard Info NPC
-----------------------------------
package.loaded["scripts/zones/RuLude_Gardens/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/RuLude_Gardens/TextIDs");
require("scripts/globals/quests");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local WildcatJeuno = player:getVar("WildcatJeuno");
    if (player:getQuestStatus(JEUNO,LURE_OF_THE_WILDCAT_JEUNO) == QUEST_ACCEPTED and player:getMaskBit(WildcatJeuno,4) == false) then
        player:startEvent(10092);
    else
        player:startEvent(118);
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 10092) then
        player:setMaskBit(player:getVar("WildcatJeuno"),"WildcatJeuno",4,true);
    end
end;
