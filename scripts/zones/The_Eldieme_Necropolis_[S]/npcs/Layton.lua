-----------------------------------
-- Area: The Eldieme Necropolis (S)
-- NPC:  Layton
-- Type: Standard Merchant NPC
-- Note: Available during Campaign battles
-- @pos 382.679 -39.999 3.541 175
-----------------------------------
package.loaded["scripts/zones/The_Eldieme_Necropolis_[S]/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/shop");
require("scripts/zones/The_Eldieme_Necropolis_[S]/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
player:showText(npc,LAYTON_SHOP_DIALOG);

stock = {0x17A1,8060,        -- Firestorm Schema
         0x17A2,6318,        -- Rainstorm Schema
         0x17A3,9100,        -- Thunderstorm Schema    
         0x17A4,8580,        -- Hailstorm Schema         
         0x17A5,5200,        -- Sandstorm Schema
         0x17A6,6786,        -- Windstorm Schema
         0x17A7,11440,        -- Aurorastorm Schema         
         0x17A8,10725,        -- Voidstorm Schema
         0x1799,7714,        -- Pyrohelix Schema    
         0x179A,6786,        -- Hydrohelix Schema    
         0x179B,8625,        -- Ionohelix Schema    
         0x179C,7896,        -- Cryohelix Schema         
         0x179D,6591,        -- Geohelix Schema
         0x179E,6981,        -- Anemohelix Schema
         0x179F,8940,        -- Luminohelix Schema         
         0x17A0,8790}        -- Noctohelix Schema

 
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



