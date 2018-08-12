-----------------------------------
-- Area: Port Bastok
--  NPC: Evelyn
-- Gustaberg Regional Merchant
-----------------------------------
package.loaded["scripts/zones/Port_Bastok/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Port_Bastok/TextIDs")
require("scripts/globals/conquest")
require("scripts/globals/shop")
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    if GetRegionOwner(dsp.region.GUSTABERG) ~= dsp.nation.BASTOK then
        player:showText(npc, EVELYN_CLOSED_DIALOG)
    else
        local stock =
        {
            1108, 703,    -- Sulfur
            619,   43,    -- Popoto
            611,   36,    -- Rye Flour
            4388,  40,    -- Eggplant
        }

        player:showText(npc, EVELYN_OPEN_DIALOG)
        dsp.shop.general(player, stock, BASTOK)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
