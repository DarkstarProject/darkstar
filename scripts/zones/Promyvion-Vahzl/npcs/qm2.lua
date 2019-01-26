-----------------------------------
-- Area: Promyvion-Vahzl
--  NPC: ??? (qm2)
-- Notes: Spawn Wailer Floor 4
-- !pos 339.000 -1.883 144.000 22
-----------------------------------
local ID = require("scripts/zones/Promyvion-Vahzl/IDs")
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player, npc, trade)
    if npcUtil.tradeHas(trade, 1757) and npcUtil.popFromQM(player, npc, ID.mob.WAILER) then -- Coveter Remnant
        player:messageSpecial(ID.text.ON_NM_SPAWN)
        player:confirmTrade()
    end
end

function onTrigger(player, npc)
    player:messageSpecial(ID.text.POPPED_NM_OFFSET + 1)
end
