-----------------------------------
-- Area: Al'Taieu
--  NPC: ??? (Jailer of Love and Absolute Virtue Spawn)
-- Allows players to spawn the Jailer of Love by trading the Fourth Virtue, Fifth Virtue and Sixth Virtue to a ???.
-- Allows players to spawn Absolute Virtue by killing Jailer of Love.
-- !pos 431 -0 -603
-----------------------------------
local ID = require("scripts/zones/AlTaieu/IDs")
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player,npc,trade)
    --[[
    if npcUtil.tradeHas(trade, {1847, 1848, 1849}) and npcUtil.popFromQM(player, npc, ID.mob.JAILER_OF_LOVE) then
        player:confirmTrade()
    end
    --]]
end

function onTrigger(player,npc)
    player:startEvent(203)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
