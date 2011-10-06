-----------------------------------
--	Area: Southern San d'Oria
--	NPC: Baunise
--  Involved in Quest: A Knight's Test
-------------------------------------

require("scripts/globals/keyItems");
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
require("scripts/zones/Southern_San_dOria/TextIDs");

----------------------------------- 
-- onTrade Action 
----------------------------------- 

function onTrade(player,npc,trade)
end;

----------------------------------- 
-- onTrigger Action 
-----------------------------------
 
function onTrigger(player,npc)

	if (player:hasKeyItem(BOOK_OF_TASKS) and player:hasKeyItem(BOOK_OF_THE_WEST) == false) then
		player:startEvent(0x027a);
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

	if (csid == 0x027a) then
		player:addKeyItem(BOOK_OF_THE_WEST);
		player:messageSpecial(KEYITEM_OBTAINED, BOOK_OF_THE_WEST);
	end
end;