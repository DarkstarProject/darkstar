-----------------------------------
-- Area: Crawlers Nest
--  NPC: ??? - Matron Crawler spawn
-- !pos -141.158 -33.689 20.944 197
-----------------------------------
package.loaded["scripts/zones/Crawlers_Nest/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Crawlers_Nest/TextIDs")
require("scripts/zones/Crawlers_Nest/MobIDs")
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player,npc,trade)
    if npcUtil.tradeHas(trade, 4530) then -- Rolanberry 874
        player:confirmTrade()
        if math.random(1,100) > 34 or not npcUtil.popFromQM(player, npc, AWD_GOGGIE - 1, true, 0) then
            player:messageSpecial(NOTHING_SEEMS_TO_HAPPEN)
        end
    end
end

function onTrigger(player,npc)
end