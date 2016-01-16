-----------------------------------
-- Area: Al Zahbi
-- NPC: Chayaya
-- Standard Merchant NPC
-----------------------------------
package.loaded["scripts/zones/Al_Zahbi/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/shop");
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
    
player:showText(npc,CHAYAYA_SHOP_DIALOG);

stock = {0x439B,10,    --Dart
     0x439C,60,        --Hawkeye
     0x43A1,1204,    --Grenade
     0x43A8,8,        --Iron Arrow
     0x1565,68000,    --Warrior Die
     0x1566,22400,    --Monk Die
     0x1567,5000,    --White Mage Die
     0x1568,108000,    --Black Mage Die
     0x1569,62000,    --Red Mage Die
     0x156A,50400,    --Thief Die
     0x156B,90750,    --Paladin Die
     0x156C,2205,    --Dark Knight Die
     0x156D,26600,    --Beastmaster Die
     0x156E,12780,    --Bard Die
     0x156F,1300,    --Ranger Die
     0x1577,63375,    --Dancer Die
     0x1578,68250}    --Scholar Die
 
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



