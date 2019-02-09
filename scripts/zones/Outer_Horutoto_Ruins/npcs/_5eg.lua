-----------------------------------
-- Area: Outer Horutoto Ruins
--  NPC: Ancient Magical Gizmo #3 (G out of E, F, G, H, I, J)
-- Involved In Mission: The Heart of the Matter
-----------------------------------
local func = require("scripts/zones/Outer_Horutoto_Ruins/globals")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    func.gizmoOnTrigger(player, npc)

    return 1
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    func.gizmoOnEventFinish(player, csid)
end