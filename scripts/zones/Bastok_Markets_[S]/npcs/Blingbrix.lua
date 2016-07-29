-----------------------------------
-- Area: Bastok Markets (S)
-- NPC: Blingbrix
-- Standard Merchant NPC
-----------------------------------
package.loaded["scripts/zones/Bastok_Markets_[S]/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Bastok_Markets_[S]/TextIDs");
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
    
player:showText(npc,BLINGBRIX_SHOP_DIALOG);

stock = {0x1014,4500,    --Hi-Potion
    0x1024,28000,    --Hi-Ether
    0x025D,200,    --Pickaxe
    0x03FC,300}    --Sickle
 
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



