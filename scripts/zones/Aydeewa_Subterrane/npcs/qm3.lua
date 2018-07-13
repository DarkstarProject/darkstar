-----------------------------------
-- Area: Aydeewa Subterrane
--  NPC: ??? (Spawn Chigre(ZNM T1))
-- !pos -217 35 12 68
-----------------------------------
package.loaded["scripts/zones/Aydeewa_Subterrane/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Aydeewa_Subterrane/TextIDs")
require("scripts/zones/Aydeewa_Subterrane/MobIDs")
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player,npc,trade)
    if npcUtil.tradeHas(trade, 2602) and not GetMobByID(CHIGRE):isSpawned() then -- Spoilt Blood
        player:confirmTrade()
        SpawnMob(CHIGRE):updateClaim(player)
    end
end

function onTrigger(player,npc)
    player:messageSpecial(NOTHING_HAPPENS)
end