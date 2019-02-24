-----------------------------------
-- Area: Kuftal Tunnel
--  NPC: ??? (qm1)
-- Note: Spawns Phantom Worm
-- position changes every 5 seconds
-----------------------------------
local ID = require("scripts/zones/Kuftal_Tunnel/IDs")
require("scripts/zones/Kuftal_Tunnel/globals")
require("scripts/globals/npc_util")
-----------------------------------

function onSpawn(npc)
    npc:timer(5000, function(npc) KUFTAL_TUNNEL.movePhantomWormQM() end)
end

function onTrade(player, npc, trade)
    if npcUtil.tradeHas(trade, 645) and npcUtil.popFromQM(player, npc, ID.mob.PHANTOM_WORM, {radius=1}) then -- Darksteel Ore
        player:confirmTrade()
    end
end

function onTrigger(player, npc)
end