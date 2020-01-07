-----------------------------------
-- Area: Sauromugue Champaign [S]
--  NPC: Cavernous Maw
-- !pos 369 8 -227 98
-- Teleports Players to Sauromugue_Champaign
-----------------------------------
require("scripts/globals/maws")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    dsp.maws.onTrigger(player, npc)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    dsp.maws.onEventFinish(player, csid, option)
end