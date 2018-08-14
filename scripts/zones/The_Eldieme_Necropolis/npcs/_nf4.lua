-----------------------------------
-- Area: The Eldieme Necropolis
--  NPC: Strange Apparatus
-- !pos 104 0 -179 195
-----------------------------------
package.loaded["scripts/zones/The_Eldieme_Necropolis/TextIDs"] = nil
-----------------------------------
require("scripts/zones/The_Eldieme_Necropolis/TextIDs")
require("scripts/globals/strangeapparatus")
-----------------------------------

function onTrade(player,npc,trade)
    dsp.strangeApparatus.onTrade(player, trade, 3)
end

function onTrigger(player,npc)
    dsp.strangeApparatus.onTrigger(player, 1)
end

function onEventUpdate(player,csid,option)
    if csid == 1 then
        dsp.strangeApparatus.onEventUpdate(player, option)
    end
end

function onEventFinish(player,csid,option)
    if csid == 3 then
        dsp.strangeApparatus.onEventFinish(player)
    end
end
