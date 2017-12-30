-----------------------------------
-- Area: Bastok Markets
-- NPC: Zhikkom
-- Standard Merchant NPC
-- !pos -288.669 -10.319 -135.064 235
-----------------------------------
package.loaded["scripts/zones/Bastok_Markets/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Bastok_Markets/TextIDs");
require("scripts/globals/shop");

function onTrigger(player,npc)
    player:showText(npc,ZHIKKOM_SHOP_DIALOG);
    local stock =
    {
        16537, 31648, 1, -- Mythril Sword
        16545, 21535, 1, -- Broadsword
        16513, 11845, 1, -- Tuck
        16558, 62560, 1, -- Falchion
        16536,  7286, 2, -- Iron Sword
        16552,  4163, 2, -- Scimitar
        16535,   246, 3, -- Bronze Sword
        16517,  9406, 3, -- Degen
        16551,   713, 3, -- Sapara
        16530,   618, 3, -- Xiphos
        16565,  1711, 3, -- Spatha
        16512,  3215, 3, -- Bilbo
    }
    showNationShop(player, NATION_BASTOK, stock);
end; 
