-----------------------------------
-- Area: Aht Urhgan Whitegate
-- NPC: Khaf Jhifanm
-- Standard Merchant NPC
-----------------------------------
package.loaded["scripts/zones/Aht_Urhgan_Whitegate/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Aht_Urhgan_Whitegate/TextIDs");
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
    
player:showText(npc,KHAFJHIFANM_SHOP_DIALOG);

stock = {0x15BF,200,        -- Dried Date
     0x15C8,800,        -- Ayran
     0x15D6,3750,        -- balik Sandvici
     0x08BB,320,        -- Wildgrass Seeds
     0x13D3,4400,        -- Scroll of Raptor Mazurka
     0x0b38,10000}        -- Empire Waystone

 
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



