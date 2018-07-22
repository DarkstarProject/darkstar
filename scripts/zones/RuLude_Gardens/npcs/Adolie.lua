-----------------------------------
-- Area: Ru'Lude Gardens
--  NPC: Adolie
-- !pos -35 2 59 243
-----------------------------------
package.loaded["scripts/zones/RuLude_Gardens/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/quests");
require("scripts/zones/RuLude_Gardens/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local WildcatJeuno = player:getVar("WildcatJeuno");
    if (player:getQuestStatus(JEUNO,LURE_OF_THE_WILDCAT_JEUNO) == QUEST_ACCEPTED and player:getMaskBit(WildcatJeuno,3) == false) then
        player:startEvent(10091);
    else
        player:startEvent(30); -- Standard dialog
    end
end;

-- 24  30  31  32  158  98  157  97  100  10091
function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 10091) then
        player:setMaskBit(player:getVar("WildcatJeuno"),"WildcatJeuno",3,true);
    end
end;
