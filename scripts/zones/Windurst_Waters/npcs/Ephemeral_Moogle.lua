-----------------------------------
-- Area: Winurst Waters
--  NPC: Ephemeral Moogle
-- Type: Crystal Strage NPC
-- !pos -117.250 -2.000 60.890 238
-----------------------------------
require("scripts/globals/ephemeral")

local triggerEvent = 1098
local tradeEvent = 1099
local failEvent = 1100

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