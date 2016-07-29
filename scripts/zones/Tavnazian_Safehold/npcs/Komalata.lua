-----------------------------------
-- Area: Tavnazian Safehold
-- NPC: Komalata
-- Standard Merchant NPC
-----------------------------------

require("scripts/globals/shop");
package.loaded["scripts/zones/Tavnazian_Safehold/TextIDs"] = nil;
require("scripts/zones/Tavnazian_Safehold/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
player:showText(npc,KOMALATA_SHOP_DIALOG);

stock = {0x1118,110,        -- Meat Jerky
     0x03a8,14,        -- Rock Salt
     0x0263,36,        -- Rye Flour
     0x119d,10,        -- Distilled Water
     0x0271,91,        -- Apple Vinegar    (COP 4+ only)
     0x110c,110,        -- Black Bread        (COP 4+ only)
     0x0262,55,        -- San d'Orian Flour    (COP 4+ only)
     0x1125,29,        -- San d'Orian Carrot    (COP 4+ only)
     0x0275,44,        -- Millioncorn        (COP 4+ only)
     0x05f3,290}        -- Apple Mint        (COP 4+ only)
 
showShop(player, STATIC, stock);
end; 

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;



