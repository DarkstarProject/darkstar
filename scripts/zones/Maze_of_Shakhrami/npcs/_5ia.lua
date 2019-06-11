-----------------------------------
-- Area: Maze of Shakhrami
--  NPC: Strange Apparatus
-- !pos 375 20 -259 198
-----------------------------------
require("scripts/globals/strangeapparatus")
-----------------------------------

function onTrade(player, npc, trade)
    dsp.strangeApparatus.onTrade(player, trade, 55)
end

function onTrigger(player, npc)
    dsp.strangeApparatus.onTrigger(player, 53)
end

function onEventUpdate(player, csid, option)
    if csid == 53 then
        dsp.strangeApparatus.onEventUpdate(player, option)
    end
end

function onEventFinish(player, csid, option)
    if csid == 55 then
        dsp.strangeApparatus.onEventFinish(player)
    end
end
