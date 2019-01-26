-----------------------------------
-- Area: Buburimu Peninsula
--  NPC: Mashasha, W.W.
-- Border Conquest Guards
-- !pos -599.903 -41.441 165.776 118
-----------------------------------
require("scripts/globals/conquest")
-----------------------------------

local guardNation = dsp.nation.WINDURST
local guardType   = dsp.conq.guard.BORDER
local guardRegion = dsp.region.KOLSHUSHU
local guardEvent  = 32758

function onTrade(player,npc,trade)
    dsp.conq.overseerOnTrade(player, npc, trade, guardNation, guardType)
end

function onTrigger(player,npc)
    dsp.conq.overseerOnTrigger(player, npc, guardNation, guardType, guardEvent, guardRegion)
end

function onEventUpdate(player,csid,option)
    dsp.conq.overseerOnEventUpdate(player, csid, option, guardNation)
end

function onEventFinish(player,csid,option)
    dsp.conq.overseerOnEventFinish(player, csid, option, guardNation, guardType, guardRegion)
end