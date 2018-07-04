-----------------------------------
-- Area: Port Windurst
--  NPC: Zoreen
-- Valdeaunia Regional Merchant
-----------------------------------
package.loaded["scripts/zones/Port_Windurst/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Port_Windurst/TextIDs")
require("scripts/globals/conquest")
require("scripts/globals/shop")

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    if GetRegionOwner(dsp.region.VALDEAUNIA) ~= dsp.nation.WINDURST then
        player:showText(npc, ZOREEN_CLOSED_DIALOG)
    else
        local stock =
        {
            4382, 29,    -- Frost Turnip
            638, 170,    -- Sage
        }

        player:showText(npc, ZOREEN_OPEN_DIALOG)
        dsp.shop.general(player, stock, WINDURST)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
