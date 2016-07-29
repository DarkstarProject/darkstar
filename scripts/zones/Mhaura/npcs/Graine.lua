-----------------------------------
--    Area: Mhaura
--    NPC: Graine
--    Standard Merchant NPC
-----------------------------------
package.loaded["scripts/zones/Mhaura/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Mhaura/TextIDs");
require("scripts/globals/shop");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
player:showText(npc,GRAINE_SHOP_DIALOG);

stock = {0x3098,457,  --Leather Bandana
         0x30a0,174,  --Bronze Cap
         0x30a1,1700, --Brass Cap
         0x3118,698,  --Leather Vest
         0x3120,235,  --Bronze Harness
         0x3121,2286, --Brass Harness
         0x3198,374,  --Leather Gloves
         0x31a0,128,  --Bronze Mittens
         0x31a1,1255, --Brass Mittens
         0x3218,557,  --Leather Trousesrs
         0x3220,191,  --Bronze Subligar
         0x3221,1840, --Brass Subligar
         0x3298,349,  --Leather Highboots
         0x32a0,117,  --Bronze Leggings
         0x32a1,1140} --Brass Leggings
 
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



