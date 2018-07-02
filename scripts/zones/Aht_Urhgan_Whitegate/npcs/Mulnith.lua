-----------------------------------
-- Area: Aht Urhgan Whitegate
--  NPC: Mulnith
-- Standard Merchant NPC
-- TODO: Stock needs to be modified based on
--       status of Astral Candescence
-----------------------------------
package.loaded["scripts/zones/Aht_Urhgan_Whitegate/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Aht_Urhgan_Whitegate/TextIDs")
require("scripts/globals/shop")

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    local stock =
    {
        4410,  344,    -- Roast Mushroom
        5598, 2000,    -- Sis Kebabi (Requires Astral Candescence)
        5600, 3000     -- Balik Sis (Requires Astral Candescence)
    }

    player:showText(npc, MULNITH_SHOP_DIALOG)
    dsp.shop.general(player, stock)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
