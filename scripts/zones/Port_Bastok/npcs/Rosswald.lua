-----------------------------------
-- Area: Port Bastok
--  NPC: Rosswald
-- Zulkheim Regional Merchant
-----------------------------------
package.loaded["scripts/zones/Port_Bastok/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Port_Bastok/TextIDs")
require("scripts/globals/conquest")
require("scripts/globals/shop")

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    if GetRegionOwner(dsp.region.ZULKHEIM) ~= dsp.nation.BASTOK then
        player:showText(npc, ROSSWALD_CLOSED_DIALOG)
    else
        local stock =
        {
            4372,   44,    -- Giant Sheep Meat
            622,    44,    -- Dried Marjoram
            610,    55,    -- San d'Orian Flour
            611,    36,    -- Rye Flour
            1840, 1840,    -- Semolina
            4366,   22,    -- La Theine Cabbage
            4378,   55,    -- Selbina Milk
        }

        player:showText(npc, ROSSWALD_OPEN_DIALOG)
        dsp.shop.general(player, stock, BASTOK)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
