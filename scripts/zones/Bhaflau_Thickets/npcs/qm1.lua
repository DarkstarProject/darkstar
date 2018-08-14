-----------------------------------
-- Area: Bhaflau Thickets
--  NPC: ??? (Spawn Lividroot Amooshah(ZNM T2))
-- !pos 334 -10 184 52
-----------------------------------
package.loaded["scripts/zones/Bhaflau_Thickets/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Bhaflau_Thickets/TextIDs")
require("scripts/zones/Bhaflau_Thickets/MobIDs")
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player,npc,trade)
    if npcUtil.tradeHas(trade, 2578) and not GetMobByID(LIVIDROOT_AMOOSHAH):isSpawned() then -- Oily Blood
        player:confirmTrade()
        SpawnMob(LIVIDROOT_AMOOSHAH):updateClaim(player)
    end
end

function onTrigger(player,npc)
    player:messageSpecial(NOTHING_HAPPENS)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end