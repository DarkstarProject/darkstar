-----------------------------------
-- Area: Bastok Markets
-- NPC: Carmelide
-- Standard Merchant NPC
-- !pos -151.693 -4.819 -69.635 235
-----------------------------------
package.loaded["scripts/zones/Bastok_Markets/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Bastok_Markets/TextIDs");
require("scripts/globals/shop");

function onTrigger(player,npc)
    player:showText(npc,CARMELIDE_SHOP_DIALOG);
    local stock =
    {
        806, 1713, 2,    -- Tourmaline
        807, 1713, 2,    -- Sardonyx
        800, 1713, 2,    -- Amethyst
        814, 1713, 2,    -- Amber
        795, 1713, 2,    -- Lapis Lazuli
        809, 1713, 2,    -- Clear Topaz
        799, 1713, 2,    -- Onyx
        796, 1713, 2,    -- Light Opal
        13454, 69, 3,    -- Copper Ring
    }
    showNationShop(player, NATION_BASTOK, stock);
end; 
