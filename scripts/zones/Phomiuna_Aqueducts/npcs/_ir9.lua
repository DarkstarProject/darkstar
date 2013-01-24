-----------------------------------
-- Area: Phomiuna_Aqueducts
-- NPC:  Iron Gate
-- @pos 70 -1.5 140 27
-----------------------------------
package.loaded["scripts/zones/Phomiuna_Aqueducts/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/missions");
require("scripts/zones/Phomiuna_Aqueducts/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	
	if(trade:hasItemQty(1660,1) and trade:getItemCount() == 1)then -- Bronze Key
		player:tradeComplete();
		GetNPCByID(16888087):openDoor(7);
	elseif(trade:hasItemQty(1022,1) and trade:getItemCount() == 1 and player:getMainJob() == 6)then -- thief's tool
		player:tradeComplete();
		GetNPCByID(16888087):openDoor(7);
	end
	
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
   
	if(player:getXPos() >= 70) then
		return -1;
	else
		return 1;
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