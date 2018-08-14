-----------------------------------
-- Area: Caedarva Mire
--  NPC: ??? (Spawn Mahjlaef the Paintorn(ZNM T3))
-- !pos 695 -7 527 79
-----------------------------------
package.loaded["scripts/zones/Caedarva_Mire/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Caedarva_Mire/TextIDs")
require("scripts/zones/Caedarva_Mire/MobIDs")
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player,npc,trade)
    if npcUtil.tradeHas(trade, 2594) and not GetMobByID(MAHJLAEF_THE_PAINTORN):isSpawned() then -- Exorcism Treatise
        player:confirmTrade()
        SpawnMob(MAHJLAEF_THE_PAINTORN):updateClaim(player)
    end
end

function onTrigger(player,npc)
    player:messageSpecial(NOTHING_HAPPENS)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end