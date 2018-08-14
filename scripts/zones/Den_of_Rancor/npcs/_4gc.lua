-----------------------------------
-- Area: Den of Rancor
--  NPC: Altar of Rancor (Flame of Crimson Rancor)
-- !pos 199 32 -280 160
-----------------------------------
package.loaded["scripts/zones/Den_of_Rancor/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Den_of_Rancor/TextIDs")
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player,npc,trade)
    if npcUtil.tradeHas(trade, 1138) then -- Unlit Lantern
        if npcUtil.giveItem(player, 1140) then -- Flame of Crimson Rancor
            player:confirmTrade()
        end
    end
end

function onTrigger(player,npc)
    player:messageSpecial(LANTERN_OFFSET + 2) -- The altar glows an eerie red. The lanterns have been put out.
end