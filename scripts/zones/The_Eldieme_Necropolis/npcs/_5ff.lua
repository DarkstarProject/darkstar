-----------------------------------
-- Area: The Eldieme Necropolis
--  NPC: Leviathan's Gate
-- !pos 88 -34 -60 195
-----------------------------------
local func = require("scripts/zones/The_Eldieme_Necropolis/globals")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    func.gateOnTrigger(player, npc)
    return 0
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end