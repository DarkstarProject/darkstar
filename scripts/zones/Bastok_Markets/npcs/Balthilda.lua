-----------------------------------
-- Area: Bastok Markets
--  NPC: Balthilda
-- Type: Merchant
-- !pos -300 -10 -161 235
-----------------------------------
package.loaded["scripts/zones/Bastok_Markets/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Bastok_Markets/TextIDs");
require("scripts/globals/shop");

function onTrigger(player,npc)
    player:showText(npc, BALTHILDA_SHOP_DIALOG);
    local stock =
    {
        12473,  1904,  3,    -- Poet's Circlet
        12608,  1288,  3,    -- Tunic
        12601,  2838,  3,    -- Linen Robe
        12736,   602,  3,    -- Mitts
        12729,  1605,  3,    -- Linen Cuffs
        12864,   860,  3,    -- Slacks
        12857,  2318,  3,    -- Linen Slops
        12992,   556,  3,    -- Solea
        12985,  1495,  3,    -- Holly Clogs
        13469,  1150,  3,    -- Leather Ring
    }
    showNationShop(player, NATION_BASTOK, stock);
end;
