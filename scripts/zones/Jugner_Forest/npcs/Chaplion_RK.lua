-----------------------------------
-- Area: Jugner Forest
--  NPC: Chaplion, R.K.
-- Outpost Conquest Guards
-- !pos 54 0 -11 104
-----------------------------------
require("scripts/globals/conquest")
-----------------------------------

local guardNation = tpz.nation.SANDORIA
local guardType   = tpz.conq.guard.OUTPOST
local guardRegion = tpz.region.NORVALLEN
local guardEvent  = 32763

function onTrade(player, npc, trade)
    tpz.conq.overseerOnTrade(player, npc, trade, guardNation, guardType)
end

function onTrigger(player, npc)
    tpz.conq.overseerOnTrigger(player, npc, guardNation, guardType, guardEvent, guardRegion)
end

function onEventUpdate(player, csid, option)
    tpz.conq.overseerOnEventUpdate(player, csid, option, guardNation)
end

function onEventFinish(player, csid, option)
    tpz.conq.overseerOnEventFinish(player, csid, option, guardNation, guardType, guardRegion)
end