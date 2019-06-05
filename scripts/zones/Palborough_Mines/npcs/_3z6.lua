-----------------------------------
-- Elevator in Palborough
-- Notes: Used to operate Elevator @3z0
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    RunElevator(dsp.elevator.PALBOROUGH_MINES_LIFT)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
