-----------------------------------
--    Area: Mhaura
--    NPC: Runito-Monito
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
    
player:showText(npc,RUNITOMONITO_SHOP_DIALOG);

stock = {0x4015,106,  --Cat Bagnakhs
         0x4017,1554, --Brass Bagnakhs
         0x4041,855,  --Brass Dagger
         0x42a3,92,   --Bronze Rod
         0x42b9,634,  --Brass Rod
         0x4093,3601, --Brass Xiphos
         0x40c7,2502, --Claymore
         0x4140,618,  --Butterfly Axe
         0x439b,9,       --Dart
         0x43a6,3,       --Wooden Arrow
         0x43a7,4,       --Bone Arrow
         0x43b8,5}       --Crossbow Bolts
 
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



