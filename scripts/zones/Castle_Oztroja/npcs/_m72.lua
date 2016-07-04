-----------------------------------
-- Area:  Castle Oztroja
-- NPC:   _m72 (Torch Stand)
-- Notes: Opens door _477 when _m72 to _m75 are lit
-- @pos -60 -72 -139 151
-----------------------------------
package.loaded["scripts/zones/Castle_Oztroja/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Castle_Oztroja/TextIDs");
require("scripts/globals/settings");

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    DoorID = npc:getID() - 2;
    Torch1 = npc:getID();
    Torch2 = npc:getID() + 1;
    Torch3 = npc:getID() + 2;
    Torch4 = npc:getID() + 3;
    DoorA = GetNPCByID(DoorID):getAnimation();
    TorchStand1A = npc:getAnimation();
    TorchStand2A = GetNPCByID(Torch2):getAnimation();
    TorchStand3A = GetNPCByID(Torch3):getAnimation();
    TorchStand4A = GetNPCByID(Torch4):getAnimation();

    if (DoorA == 9 and TorchStand1A == 9) then
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
        GetNPCByID(Torch1):openDoor(55);
        if ((DoorA == 9)) then
            GetNPCByID(DoorID):openDoor(35); -- confirmed retail tested
            -- The lamps shouldn't go off here, but I couldn't get the torches to update animation times without turning them off first 
            -- They need to be reset to the door open time(35s) + 4s (39 seconds)
            GetNPCByID(Torch1):setAnimation(9);
            GetNPCByID(Torch2):setAnimation(9);
            GetNPCByID(Torch3):setAnimation(9);
            GetNPCByID(Torch4):setAnimation(9);
            GetNPCByID(Torch1):openDoor(39); -- confirmed retail tested
            GetNPCByID(Torch2):openDoor(39);
            GetNPCByID(Torch3):openDoor(39);
            GetNPCByID(Torch4):openDoor(39);
        end
    end
end;