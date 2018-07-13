-----------------------------------
-- Area: Crawlers' Nest
--  NPC: ??? - Guardian Crawler (Spawn area 2)
-- !pos 44.436 -2.602 195.381 197
-----------------------------------
package.loaded["scripts/zones/Crawlers_Nest/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Crawlers_Nest/TextIDs")
require("scripts/zones/Crawlers_Nest/MobIDs")
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player,npc,trade)
    if npcUtil.tradeHas(trade, 4365) then -- Rolanberry
        player:confirmTrade()
        if math.random(1,100) > 38 or not npcUtil.popFromQM(player, npc, AWD_GOGGIE - 5, true, 0) then
            player:messageSpecial(NOTHING_SEEMS_TO_HAPPEN)
        end
    end
end

function onTrigger(player,npc)
end


