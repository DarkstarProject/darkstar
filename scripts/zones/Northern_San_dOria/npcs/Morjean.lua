-----------------------------------
--	Area: Northern San d'Oria
--	NPC: Morjean
--  Optional Involvement in Quest: A Squire's Test II
-------------------------------------

require("scripts/globals/quests");
require("scripts/globals/settings");
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
require("scripts/zones/Northern_San_dOria/TextIDs");

----------------------------------- 
-- onTrade Action 
----------------------------------- 

function onTrade(player,npc,trade) 
end;

----------------------------------- 
-- onTrigger Action 
-----------------------------------
 
function onTrigger(player,npc) 

	if (player:getQuestStatus(SANDORIA,A_SQUIRE_S_TEST_II) == 1) then
		player:startEvent(0x25a);
	else
		player:startEvent(0x259);
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