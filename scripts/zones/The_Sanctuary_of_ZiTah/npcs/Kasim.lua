-----------------------------------
-- Area: The Sanctuary of Zitah
--  NPC: Kasim
-- Type: Outpost Vendor
-- !pos -46 0 -148 121
-----------------------------------
package.loaded["scripts/zones/The_Sanctuary_of_Zitah/TextIDs"] = nil
-----------------------------------
require("scripts/zones/The_Sanctuary_of_ZiTah/TextIDs")
require("scripts/globals/conquest")
require("scripts/globals/shop")
-----------------------------------

local vendorRegion  = dsp.region.LITELOR
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