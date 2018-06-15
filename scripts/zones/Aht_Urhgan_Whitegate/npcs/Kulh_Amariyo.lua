-----------------------------------
-- Area: Aht Urhgan Whitegate
--  NPC: Kulh Amariyo
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
        4472,   38,    -- Crayfish
        5458, 1200,    -- Yilanbaligi (Requires Astral Candescence)
        5459, 1800,    -- Sazanbaligu (Requires Astral Candescence)
        5460, 4650,    -- Kayabaligi (Requires Astral Candescence)
        5461,  130     -- Alabaligi (Requires Astral Candescence)
    }

    player:showText(npc, KULHAMARIYO_SHOP_DIALOG)
    dsp.shop.general(player, stock)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
