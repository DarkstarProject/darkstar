-----------------------------------
-- Area: Aht Urhgan Whitegate
--  NPC: Saluhwa
-- Standard Merchant NPC
-- TODO: Stock needs to be modified based on
--       status of Astral Candescence
-----------------------------------
package.loaded["scripts/zones/Aht_Urhgan_Whitegate/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Aht_Urhgan_Whitegate/TextIDs")
require("scripts/globals/shop");

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    local stock =
    {
        12290,   605,    -- Mapple Shield (Requires Astral Candescence)
        12291,  1815,    -- Elm Shield (Requires Astral Candescence)
        12292,  4980,    -- Mahogany Shield (Requires Astral Candescence)
        12293, 15600,    -- Oak Shield (Requires Astral Candescence)
        12295, 64791     -- Round Shield (Requires Astral Candescence)
    }

    player:showText(npc, SALUHWA_SHOP_DIALOG)
    dsp.shop.general(player, stock)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
