-----------------------------------
-- Area: Qufim Island
--  NPC: Tsonga-Hoponga, W.W.
-- Type: Outpost Conquest Guards
-- !pos -245.366 -20.344 299.502 126
-----------------------------------
require("scripts/globals/conquest")
-----------------------------------

local guardNation = dsp.nation.WINDURST
local guardType   = dsp.conq.guard.OUTPOST
local guardRegion = dsp.region.QUFIMISLAND
local guardEvent  = 32759

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