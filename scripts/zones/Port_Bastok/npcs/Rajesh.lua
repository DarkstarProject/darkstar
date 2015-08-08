-----------------------------------
-- Area: Port Bastok
-- NPC:  Rajesh
-- @zone 236
-- @pos -62 1 -8
-----------------------------------
package.loaded["scripts/zones/Port_Jeuno/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/zones/Port_Jeuno/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	if (player:hasKeyItem(AIRSHIP_PASS) == true and player:getGil() >= 200) then 
		player:startEvent(0x008d);
	else
		player:startEvent(0x008e);
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
	
	if (csid == 0x008d and option == 0) then 
		X = player:getXPos();
		
		if (X >= -58 and X <= -55) then
			player:delGil(200);
		end
	end
	
end;



