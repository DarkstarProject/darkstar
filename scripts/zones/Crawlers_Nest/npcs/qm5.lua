-----------------------------------
-- Area: Crawlers Nest
--  NPC: ??? - Queen Crawler spawn
-- !pos -337.156 -3.607 -253.294 197
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
        if math.random(1,100) > 50 or not npcUtil.popFromQM(player, npc, AWD_GOGGIE - 2, true, 0) then
            player:messageSpecial(NOTHING_SEEMS_TO_HAPPEN)
        end
    end
end

function onTrigger(player,npc)
end