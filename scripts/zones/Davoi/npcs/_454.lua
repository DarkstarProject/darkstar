-----------------------------------
-- Area: Davoi
-- NPC:
-----------------------------------
require("scripts/globals/status");
-----------------------------------

function onSpawn(npc)

    local elevator =
    {
        id = ELEVATOR_DAVOI_LIFT,    -- id is usually 0, but im needed in a script
        lowerDoor = npc:getID() - 2, -- lowerDoor's npcid
        upperDoor = npc:getID(),     -- upperDoor usually has a smaller id than lowerDoor
        elevator = npc:getID() - 3,  -- actual elevator npc's id is usually the smallest
        started = 0,                 -- is the elevator already running
        regime = 0,                  --
    }

    npc:setElevator(elevator.id, elevator.lowerDoor, elevator.upperDoor, elevator.elevator, elevator.started, elevator.regime);
end;