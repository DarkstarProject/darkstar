-----------------------------------
-- Area: Ru'Lude Gardens
-- NPC:  Adolie
-- @zone 243
-- @pos -35 2 59
-----------------------------------
package.loaded["scripts/zones/RuLude_Gardens/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/quests");
require("scripts/zones/RuLude_Gardens/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local WildcatJeuno = player:getVar("WildcatJeuno");
    if (player:getQuestStatus(JEUNO,LURE_OF_THE_WILDCAT_JEUNO) == QUEST_ACCEPTED and player:getMaskBit(WildcatJeuno,3) == false) then
        player:startEvent(10091);
    else
        player:startEvent(0x001e); -- Standard dialog
    end
end;

-- 0x0018  0x001e  0x001f  0x0020  0x009e  0x0062  0x009d  0x0061  0x0064  0x276b

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
    if (csid == 10091) then
        player:setMaskBit(player:getVar("WildcatJeuno"),"WildcatJeuno",3,true);
    end
end;
