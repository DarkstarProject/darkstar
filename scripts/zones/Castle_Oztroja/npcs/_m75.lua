-----------------------------------
-- Area:  Castle Oztroja
-- NPC:   _m75 (Torch Stand)
-- Notes: Opens door _477 when _m72 to _m75 are lit
-- @pos -139.643 -72.113 -62.682 151
-----------------------------------
package.loaded["scripts/zones/Castle_Oztroja/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Castle_Oztroja/TextIDs");
require("scripts/globals/settings");

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	DoorID = npc:getID() - 5;
	Torch1 = npc:getID() - 3;	
	Torch2 = npc:getID() - 2;		
	Torch3 = npc:getID() - 1;	
	Torch4 = npc:getID();		
	DoorA = GetNPCByID(DoorID):getAnimation();
	TorchStand1A = GetNPCByID(Torch1):getAnimation();
	TorchStand2A = GetNPCByID(Torch2):getAnimation();
	TorchStand3A = GetNPCByID(Torch3):getAnimation();
	TorchStand4A = npc:getAnimation();	
	
	if (DoorA == 9 and TorchStand4A == 9) then
		player:startEvent(0x000a);	
	else
		player:messageSpecial(TORCH_LIT);
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

	if (option == 1) then
		GetNPCByID(Torch4):openDoor(55);
		if ((DoorA == 9) and (TorchStand1A == 8) and (TorchStand2A == 8) and (TorchStand3A == 8)) then
			GetNPCByID(DoorID):openDoor(35);
			-- The lamps shouldn't go off here, but I couldn't get the torches to update animation times without turning them off first 
			-- They need to be reset to the door open time(35s) + 4s (39 seconds)			
			GetNPCByID(Torch1):setAnimation(9);
			GetNPCByID(Torch2):setAnimation(9);		
			GetNPCByID(Torch3):setAnimation(9);
			GetNPCByID(Torch4):setAnimation(9);		
			GetNPCByID(Torch1):openDoor(39);
			GetNPCByID(Torch2):openDoor(39);
			GetNPCByID(Torch3):openDoor(39);
			GetNPCByID(Torch4):openDoor(39);		
		end	
	end	
end;








