-----------------------------------
-- Area: Port Windurst
--  NPC: Sheia Pohrichamaha
-- Fauregandi Regional Merchant
-----------------------------------
package.loaded["scripts/zones/Port_Windurst/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Port_Windurst/TextIDs")
require("scripts/globals/conquest")
require("scripts/globals/shop")

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    if GetRegionOwner(dsp.region.FAUREGANDI) ~= dsp.nation.WINDURST then
        player:showText(npc, SHEIAPOHRICHAMAHA_CLOSED_DIALOG)
    else
        local stock =
        {
            4571, 90,    -- Beaugreens
            4363, 39,    -- Faerie Apple
            691,  54,    -- Maple Log
        }

        player:showText(npc, SHEIAPOHRICHAMAHA_OPEN_DIALOG)
        dsp.shop.general(player, stock, WINDURST)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
