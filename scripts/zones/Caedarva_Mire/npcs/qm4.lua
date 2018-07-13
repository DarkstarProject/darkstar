-----------------------------------
-- Area: Caedarva Mire
--  NPC: ??? (Spawn Tyger(ZNM T4))
-- !pos -766 -12 632 79
-----------------------------------
package.loaded["scripts/zones/Caedarva_Mire/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Caedarva_Mire/TextIDs")
require("scripts/zones/Caedarva_Mire/MobIDs")
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player,npc,trade)
    if npcUtil.tradeHas(trade, 2593) and not GetMobByID(TYGER):isSpawned() then -- Singed Buffalo
        player:confirmTrade()
        SpawnMob(TYGER):updateClaim(player)
    end
end

function onTrigger(player,npc)
    player:messageSpecial(NOTHING_HAPPENS)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end