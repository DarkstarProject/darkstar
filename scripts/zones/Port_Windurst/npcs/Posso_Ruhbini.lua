-----------------------------------
-- Area: Port Windurst
--  NPC: Posso Ruhbini
-- Norvallen Regional Merchant
-----------------------------------
package.loaded["scripts/zones/Port_Windurst/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Port_Windurst/TextIDs")
require("scripts/globals/conquest")
require("scripts/globals/shop")

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    if GetRegionOwner(dsp.region.NORVALLEN) ~= dsp.nation.WINDURST then
        player:showText(npc, POSSORUHBINI_CLOSED_DIALOG)
    else
        local stock =
        {
            688, 18,    -- Arrowwood Log
            698, 87,    -- Ash Log
            618, 25,    -- Blue Peas
            621, 25,    -- Crying Mustard
        }

        player:showText(npc, POSSORUHBINI_OPEN_DIALOG)
        dsp.shop.general(player, stock, WINDURST)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
