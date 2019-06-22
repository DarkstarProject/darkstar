-----------------------------------
-- Area: Meriphataud Mountains
--  NPC: Buliame, R.K.
-- Type: Border Conquest Guards
-- !pos -120.393 -25.822 -592.604 119
-----------------------------------
require("scripts/globals/conquest")
-----------------------------------

local guardNation = dsp.nation.SANDORIA
local guardType   = dsp.conq.guard.BORDER
local guardRegion = dsp.region.ARAGONEU
local guardEvent  = 32762

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