-----------------------------------
-- Area: Port Jeuno
-- NPC:  Omiro-Zamiro
-- @zone 246
-- @pos 3 7 -54
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
		player:startEvent(0x0027);
	else
		player:startEvent(0x002f);
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
	
	if (csid == 0x0027) then 
		Z = player:getZPos();
		
		if (Z >= -61 and Z <= -58) then
			player:delGil(200);
		end
	end
	
end;