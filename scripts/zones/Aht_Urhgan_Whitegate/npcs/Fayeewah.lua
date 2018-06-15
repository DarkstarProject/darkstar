-----------------------------------
-- Area: Aht Urhgan Whitegate
--  NPC: Fayeewah
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
        5570,   68,    -- Cup of Chai
        5572, 2075     -- Irmik Helvasi
    }

    player:showText(npc, FAYEEWAH_SHOP_DIALOG)
    dsp.shop.general(player, stock)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
