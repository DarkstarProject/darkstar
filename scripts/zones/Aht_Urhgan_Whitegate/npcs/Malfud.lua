-----------------------------------
-- Area: Aht Urhfan Whitegate
--  NPC: Malfud
-- Standard Merchant NPC
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
        936,  16,    -- Rock Salt
        626, 255,    -- Black Pepper
        633,  16,    -- Olive Oil
        4388, 44,    -- Eggplant
        4390, 40,    -- Mithran Tomato
        2213, 12     -- Pine Nuts
    }

    player:showText(npc,MALFUD_SHOP_DIALOG)
    dsp.shop.general(player, stock)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end

