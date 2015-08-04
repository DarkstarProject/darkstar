-----------------------------------
-- Area:  Castle Oztroja
-- NPC:   _47k (Torch Stand)
-- Notes: Opens door _472 near password #1
-- @pos -57.412 -1.864 -30.627 151
-----------------------------------
package.loaded["scripts/zones/Castle_Oztroja/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Castle_Oztroja/TextIDs");
require("scripts/globals/settings");

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	local DoorID = npc:getID() - 3;
	local DoorA = GetNPCByID(DoorID):getAnimation();
	local TorchStandA = npc:getAnimation();
	local Torch1 = npc:getID();	
	local Torch2 = npc:getID() + 1;	
	
	if (DoorA == 9 and TorchStandA == 9) then
		player:startEvent(0x000a);	
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

	local Torch1 = GetNPCByID(17396168):getID();
	local Torch2 = GetNPCByID(Torch1):getID() + 1;	
	local DoorID = GetNPCByID(Torch1):getID() - 3;	

	if (option == 1) then
		GetNPCByID(Torch1):openDoor(10); -- Torch Lighting
		GetNPCByID(Torch2):openDoor(10); -- Torch Lighting
		GetNPCByID(DoorID):openDoor(6); 		
	end	

end;

--printf("CSID: %u",csid);
--printf("RESULT: %u",option);