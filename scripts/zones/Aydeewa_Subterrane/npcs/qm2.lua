-----------------------------------
-- Area: Aydeewa Subterrane
--  NPC: ??? (Spawn Pandemonium Warden)
-- !pos 200 33 -140 68
-----------------------------------
package.loaded["scripts/zones/Aydeewa_Subterrane/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Aydeewa_Subterrane/TextIDs")
require("scripts/zones/Aydeewa_Subterrane/MobIDs")
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player,npc,trade)
    if npcUtil.tradeHas(trade, 2572) and not GetMobByID(PANDEMONIUM_WARDEN):isSpawned() then -- Pandemonium Key
        player:confirmTrade()
        SpawnMob(PANDEMONIUM_WARDEN):updateClaim(player)
    end
end

function onTrigger(player,npc)
    player:messageSpecial(NOTHING_HAPPENS)
end