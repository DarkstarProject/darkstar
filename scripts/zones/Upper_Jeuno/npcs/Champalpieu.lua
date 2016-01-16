-----------------------------------
-- Area: Upper Jeuno
-- NPC: Champalpieu
-- Standard Merchant NPC
-----------------------------------

require("scripts/globals/shop");
package.loaded["scripts/zones/Upper_Jeuno/TextIDs"] = nil;
require("scripts/zones/Upper_Jeuno/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
player:showText(npc,CHAMPALPIEU_SHOP_DIALOG);

stock = {0x110D,120,    --Rolanberry
    0x43A8,7,    --Iron Arrow
    0x43B8,5,    --Crossbow Bolt
    0x025D,180,    --Pickaxe
    0x13C8,567,    --Wind Threnody
    0x13CB,420}    --Water Threnody
 
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



