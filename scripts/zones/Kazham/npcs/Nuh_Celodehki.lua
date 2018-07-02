-----------------------------------
-- Area: Kazham
--  NPC: Nuh Celodehki
-- Standard Merchant NPC
-----------------------------------
package.loaded["scripts/zones/Kazham/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Kazham/TextIDs")
require("scripts/globals/shop")

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    local stock =
    {
        4398,  993,    -- Fish Mithkabob
        4536, 3133,    -- Blackened Frog
        4410,  316,    -- Roast Mushroom
        4457, 2700,    -- Eel Kabob
    }

    player:showText(npc, NUHCELODENKI_SHOP_DIALOG)
    dsp.shop.general(player, stock)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
