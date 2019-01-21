-----------------------------------
-- Area: Bastok Markets
--  NPC: Ephemeral Moogle
-- Type: Crystal Strage NPC
-- !pos -185.750 -2.000 -3.860 230
-----------------------------------
require("scripts/globals/ephemeral")
-----------------------------------

local triggerEvent = 617
local tradeEvent = 618

function onTrade(player, npc, trade)
    dsp.ephemeral.onTrade(player, trade, tradeEvent)
end

function onTrigger(player, npc)
    dsp.ephemeral.onTrigger(player, triggerEvent)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    dsp.ephemeral.onEventFinish(player, csid, option)
end