-----------------------------------
-- Area: Fort Ghelsba
--  NPC: Elevator Platform
-- !pos  6.912 -52.135 97.998 141
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onSpawn(npc)
    local elevator =
    {
        id = dsp.elevator.FORT_GHELSBA_LIFT,
        lowerDoor = npc:getID() +1,
        upperDoor = npc:getID() +2,
        elevator = npc:getID(),
        started = 0,
        regime = 0,
    }

    npc:setElevator(elevator.id, elevator.lowerDoor, elevator.upperDoor, elevator.elevator, elevator.started, elevator.regime)
end
