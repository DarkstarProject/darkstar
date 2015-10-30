-----------------------------------
-- Area: Upper Jeuno
-- NPC:  Paya-Sabya
-- Involved in Mission: Magicite
-- @zone 244
-- @pos 9 1 70
-----------------------------------
package.loaded["scripts/zones/Upper_Jeuno/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/zones/Upper_Jeuno/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	if (player:hasKeyItem(SILVER_BELL) and player:hasKeyItem(YAGUDO_TORCH) == false and player:getVar("YagudoTorchCS") == 0) then
		player:startEvent(0x0050);
	else
		player:startEvent(0x004f);
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
	
	if (csid == 0x0050) then
		player:setVar("YagudoTorchCS",1);
	end
	
end;