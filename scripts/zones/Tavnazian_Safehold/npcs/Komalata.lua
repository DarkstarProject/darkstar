-----------------------------------
-- Area: Tavnazian Safehold
--  NPC: Komalata
-- Standard Merchant NPC
-----------------------------------
require("scripts/globals/shop");
package.loaded["scripts/zones/Tavnazian_Safehold/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Tavnazian_Safehold/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    player:showText(npc,KOMALATA_SHOP_DIALOG);

    local stock =
    {
        4376,110,        -- Meat Jerky
     936,14,        -- Rock Salt
     611,36,        -- Rye Flour
     4509,10,        -- Distilled Water
     625,91,        -- Apple Vinegar    (COP 4+ only)
     4364,110,        -- Black Bread        (COP 4+ only)
     610,55,        -- San d'Orian Flour    (COP 4+ only)
     4389,29,        -- San d'Orian Carrot    (COP 4+ only)
     629,44,        -- Millioncorn        (COP 4+ only)
     1523,290}        -- Apple Mint        (COP 4+ only)

    dsp.shop.general(player, stock);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

