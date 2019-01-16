-----------------------------------
-- Area: Palborough Mines
-- NPC:
-----------------------------------
require("scripts/globals/status");
-----------------------------------

function onSpawn(npc)

    local elevator =
    {
        id = dsp.elevator.PALBOROUGH_MINES_LIFT, -- id is usually 0, but im needed in a script
        lowerDoor = npc:getID() - 7,         -- lowerDoor's npcid
        upperDoor = npc:getID() - 6,         -- upperDoor usually has a smaller id than lowerDoor
        elevator = npc:getID(),              -- actual elevator npc's id is usually the smallest, except here
        started = 0,                         -- is the elevator already running
        regime = 0,                          --
        reversedAnimations = true,
    }

    npc:setElevator(elevator.id, elevator.lowerDoor, elevator.upperDoor, elevator.elevator, elevator.started, elevator.regime, elevator.reversedAnimations);
end;