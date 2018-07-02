-----------------------------------
-- Area: Aydeewa Subterrane
--  NPC: ??? (Spawn Nosferatu(ZNM T3))
-- !pos -199 8 -62 68
-----------------------------------
package.loaded["scripts/zones/Aydeewa_Subterrane/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Aydeewa_Subterrane/TextIDs")
require("scripts/zones/Aydeewa_Subterrane/MobIDs")
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player,npc,trade)
    if npcUtil.tradeHas(trade, 2584) and not GetMobByID(NOSFERATU):isSpawned() then -- Pure Blood
        player:confirmTrade()
        SpawnMob(NOSFERATU):updateClaim(player)
    end
end

function onTrigger(player,npc)
    player:messageSpecial(NOTHING_HAPPENS)
end