-----------------------------------
-- Area: Rabao
-- NPC: Generoit
-- Standard Merchant NPC
-----------------------------------

require("scripts/globals/shop");
package.loaded["scripts/zones/Rabao/TextIDs"] = nil;
require("scripts/zones/Rabao/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
player:showText(npc,GENEROIT_SHOP_DIALOG);

stock = {0x11C1,61,    -- Gysahl Greens
     0x0348,7,    -- Chocobo Feather
     0x4278,10,    -- Pet Food Alpha Biscuit
     0x4279,81,    -- Pet Food Beta Biscuit
     0x45C4,81,    -- Carrot Broth
     0x45C6,687,    -- Bug Broth
     0x45C8,125,    -- Herbal Broth
     0x45CA,687,    -- Carrion Broth
     0x13D1,50784}    -- Scroll of Chocobo Mazurka
 
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



