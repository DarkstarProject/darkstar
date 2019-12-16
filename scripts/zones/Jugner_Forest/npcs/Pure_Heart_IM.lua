-----------------------------------
-- Area: Jugner Forest
--  NPC: Pure Heart, I.M.
-- Type: Border Conquest Guards
-- !pos 570.732 -2.637 553.508 104
-----------------------------------
require("scripts/globals/conquest")
-----------------------------------

local guardNation = dsp.nation.BASTOK
local guardType   = dsp.conq.guard.BORDER
local guardRegion = dsp.region.NORVALLEN
local guardEvent  = 32760

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