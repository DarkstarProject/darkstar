-----------------------------------
-- Area: Den of Rancor
--  NPC: ??? - HakuTaku spawn
-- !pos 24 25 -306 160
-----------------------------------
package.loaded["scripts/zones/Den_of_Rancor/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Den_of_Rancor/TextIDs")
require("scripts/zones/Den_of_Rancor/MobIDs")
require("scripts/globals/npc_util")
require("scripts/globals/status")
-----------------------------------

function onTrade(player,npc,trade)
    if npcUtil.tradeHas(trade, 1298) and not GetMobByID(HAKUTAKU):isSpawned() then
        player:confirmTrade()
        SpawnMob(HAKUTAKU):updateClaim(player)
        npc:setStatus(dsp.status.DISAPPEAR)
    end
end

function onTrigger(player,npc)
end