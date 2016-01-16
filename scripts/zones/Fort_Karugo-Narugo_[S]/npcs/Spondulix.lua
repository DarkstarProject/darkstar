-----------------------------------
-- Area: Fort Karugo-Narugo
-- NPC: Spondulix
-- Standard Merchant NPC
-----------------------------------

require("scripts/globals/shop");
package.loaded["scripts/zones/Fort_Karugo-Narugo_[S]/TextIDs"] = nil;
require("scripts/zones/Fort_Karugo-Narugo_[S]/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
player:showText(npc,SPONDULIX_SHOP_DIALOG);

stock = {0x1014,4500,        -- Hi-Potion
     0x1024,28000,        -- Hi-Ether
     0x0A03,3035}        -- Karugo Clay
 
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



