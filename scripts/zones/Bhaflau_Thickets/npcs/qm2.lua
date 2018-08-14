-----------------------------------
-- Area: Bhaflau Thickets
--  NPC: ??? (Spawn Dea(ZNM T3))
-- !pos -34 -32 481 52
-----------------------------------
package.loaded["scripts/zones/Bhaflau_Thickets/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Bhaflau_Thickets/TextIDs")
require("scripts/zones/Bhaflau_Thickets/MobIDs")
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player,npc,trade)
    if npcUtil.tradeHas(trade, 2576) and not GetMobByID(DEA):isSpawned() then -- Olzhiryan Cactus
        player:confirmTrade()
        SpawnMob(DEA):updateClaim(player)
    end
end

function onTrigger(player,npc)
    player:messageSpecial(NOTHING_HAPPENS)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end