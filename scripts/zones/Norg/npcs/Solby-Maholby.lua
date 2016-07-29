-----------------------------------
-- Area: Norg
-- NPC: Solby-Maholby
-- Standard Merchant NPC
-----------------------------------

require("scripts/globals/shop");
package.loaded["scripts/zones/Norg/TextIDs"] = nil;
require("scripts/zones/Norg/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
player:showText(npc,SOLBYMAHOLBY_SHOP_DIALOG);

stock = {0x43F3,9,        -- Lugworm
     0x1323,450,        -- Earth Spirit Pact
     0x1365,79380,        -- Scroll of Aisha: Ichi
     0x1366,93243,        -- Scroll of Myoshu: Ichi
     0x1367,90283,        -- Scroll of Yurin: Ichi
     0x1368,133000,        -- Scroll of Migawa: Ichi
     0x136A,140319,        -- Scroll of Gekka: Ichi
     0x136B,140319,        -- Scroll of Yain: Ichi     
     0x0b36,9000}        -- Norg Waystone
    
 
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



