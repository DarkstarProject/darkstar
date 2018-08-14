-----------------------------------
-- Area: Outer Horutoto Ruins
--  NPC: Strange Apparatus
-- !pos -574 0 739 194
-----------------------------------
package.loaded["scripts/zones/Outer_Horutoto_Ruins/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Outer_Horutoto_Ruins/TextIDs")
require("scripts/globals/strangeapparatus")
-----------------------------------

function onTrade(player,npc,trade)
    dsp.strangeApparatus.onTrade(player, trade, 66)
end

function onTrigger(player,npc)
    dsp.strangeApparatus.onTrigger(player, 64)
end

function onEventUpdate(player,csid,option)
    if csid == 64 then
        dsp.strangeApparatus.onEventUpdate(player, option)
    end
end

function onEventFinish(player,csid,option)
    if csid == 66 then
        dsp.strangeApparatus.onEventFinish(player)
    end
end
