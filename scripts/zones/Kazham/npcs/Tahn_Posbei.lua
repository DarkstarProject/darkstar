-----------------------------------
-- Area: Kazham
-- NPC: Tahn Posbei
-- Standard Merchant NPC
-----------------------------------

require("scripts/globals/shop");
package.loaded["scripts/zones/Kazham/TextIDs"] = nil;
require("scripts/zones/Kazham/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

player:showText(npc,TAHNPOSBEI_SHOP_DIALOG);

stock = {0x3001,110,        -- Lauan Shield
     0x3004,4531,        -- Mahogany Shield
     0x3007,59607,        -- Round Shield
     0x30A7,7026,        -- Beetle Mask
     0x3127,10833,        -- Beetle Harness
     0x31A7,5707,        -- Beetle Mittens
     0x3223,8666,        -- Beetle Subligar
     0x32A7,5332,        -- Beetre Leggins
     0x3098,404,        -- Leather Bandana
     0x3118,618,        -- Leather Vest
     0x3198,331,        -- Leather Gloves
     0x3298,309,        -- Leather Highboots
     0x3324,28777}        -- Coeurl Gorget
 
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



