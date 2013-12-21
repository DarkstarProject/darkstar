-----------------------------------
-- Area: Phomiuna_Aqueducts
-- NPC:  _0rw (Oil Lamp)
-- @pos 103.703 -26.180 83.000 27
-----------------------------------
package.loaded["scripts/zones/Phomiuna_Aqueducts/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Phomiuna_Aqueducts/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
   
	if(player:getZPos() < 85) then
	  npc:openDoor(7);
		GetNPCByID(16888053):openDoor(7);		
	else
		player:messageSystem(9); -- Target out of range.		
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