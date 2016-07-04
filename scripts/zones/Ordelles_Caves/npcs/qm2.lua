-----------------------------------
-- Area: Ordelle's Caves
-- NPC:  ??? (qm2)
-- Involved in Quest: A Squire's Test II
-- @pos -94 1 273 193
-------------------------------------
package.loaded["scripts/zones/Ordelles_Caves/TextIDs"] = nil;
-------------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Ordelles_Caves/TextIDs");

----------------------------------- 
-- onTrade Action 
----------------------------------- 

function onTrade(player,npc,trade) 
end;

----------------------------------- 
-- onTrigger Action 
-----------------------------------
 
function onTrigger(player,npc) 

    if (player:getQuestStatus(SANDORIA,A_SQUIRE_S_TEST_II) == QUEST_ACCEPTED and player:hasKeyItem(STALACTITE_DEW) == false and player:getVar("SquiresTestII") == 0) then
        player:setVar("SquiresTestII",os.time());
        player:messageSpecial(A_SQUIRE_S_TEST_II_DIALOG_I);
    else
        player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
    end
    
end; 

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
end;