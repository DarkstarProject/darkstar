-----------------------------------
-- Area: Eastern Altepa Desert
--  NPC: Variko-Njariko, W.W.
-- Outpost Conquest Guards
-- !pos -258.041 7.473 -254.527 114
-----------------------------------
require("scripts/globals/conquest")
-----------------------------------

local guardNation = dsp.nation.WINDURST
local guardType   = dsp.conq.guard.OUTPOST
local guardRegion = dsp.region.KUZOTZ
local guardEvent  = 32759

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