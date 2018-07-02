-----------------------------------
-- Area: Caedarva Mire
--  NPC: ??? (Spawn Experimental Lamia(ZNM T3))
-- !pos -773 -11 322 79
-----------------------------------
package.loaded["scripts/zones/Caedarva_Mire/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Caedarva_Mire/TextIDs")
require("scripts/zones/Caedarva_Mire/MobIDs")
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player,npc,trade)
    if npcUtil.tradeHas(trade, 2595) and not GetMobByID(EXPERIMENTAL_LAMIA):isSpawned() then -- Myrrh
        player:confirmTrade()
        SpawnMob(EXPERIMENTAL_LAMIA):updateClaim(player)
    end
end

function onTrigger(player,npc)
    player:messageSpecial(NOTHING_HAPPENS)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end