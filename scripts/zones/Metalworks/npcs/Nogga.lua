-----------------------------------
-- Area: Metalworks
--  NPC: Nogga
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
        8918,   579, 1,    -- Soot
        17316,  675, 2,    -- Bomb Arm
        17313, 1083, 3,    -- Grenade
        2792,    92, 3,    -- Catalytic Oil
    }

    player:showText(npc, NOGGA_SHOP_DIALOG)
    dsp.shop.nation(player, stock, dsp.nation.BASTOK)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
