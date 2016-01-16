-----------------------------------
-- Area: Bastok Markets (S)
-- NPC: Silke
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
    
player:showText(npc,SILKE_SHOP_DIALOG);

stock = {0x17ab,29925,        -- Animus Augeo Schema
     0x17ac,29925,        -- Animus Minuo Schema
     0x17ad,36300}        -- Adloquim Schema
 
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



