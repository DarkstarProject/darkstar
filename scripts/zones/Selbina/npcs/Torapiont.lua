-----------------------------------
-- Area: Selbina
-- NPC: Torapiont
-- Standard Merchant NPC
-----------------------------------
package.loaded["scripts/zones/Selbina/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Selbina/TextIDs");
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
    
player:showText(npc,TORAPIONT_SHOP_DIALOG);

stock = {0x401B,11491,        --Claws
     0x4043,7727,        --Mythril Dagger
     0x4081,11588,        --Tuck
     0x40C8,37800,        --Mythril Claymore
     0x4103,11040,        --Battleaxe
     0x4141,4095,        --Greataxe
     0x429A,333,        --Willow Wand
     0x429B,1409,        --Yew Wand
     0x42C1,571,        --Holly Staff
     0x439B,9,        --Dart
     0x43B8,5,        --Crossbow Bolt
     0x43A6,3,        --Wooden Arrow
     0x43A8,7}        --Iron Arrow 
 
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



