-----------------------------------
-- Area: Eastern Altepa Desert
--  NPC: Sahgygy, W.W.
-- Border Conquest Guards
-- !pos 226.493 -12.231 260.194 114
-----------------------------------
require("scripts/globals/conquest")
-----------------------------------

local guardNation = dsp.nation.WINDURST
local guardType   = dsp.conq.guard.BORDER
local guardRegion = dsp.region.KUZOTZ
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