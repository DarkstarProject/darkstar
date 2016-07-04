-----------------------------------
-- Area: Windurst Waters [S]
-- NPC: Ezura-Romazura
-- Standard Merchant NPC
-----------------------------------
package.loaded["scripts/zones/Windurst_Waters_[S]/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/shop");
require("scripts/zones/Windurst_Waters_[S]/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
player:showText(npc,EZURAROMAZURA_SHOP_DIALOG);

stock = {0x12a3,123750,        -- Scroll of Stone V
     0x12ad,133110,        -- Scroll of Water V
     0x129e,144875,        -- Scroll of Aero V
     0x1294,162500,        -- Scroll of Fire V
     0x1299,186375,        -- Scroll of Blizzard V
     0x131d,168150,        -- Scroll of Stoneja
     0x131f,176700,        -- Scroll of Waterja
     0x131a,193800,        -- Scroll of Firaja
     0x131c,185240,        -- Scroll of Aeroja
     0x12ff,126000}        -- Scroll of Break
 
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



