-----------------------------------
-- Area: Rabao
-- NPC: Brave Wolf
-- Standard Merchant NPC
-----------------------------------

require("scripts/globals/shop");
package.loaded["scripts/zones/Rabao/TextIDs"] = nil;
require("scripts/zones/Rabao/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
player:showText(npc,BRAVEWOLF_SHOP_DIALOG);

stock = {0x300D,31201,    --Buckler
    0x300E,60260,    --Darksteel Buckler
    0x369B,24373,    --Silver Bangles
    0x310A,66066,    --Banded Mail
    0x318A,35285,    --Mufflers
    0x320A,52552,    --Breeches
    0x328A,32382,    --Sollerets
    0x3141,9423,    --Black Tunic
    0x31C1,4395,    --White Mitts
    0x3241,6279,    --Black Slacks
    0x32C1,4084,    --Sandals
    0x3122,28654,    --Padded Armor
    0x31A2,15724,    --Iron Mittens
    0x3224,23063,    --Iron Subligar
    0x32A2,14327}    --Leggins
 
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



