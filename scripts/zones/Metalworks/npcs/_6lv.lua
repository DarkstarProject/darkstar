-----------------------------------
-- Area: Metalworks
-- NPC:
-----------------------------------

function onSpawn(npc)

    local elevator =
    {
        id = 0,                      -- id is usually 0
        lowerDoor = npc:getID(),     -- lowerDoor's npcid
        upperDoor = npc:getID() - 1, -- upperDoor usually has a smaller id than lowerDoor
        elevator = npc:getID() - 2,  -- actual elevator npc's id is usually the smallest
        started = 1,                 -- is the elevator already running
        regime = 1,                  --
    }

    npc:setElevator(elevator.id, elevator.lowerDoor, elevator.upperDoor, elevator.elevator, elevator.started, elevator.regime);
end;