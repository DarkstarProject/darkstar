-----------------------------------
-- Area: Upper Delkfutt's Tower
--  NPC: ??? (Spawns Alkyoneus)
-- !pos -300 -175 22 158
-----------------------------------
local ID = require("scripts/zones/Upper_Delkfutts_Tower/IDs")
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player, npc, trade)
    if npcUtil.tradeHas(trade, 2385) and npcUtil.popFromQM(player, npc, ID.mob.ALKYONEUS) then -- Moldy Buckler
        player:confirmTrade()
    end
end

function onTrigger(player, npc)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
