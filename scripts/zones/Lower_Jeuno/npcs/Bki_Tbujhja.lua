-----------------------------------
-- Area: Lower Jeuno
-- NPC: Bki Tbujhja
-- Standard Info NPC
-----------------------------------

require("scripts/globals/quests");
require("scripts/zones/Lower_Jeuno/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	if (player:getVar("TheOldMonument_Event") == 1) then
		player:startEvent(0x00b6);
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
	
		if (csid == 0x00b6) then
			player:setVar("TheOldMonument_Event",2);
		end
end;