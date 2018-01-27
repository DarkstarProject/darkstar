-----------------------------------
-- Area: Port Bastok
--  NPC: Drawbridge
-----------------------------------
require("scripts/globals/status");
-----------------------------------

function onSpawn(npc)

    local elevator =
    {
        id = ELEVATOR_PORT_BASTOK_DRWBRDG, -- id is usually 0, but 2 for port bastok drawbridge since it's special
        lowerDoor = npc:getID(),           -- lowerDoor's npcid
        upperDoor = npc:getID() - 1,       -- upperDoor usually has a smaller id than lowerDoor
        elevator = npc:getID() - 2,        -- actual elevator npc's id is usually the smallest
        started = 1,                       -- is the elevator already running
        regime = 1                         --
    };

    npc:setElevator(elevator.id, elevator.lowerDoor, elevator.upperDoor, elevator.elevator, elevator.started, elevator.regime);
end;