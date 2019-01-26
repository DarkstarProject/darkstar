-----------------------------------
-- Area: Palborough Mines
-- NPC:
-----------------------------------
require("scripts/globals/status");
-----------------------------------

function onSpawn(npc)

    local elevator =
    {
        id = dsp.elevator.PALBOROUGH_MINES_LIFT,
        lowerDoor = npc:getID() - 7,
        upperDoor = npc:getID() - 6,
        elevator = npc:getID(),
        reversedAnimations = true,
    }

    npc:setElevator(elevator.id, elevator.lowerDoor, elevator.upperDoor, elevator.elevator, elevator.reversedAnimations)
end;