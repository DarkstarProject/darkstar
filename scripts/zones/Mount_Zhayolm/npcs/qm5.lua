-----------------------------------
-- Area: Mount Zhayolm
--  NPC: ??? (Spawn Sarameya(ZNM T4))
-- !pos 322 -14 -581 61
-----------------------------------
local ID = require("scripts/zones/Mount_Zhayolm/IDs")
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player, npc, trade)
    if npcUtil.tradeHas(trade, 2583) and npcUtil.popFromQM(player, npc, ID.mob.SARAMEYA, {hide = 0}) then -- Buffalo Corpse
        player:confirmTrade()
    end
end

function onTrigger(player, npc)
    player:messageSpecial(ID.text.NOTHING_HAPPENS)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
