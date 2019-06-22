-----------------------------------
-- Area: Meriphataud Mountains
--  NPC: Mushosho
-- Type: Outpost Vendor
-- !pos -290 16 415 119
-----------------------------------
require("scripts/globals/conquest")
require("scripts/globals/shop")
-----------------------------------

local vendorRegion  = dsp.region.ARAGONEU
local vendorEvent   = 32756

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    dsp.conquest.vendorOnTrigger(player, vendorRegion, vendorEvent)
end

function onEventUpdate(player, csid, option)
    dsp.conquest.vendorOnEventUpdate(player, vendorRegion)
end

function onEventFinish(player, csid, option)
    dsp.conquest.vendorOnEventFinish(player, option, vendorRegion)
end