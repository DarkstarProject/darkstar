-----------------------------------
-- Area: Fort Ghelsba
--  NPC: Elevator Platform
-- !pos  6.912 -52.135 97.998 141
-- 17354992  @3x0  Elevator platform
-- 17354993  _3x3  Elevator stationary lower door
-- 17354994  _3x4  Elevator stationary upper door
-- 17354995  _3xb  Elevator moving lower door
-- 17354996  _3xa  Elevator moving upper door
-- 17354997  _3x0  bigwinch
-- 17354998  _3x1  Elevator Lever 1
-- 17354999  _3x2  Elevator Lever 2
-- 17355000  _3x5  winch1 (lever's gear)
-- 17355001  _3x6  winch2 (lever's gear)
-- ALL THAT FOR ONE PLATFORM.
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
        reversedAnimations = true,
    }

    npc:setElevator(elevator.id, elevator.lowerDoor, elevator.upperDoor, elevator.elevator, elevator.reversedAnimations)
    
end
