-----------------------------------
--	Area: Ordelle's Caves
--	NPC: ???
--  Involved in Quest: A Squire's Test II
-------------------------------------

require("scripts/globals/keyItems");
package.loaded["scripts/globals/quests"] = nil;
require("scripts/globals/quests");
require("scripts/globals/settings");
package.loaded["scripts/zones/Ordelles_Caves/TextIDs"] = nil;
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

	if (player:getQuestStatus(SANDORIA,A_SQUIRE_S_TEST_II) == 1 and player:hasKeyItem(STALACTITE_DEW) == false and player:getVar("SquiresTestII") == 0) then
		player:setVar("SquiresTestII",os.time());
		player:messageSpecial(A_SQUIRE_S_TEST_II_DIALOG_I);
	else
		player:messageSpecial(NOTHING_FOUND);
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

