-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Ephemeral Moogle
-- Type: Crystal Strage NPC
-- !pos -185.750 -2.000 -3.860 230
-----------------------------------
require("scripts/globals/ephemeral")

local triggerEvent = 3549
local tradeEvent = 3550
local failEvent = 3551

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