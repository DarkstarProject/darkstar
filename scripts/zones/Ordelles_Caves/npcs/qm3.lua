-----------------------------------
--	Area: Ordelle's Caves
--	NPC: ???
--  Involved in Quest: A Squire's Test II
-------------------------------------

require("scripts/globals/keyItems");
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

	if (os.time() - player:getVar("SquiresTestII") <= 60 and player:hasKeyItem(STALACTITE_DEW) == false) then
		player:messageSpecial(A_SQUIRE_S_TEST_II_DIALOG_II);
		player:addKeyItem(STALACTITE_DEW);
		player:messageSpecial(KEYITEM_OBTAINED, STALACTITE_DEW);
		player:setVar("SquiresTestII",0);
	elseif (player:hasKeyItem(STALACTITE_DEW))then
		player:messageSpecial(A_SQUIRE_S_TEST_II_DIALOG_III);
	else
		player:messageSpecial(NOTHING_FOUND);
		player:setVar("SquiresTestII",0);
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