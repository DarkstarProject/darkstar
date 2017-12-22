-----------------------------------
-- Area: Bastok Markets
-- NPC: Raghd
-- Standard Merchant NPC
-- !pos -149.200 -4.819 -74.939 235
-----------------------------------
package.loaded["scripts/zones/Bastok_Markets/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Bastok_Markets/TextIDs");
require("scripts/globals/shop");

function onTrigger(player,npc)
    player:showText(npc,RAGHD_SHOP_DIALOG);
    local stock =
    {
        13456, 1150, 1, -- Silver Ring
        13327, 1150, 1, -- Silver Earring
        13465,  184, 2, -- Brass Ring
        13454,   69, 3, -- Copper Ring
    }
    showNationShop(player, NATION_BASTOK, stock);
end; 
