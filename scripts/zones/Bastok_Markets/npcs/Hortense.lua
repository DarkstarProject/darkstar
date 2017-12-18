-----------------------------------
-- Area: Bastok Markets
-- NPC: Hortense
-- Standard Merchant NPC
-- !pos -82.503 -4.849 -132.376 235
-----------------------------------
package.loaded["scripts/zones/Bastok_Markets/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Bastok_Markets/TextIDs");
require("scripts/globals/shop");

function onTrigger(player,npc)
    player:showText(npc,HORTENSE_SHOP_DIALOG);
    local stock =
    {
        4976,    64, 3, -- Scroll of Foe Requiem
        4977,   441, 3, -- Scroll of Foe Requiem II
        4978,  3960, 3, -- Scroll of Foe Requiem III
        4979,  6912, 3, -- Scroll of Foe Requiem IV
        4982, 47196, 3, -- Scroll of Foe Requiem VII
        4986,    37, 3, -- Scroll of Army's Paeon
        4987,   321, 3, -- Scroll of Army's Paeon II
        4988,  3240, 3, -- Scroll of Army's Paeon III
        4989,  5940, 3, -- Scroll of Army's Paeon IV
        4991, 48944, 3, -- Scroll of Army's Paeon VI
        5002,    21, 3, -- Scroll of Valor Minuet
        5003,  1101, 3, -- Scroll of Valor Minuet II
        5004,  5544, 3, -- Scroll of Valor Minuet III
        5006, 53820, 3, -- Scroll of Valor Minuet V
    }
    showNationShop(player, NATION_BASTOK, stock);
end; 
