-----------------------------------
-- Area: Upper Jeuno
-- NPC: Luto Mewrilah
-- @zone 244
-- @pos -53 0 45
-----------------------------------
package.loaded["scripts/zones/Upper_Jeuno/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/zones/Upper_Jeuno/TextIDs");

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
    if (player:getQuestStatus(JEUNO,LURE_OF_THE_WILDCAT_JEUNO) == QUEST_ACCEPTED and player:getMaskBit(WildcatJeuno,7) == false) then
        player:startEvent(10085);
    else
        player:startEvent(0x2732); -- Standard dialog
    end
end;

-- 0x272f  0x2730  0x2731  0x2732  0x2737  0x2739  0x273c  0x273a  0x2740  0x273d  0x273f  0x2757  0x2745  0x2741  
-- 0x2742  0x2743  0x2754  0x2755  0x2756  0x275c  0x275d  0x2744  0x273b  0x273e  0x2747  0x2748  0x2749  0x274a  
-- 0x274c  0x274b  0x274d  0x274e  0x274f  0x2750  0x2753  0x2751  0x2752  0x2758  0x2759  0x275a  0x275b  0x275e  
-- 0x275f  0x2760  0x2761  0x2762  0x2765  0x27be  0x27bf

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
    if (csid == 10085) then
        player:setMaskBit(player:getVar("WildcatJeuno"),"WildcatJeuno",7,true);
    end
end;
