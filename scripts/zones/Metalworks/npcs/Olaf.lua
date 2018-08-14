-----------------------------------
-- Area: Metalworks
--  NPC: Olaf
-- Standard Merchant NPC
-----------------------------------
package.loaded["scripts/zones/Metalworks/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Metalworks/TextIDs")
require("scripts/globals/shop")

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    local stock =
    {
        17248, 46836, 2,    -- Arquebus
        17340,    90, 3,    -- Bullet
          928,   463, 3,    -- Bomb Ash
    }

    player:showText(npc, OLAF_SHOP_DIALOG)
    dsp.shop.nation(player, stock, dsp.nation.BASTOK)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
