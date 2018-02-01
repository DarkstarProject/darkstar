-----------------------------------
-- Area: Kuftal Tunnel
-- NPC:
-----------------------------------
require("scripts/globals/status");
-----------------------------------

function onSpawn(npc)

    local elevator =
    {
        id = ELEVATOR_KUFTAL_TUNNEL_DSPPRNG_RCK, -- id is usually 0, but 1 for this cause it's special
        lowerDoor = 0,                           -- lowerDoor's npcid
        upperDoor = 0,                           -- upperDoor usually has a smaller id than lowerDoor
        elevator = npc:getID(),                  -- actual elevator npc's id is usually the smallest
        started = 1,                             -- is the elevator already running
        regime = 1,                              --
    }

    npc:setElevator(elevator.id, elevator.lowerDoor, elevator.upperDoor, elevator.elevator, elevator.started, elevator.regime);
end;