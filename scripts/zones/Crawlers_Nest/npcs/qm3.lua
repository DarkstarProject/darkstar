-----------------------------------
-- Area: Crawlers' Nest
--  NPC: ??? - Drone Crawler (Spawn area 1)
-- !pos 4.045 -2.703 285.026 197
-----------------------------------
package.loaded["scripts/zones/Crawlers_Nest/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Crawlers_Nest/TextIDs")
require("scripts/zones/Crawlers_Nest/MobIDs")
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player,npc,trade)
    if npcUtil.tradeHas(trade, 4529) then -- Rolanberry 881
        player:confirmTrade()
        if math.random(1,100) > 50 or not npcUtil.popFromQM(player, npc, AWD_GOGGIE - 4, true, 0) then
            player:messageSpecial(NOTHING_SEEMS_TO_HAPPEN)
        end
    end
end

function onTrigger(player,npc)
end