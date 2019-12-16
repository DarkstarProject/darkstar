-----------------------------------
-- Area: West Ronfaure
--  NPC: Harvetour
-- Type: Outpost Vendor
-- !pos -448 -19 -214 100
-----------------------------------
require("scripts/globals/conquest")
require("scripts/globals/shop")
-----------------------------------

local vendorRegion  = dsp.region.RONFAURE
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