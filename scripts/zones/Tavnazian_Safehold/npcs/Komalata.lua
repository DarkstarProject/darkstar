-----------------------------------
-- Area: Tavnazian Safehold
--  NPC: Komalata
-- Standard Merchant NPC
-----------------------------------
package.loaded["scripts/zones/Tavnazian_Safehold/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Tavnazian_Safehold/TextIDs")
require("scripts/globals/missions")
require("scripts/globals/shop")

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    local stock =
    {
        4376, 110,    -- Meat Jerky
        936,   14,    -- Rock Salt
        611,   36,    -- Rye Flour
        4509,  10,    -- Distilled Water
    }

    if player:getCurrentMission(COP) >= SHELTERING_DOUBT then
        table.insert(stock, 625)      -- Apple Vinegar
        table.insert(stock, 91)
        table.insert(stock, 18214)    -- Black Bread
        table.insert(stock, 110)
        table.insert(stock, 610)      -- San d'Orian Flour
        table.insert(stock, 55)
        table.insert(stock, 4389)     -- San d'Orian Carrot
        table.insert(stock, 29)
        table.insert(stock, 629)      -- Millioncorn
        table.insert(stock, 44)
        table.insert(stock, 1523)     -- Apple Mint
        table.insert(stock, 290)
    end

    player:showText(npc, KOMALATA_SHOP_DIALOG)
    dsp.shop.general(player, stock)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end

