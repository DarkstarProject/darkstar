-----------------------------------
-- Area: North Gustaberg
--  NPC: Quellebie, R.K.
-- Type: Border Conquest Guards
-- !pos -520.704 38.75 560.258 106
-----------------------------------
require("scripts/globals/conquest")
-----------------------------------

local guardNation = tpz.nation.SANDORIA
local guardType   = tpz.conq.guard.BORDER
local guardRegion = tpz.region.GUSTABERG
local guardEvent  = 32762

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