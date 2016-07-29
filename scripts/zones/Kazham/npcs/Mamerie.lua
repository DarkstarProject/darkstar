-----------------------------------
-- Area: Kazham
-- NPC: Mamerie
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

player:showText(npc,MAMERIE_SHOP_DIALOG);

stock = {0x11C1,62,        -- Gysahl Greens
     0x0348,7,        -- Chocobo Feather
     0x4278,11,        -- Pet Food Alpha Biscuit
     0x4279,82,        -- Pet Food Beta Biscuit
     0x45C4,82,        -- Carrot Broth
     0x45C6,695,        -- Bug Broth
     0x45C8,126,        -- Herbal Broth
     0x45CA,695,        -- Carrion Broth
     0x13D1,50784}        -- Scroll of Chocobo Mazurka
 
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



