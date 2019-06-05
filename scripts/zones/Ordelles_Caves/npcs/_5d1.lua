-----------------------------------
-- Area: Ordelle's Caves
--  NPC: Strange Apparatus
-- !pos -294 28 -100 193
-----------------------------------
require("scripts/globals/strangeapparatus")
-----------------------------------

function onTrade(player, npc, trade)
    dsp.strangeApparatus.onTrade(player, trade, 5)
end

function onTrigger(player, npc)
    dsp.strangeApparatus.onTrigger(player, 3)
end

function onEventUpdate(player, csid, option)
    if csid == 3 then
        dsp.strangeApparatus.onEventUpdate(player, option)
    end
end

function onEventFinish(player, csid, option)
    if csid == 5 then
        dsp.strangeApparatus.onEventFinish(player)
    end
end
