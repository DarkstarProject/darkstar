-----------------------------------
-- Area: Buburimu Peninsula
--  NPC: Lobho Ukipturi
-- Type: Outpost Vendor
-- !pos -485 -31 50 118
-----------------------------------
require("scripts/globals/conquest")
require("scripts/globals/shop")
-----------------------------------

local vendorRegion  = dsp.region.KOLSHUSHU
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