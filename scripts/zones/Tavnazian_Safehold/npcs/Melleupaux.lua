-----------------------------------
-- Area: Tavnazian Safehold
--  NPC: Melleupaux
-- Standard Merchant NPC
-----------------------------------
package.loaded["scripts/zones/Tavnazian_Safehold/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Tavnazian_Safehold/TextIDs")
require("scripts/globals/shop")

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    local stock =
    {
        16450, 1867,    -- Dagger
        16566, 8478,    -- Longsword
        17335,    8,    -- Rusty Bolt
    }

    if player:getCurrentMission(COP) >= SHELTERING_DOUBT then
        table.insert(stock, 18375)    -- Falx
        table.insert(stock, 93240)
        table.insert(stock, 18214)    -- Voulge
        table.insert(stock, 51905)
    end

    player:showText(npc, MELLEUPAUX_SHOP_DIALOG)
    dsp.shop.general(player, stock)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end

