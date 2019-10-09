-----------------------------------
-- Area: North Gustaberg
--  NPC: Ennigreaud, R.K.
-- Type: Outpost Conquest Guards
-- !pos -584.687 39.107 54.281 106
-----------------------------------
require("scripts/globals/conquest")
-----------------------------------

local guardNation = dsp.nation.SANDORIA
local guardType   = dsp.conq.guard.OUTPOST
local guardRegion = dsp.region.GUSTABERG
local guardEvent  = 32763

function onTrade(player, npc, trade)
    dsp.conq.overseerOnTrade(player, npc, trade, guardNation, guardType)
end

function onTrigger(player, npc)
    dsp.conq.overseerOnTrigger(player, npc, guardNation, guardType, guardEvent, guardRegion)
end

function onEventUpdate(player, csid, option)
    dsp.conq.overseerOnEventUpdate(player, csid, option, guardNation)
end

function onEventFinish(player, csid, option)
    dsp.conq.overseerOnEventFinish(player, csid, option, guardNation, guardType, guardRegion)
end