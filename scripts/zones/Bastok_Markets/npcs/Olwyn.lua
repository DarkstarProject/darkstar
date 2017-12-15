-----------------------------------
-- Area: Bastok Markets
--  NPC: Olwyn
-- Standard Merchant NPC
-- !pos -322.123 -10.319 -169.418 235
-----------------------------------
package.loaded["scripts/zones/Bastok_Markets/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/events/harvest_festivals");
require("scripts/zones/Bastok_Markets/TextIDs");
require("scripts/globals/shop");

function onTrade(player,npc,trade)
    onHalloweenTrade(player,trade,npc)
end;

function onTrigger(player,npc)
    player:showText(npc,OLWYN_SHOP_DIALOG);
    local stock =
    {
        4128, 4445, 1, -- Ether
        4151,  736, 2, -- Echo Drops
        4112,  837, 2, -- Potion
        4150, 2387, 3, -- Eye Drops
        4148,  290, 3, -- Antidote
    }
    showNationShop(player, NATION_BASTOK, stock);
end;
