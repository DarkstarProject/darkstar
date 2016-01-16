-----------------------------------
-- Area: Nashmau
-- NPC: Wata Khamazom
-- Standard Merchant NPC
-----------------------------------
package.loaded["scripts/zones/Nashmau/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Nashmau/TextIDs");
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
    
player:showText(npc,WATAKHAMAZOM_SHOP_DIALOG);

stock = {0x4300,44,        -- Shortbow
     0x4301,536,        -- Self Bow
     0x4302,7920,        -- Wrapped Bow
     0x4308,492,        -- Longbow
     0x430A,21812,        -- Great Bow
     0x43A6,4,        -- Wooden Arrow
     0x43A8,8,        -- Iron Arrow
     0x43A9,18,        -- Silver Arrow
     0x43AA,140,        -- Fire Arrow
     0x43B8,6,        -- Crossbow Bolt
     0x4752,248}        -- Throwing Tomahawk
 
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



