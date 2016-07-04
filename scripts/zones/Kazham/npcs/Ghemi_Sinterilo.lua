-----------------------------------
-- Area: Kazham
-- NPC: Ghemi Senterilo
-- Standard Merchant NPC
-----------------------------------

require("scripts/globals/shop");
package.loaded["scripts/zones/Kazham/TextIDs"] = nil;
require("scripts/zones/Kazham/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

player:showText(npc,GHEMISENTERILO_SHOP_DIALOG);

stock = {0x1174,72,    -- Pamamas
     0x1150,54,    -- Kazham Pineapple
     0x1126,36,    -- Mithran Tomato
     0x0264,54,    -- Kazham Peppers
     0x0274,236,    -- Cinnamon
     0x0278,109,    -- Kukuru Bean
     0x1443,156,    -- Elshimo Coconut
     0x15E4,154,    -- Elshimo Pachira Fruit
     0x0b35,9100,    -- Kazham Waystone
     0x02DB,2877}    -- Aquilaria Log
 
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



