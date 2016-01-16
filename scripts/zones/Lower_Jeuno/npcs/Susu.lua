-----------------------------------
-- Area: Lower Jeuno
-- NPC: Susu
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
    
player:showText(npc,SUSU_SHOP_DIALOG);

stock = {0x1227,20000,        -- Banishga II
     0x1248,244,        -- Barsleep
     0x1249,400,        -- Barpoison
     0x124a,780,        -- Barparalyze
     0x124b,2030,        -- Barblind
     0x124c,4608,        -- Barsilence
     0x1256,244,        -- Barsleepra
     0x1257,400,        -- Barpoisonra
     0x1258,780,        -- Barparalyzra
     0x1259,2030,        -- Barblindra
     0x125a,4608,        -- Barsilencera
     0x1214,8586,        -- Cursna
     0x1215,35000,        -- Holy
     0x1211,2330,        -- Silena
     0x1212,19200,        -- Stona
     0x1213,13300}        -- Viruna
 
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



