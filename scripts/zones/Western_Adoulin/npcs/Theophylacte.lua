-----------------------------------
-- Area: Western Adoulin
--  NPC: Theophylacte
-- Type: Shop NPC
-- !pos 154 4 -33 256
-----------------------------------
package.loaded["scripts/zones/Western_Adoulin/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/shop");
require("scripts/zones/Western_Adoulin/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    -- Standard shop
    player:showText(npc, THEOPHYLACTE_SHOP_TEXT);
    local stock =
    {
        4112, 910,    -- Potion
        4116, 4500,   -- Hi-Potion
        4128, 4832,   -- Ether
        4132, 28000,  -- Hi-Ether
        4148, 316,    -- Antidote
        4151, 800,    -- Echo Drops
        4155, 3360,   -- Remedy
    }
    dsp.shop.general(player, stock);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
