-----------------------------------
-- Area: Den of Rancor
--  NPC: ??? - HakuTaku spawn
-- !pos 24 25 -306 160
-----------------------------------
local ID = require("scripts/zones/Den_of_Rancor/IDs")
require("scripts/globals/npc_util")
require("scripts/globals/status")
-----------------------------------

function onTrade(player,npc,trade)
    if npcUtil.tradeHas(trade, 1298) and not GetMobByID(ID.mob.HAKUTAKU):isSpawned() then
        player:confirmTrade()
        SpawnMob(ID.mob.HAKUTAKU):updateClaim(player)
        npc:setStatus(dsp.status.DISAPPEAR)
    end
end

function onTrigger(player,npc)
end