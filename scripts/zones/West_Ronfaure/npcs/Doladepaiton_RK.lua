-----------------------------------
-- Area: West Ronfaure
--  NPC: Doladepaiton, R.K.
-- Type: Outpost Conquest Guards
-- !pos -448 -19 -214 100
-----------------------------------
require("scripts/globals/conquest")
-----------------------------------

local guardNation = tpz.nation.SANDORIA
local guardType   = tpz.conq.guard.OUTPOST
local guardRegion = tpz.region.RONFAURE
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