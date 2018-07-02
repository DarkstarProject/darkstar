-----------------------------------
-- Area: Den of Rancor
--  NPC: Drop Gate (by Hakutaku)
-- !pos 5.044 23.590 -299.976 160
-----------------------------------
package.loaded["scripts/zones/Den_of_Rancor/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Den_of_Rancor/TextIDs")
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    player:messageSpecial(LANTERN_OFFSET) -- The grating will not budge.
end