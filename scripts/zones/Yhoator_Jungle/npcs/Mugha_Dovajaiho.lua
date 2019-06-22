-----------------------------------
-- Area: Yhoator Jungle
--  NPC: Mugha Dovajaiho
-- Type: Outpost Vendor
-- !pos 202 0 -82 124
-----------------------------------
require("scripts/globals/conquest")
require("scripts/globals/shop")
-----------------------------------

local vendorRegion  = dsp.region.ELSHIMOUPLANDS
local vendorEvent   = 32756

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    dsp.conquest.vendorOnTrigger(player, vendorRegion, vendorEvent)
end

function onEventUpdate(player,csid,option)
    dsp.conquest.vendorOnEventUpdate(player, vendorRegion)
end

function onEventFinish(player,csid,option)
    dsp.conquest.vendorOnEventFinish(player, option, vendorRegion)
end