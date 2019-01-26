-----------------------------------
-- Area: PsoXja
--  NPC: TOWER_C_Lift_W !pos 210 1.250 290
-----------------------------------
-----------------------------------
require("scripts/globals/status")
-----------------------------------
function onSpawn(npc)

    local elevator =
    {
        id = dsp.elevator.TIMED_AUTOMATIC,
        lowerDoor = npc:getID() + 2,
        upperDoor = npc:getID() + 1,
        elevator = npc:getID(),
        reversedAnimations = true,
    }

    npc:setElevator(elevator.id, elevator.lowerDoor, elevator.upperDoor, elevator.elevator, elevator.reversedAnimations)
end;