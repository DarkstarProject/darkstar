-----------------------------------
-- Area:  Castle Oztroja
-- NPC:   _47z (Torch Stand)
-- Notes: Opens door _474
-- @pos -62.464 24.218 -67.313 151
-----------------------------------
package.loaded["scripts/zones/Castle_Oztroja/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Castle_Oztroja/TextIDs");
require("scripts/globals/settings");

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	DoorID = npc:getID() - 4;
	local DoorA = GetNPCByID(DoorID):getAnimation();
	local TorchStandA = npc:getAnimation();
	Torch1 = npc:getID();	
	Torch2 = npc:getID() - 1;	
	
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

	if (option == 1) then
		GetNPCByID(Torch1):openDoor(10); -- Torch Lighting
		GetNPCByID(Torch2):openDoor(10); -- Torch Lighting
		GetNPCByID(DoorID):openDoor(6); 		
	end	

end;

--printf("CSID: %u",csid);
--printf("RESULT: %u",option);