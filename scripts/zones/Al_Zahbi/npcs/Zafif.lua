-----------------------------------
-- Area: Al Zahbi
-- NPC: Zafif
-- Standard Merchant NPC
-----------------------------------

require("scripts/globals/shop");
package.loaded["scripts/zones/Al_Zahbi/TextIDs"] = nil;
require("scripts/zones/Al_Zahbi/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
player:showText(npc,ZAFIF_SHOP_DIALOG);

stock = {0x1204,23400,        -- Scroll of Cure IV
     0x1208,11200,        -- Scroll of Curaga II
     0x1209,19932,        -- Scroll of Curaga III
     0x122D,32000,        -- Scroll of Protect III
     0x122E,91116,        -- Scroll of Protect IV
     0x1280,85500,        -- Scroll of Protectra IV
     0x1215,35000,        -- Scroll of Holy
     0x1227,20000,        -- Scroll of Banishga II
     0x1211,2330,        -- Scroll of Silena
     0x1212,19200,        -- Scroll of Stona
     0x1213,13300,        -- Scroll of Viruna
     0x1214,8586,        -- Scroll of Cursna
     0x1304,77600,        -- Scroll of Dispell
     0x1270,27000,        -- Scroll of Flash
     0x128E,99375,        -- Scroll of Reraise III
     0x126B,28500}        -- Scroll of Reprisal
 
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



