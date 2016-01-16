-----------------------------------
-- Area: Lower Jeuno
-- NPC: Taza
-- Standard Merchant NPC
-----------------------------------

require("scripts/globals/shop");
package.loaded["scripts/zones/Lower_Jeuno/TextIDs"] = nil;
require("scripts/zones/Lower_Jeuno/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
player:showText(npc,TAZA_SHOP_DIALOG);

stock = {0x1311,10304,        -- Scroll of Sleepga
     0x1232,26244,        -- Scroll of Shell III
     0x127f,19200,        -- Scroll of Protectra III
     0x1283,14080,        -- Scroll of Shellra II
     0x1284,26244,        -- Scroll of Shellra III
     0x124d,15120,        -- Scroll of Barpetrify
     0x124e,9600,        -- Scroll of Barvirus
     0x125b,15120,        -- Scroll of Barpetra
     0x125c,9600,        -- Scroll of Barvira
     0x1303,18720,        -- Scroll of Sleep II
     0x12a1,19932,        -- Scroll of Stone III
     0x12ab,22682,        -- Scroll of Water III
     0x129c,27744,        -- Scroll of Aero III
     0x1292,33306,        -- Scroll of Fire III
     0x1297,39368,        -- Scroll of Blizzard III
     0x12a6,45930}        -- Scroll of Thunder III
 
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



