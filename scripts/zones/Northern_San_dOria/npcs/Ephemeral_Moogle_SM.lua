-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Ephemeral Moogle
-- Type: Crystal Strage NPC
-- !pos -176.090 12.000 268.910 231 - Carpenter's Guild
-- !pos -186.440 12.000 140.310 231 - Blacksmith's Guild
-----------------------------------
require("scripts/globals/ephemeral")

local triggerEvent = 914
local tradeEvent = 916
local failEvent = 917

function onTrade(player, npc, trade)
    dsp.ephemeral.onTrade(player, trade, tradeEvent, failEvent)
end

function onTrigger(player, npc)
    dsp.ephemeral.onTrigger(player, triggerEvent)
end

function onEventUpdate(player, csid, option)
    dsp.ephemeral.onEventUpdate(player)
end

function onEventFinish(player, csid, option)
    dsp.ephemeral.onEventFinish(player, option, csid == tradeEvent)
end