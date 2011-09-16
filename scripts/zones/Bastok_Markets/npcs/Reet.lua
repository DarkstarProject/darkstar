-----------------------------------
--	Area: Bastok Markets
--	NPC: Arva
--	Adventurer's Assistant
--	Working 100%
-------------------------------------

require("scripts/globals/settings");
require("scripts/zones/Bastok_Markets/TextIDs");

----------------------------------- 
-- onTrade Action 
----------------------------------- 

function onTrade(player,npc,trade) 
	if (trade:getItemCount() == 1 and trade:hasItemQty(0x218,1) == true) then
		player:startEvent(0x0006);
		player:addGil(GIL_RATE*50);
		player:tradeComplete();
	end
end;

----------------------------------- 
-- onTrigger Action 
-----------------------------------
 
function onTrigger(player,npc) 
	player:startEvent(0x0005);
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
	if (csid == 0x0006) then
		player:messageSpecial(GIL_OBTAINED,GIL_RATE*50);
	end
end;