-----------------------------------
-- Area: Phomiuna_Aqueducts
-- NPC:  _ir7 (Iron Gate)
-- @pos -70.800 -1.500 60.000 27
-----------------------------------
package.loaded["scripts/zones/Phomiuna_Aqueducts/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/missions");
require("scripts/zones/Phomiuna_Aqueducts/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	
	if (trade:hasItemQty(1660,1) and trade:getItemCount() == 1) then -- Bronze Key
		player:tradeComplete();
		npc:openDoor(15);
	elseif (trade:hasItemQty(1022,1) and trade:getItemCount() == 1 and player:getMainJob() == 6) then -- thief's tool
		player:tradeComplete();
		npc:openDoor(15);
	end
	
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
   
	if (player:getXPos() <= -71) then
		npc:openDoor(15); -- Retail timed
	else
		player:messageSpecial(DOOR_LOCKED,1660);
	end
	return 1;
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