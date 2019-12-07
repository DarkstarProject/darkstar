-----------------------------------
-- Area: Metalworks
--  NPC: South side Elevator platform
-- _6ls  South Upper Elevator Door  -53.126 -12.098 -11.875
-- _6lt  South Lower Elevator Door  -58.850 0.000 -11.914
-- @6l1  South Elevator Platform    -55.978 -13.100 -12.020
-- _6lj  South Elevator Winch       -56.126 -14.221 -11.988
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onSpawn(npc)
    local elevator =
    {
        id = dsp.elevator.TIMED_AUTOMATIC,
        lowerDoor = npc:getID() -1,
        upperDoor = npc:getID() -2,
        elevator = npc:getID(),
        reversedAnimations = false,
    }

    npc:setElevator(elevator.id, elevator.lowerDoor, elevator.upperDoor, elevator.elevator, elevator.reversedAnimations)
end
