-----------------------------------
-- Area:  Castle Oztroja
-- NPC:   _47u (Handle)
-- Notes: Opens door _474 from behind
-- @pos -60 24 -77 151
-----------------------------------
package.loaded["scripts/zones/Castle_Oztroja/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Castle_Oztroja/TextIDs");
require("scripts/globals/settings");

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
		
	local DoorID = npc:getID() - 1;		
	local DoorA = GetNPCByID(DoorID):getAnimation();
	
	if (player:getZPos() < -72) then
	  if (DoorA == 9 and npc:getAnimation() == 9) then
		npc:openDoor(6.5);
		-- Should be a ~1 second delay here before the door opens
		GetNPCByID(DoorID):openDoor(4.5); 
	  end 	
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
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;