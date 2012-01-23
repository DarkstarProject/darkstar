-----------------------------------
--	Area: Southern San d'Oria
--	NPC: Cahaurme
--  Type: Quest Giver NPC
--  Involved in Quest: A Knight's Test
--  Involved in Quest: Lost Chick
--  @zone: 230
--  @pos: 55.749 -8.601 -29.354
-------------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
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

	if (player:hasKeyItem(BOOK_OF_TASKS) and player:hasKeyItem(BOOK_OF_THE_EAST) == false) then
		player:startEvent(0x0279);
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

	if (csid == 0x0279) then
		player:addKeyItem(BOOK_OF_THE_EAST);
		player:messageSpecial(KEYITEM_OBTAINED, BOOK_OF_THE_EAST);
	end
end;