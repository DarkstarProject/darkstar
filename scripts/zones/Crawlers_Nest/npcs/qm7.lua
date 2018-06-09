-----------------------------------
-- Area: Crawlers' Nest
--  NPC: ??? - Awd Goggie spawn
-- !pos -253.026 -1.867 253.055 197
-----------------------------------
package.loaded["scripts/zones/Crawlers_Nest/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Crawlers_Nest/TextIDs")
require("scripts/zones/Crawlers_Nest/MobIDs")
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player,npc,trade)
    if npcUtil.tradeHas(trade, 4531) then -- Rolanberry 864
        player:confirmTrade()
        if math.random(1,100) > 73 or not npcUtil.popFromQM(player, npc, AWD_GOGGIE, true, 0) then
            player:messageSpecial(NOTHING_SEEMS_TO_HAPPEN)
        end
    end
end

function onTrigger(player,npc)
end