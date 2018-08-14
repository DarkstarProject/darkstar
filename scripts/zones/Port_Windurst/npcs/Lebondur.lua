-----------------------------------
-- Area: Port Windurst
--  NPC: Lebondur
-- Vollbow Regional Merchant
-----------------------------------
package.loaded["scripts/zones/Port_Windurst/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Port_Windurst/TextIDs")
require("scripts/globals/conquest")
require("scripts/globals/shop")

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    if GetRegionOwner(dsp.region.VOLLBOW) ~= dsp.nation.WINDURST then
        player:showText(npc, LEBONDUR_CLOSED_DIALOG)
    else
        local stock =
        {
            636,   119,    -- Chamomile
            864,    88,    -- Fish Scales
            936,    14,    -- Rock Salt
            1410, 1656,    -- Sweet William
        }

        player:showText(npc, LEBONDUR_OPEN_DIALOG)
        dsp.shop.general(player, stock, WINDURST)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
