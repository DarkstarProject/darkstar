-----------------------------------
-- Area: Phomiuna_Aqueducts
-- NPC:  _ir5 (Oil Lamp)
-- @pos 103.703 -26.180 37.000 27
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
   
	if(player:getZPos() > 34) then
	  npc:openDoor(7);
		GetNPCByID(16888055):openDoor(7);		
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