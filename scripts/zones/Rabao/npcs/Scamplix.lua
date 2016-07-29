-----------------------------------
-- Area: Rabao
-- NPC: Scamplix
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
    
player:showText(npc,SCAMPLIX_SHOP_DIALOG);

stock = {0x119D,10,        -- Distilled Waterr
     0x1118,108,        -- Meat Jerky
     0x116A,270,        -- Goblin Bread
     0x0719,720,        -- Cactus Arm
     0x1020,4348,        -- Ether
     0x113C,292,        -- Thundermelon
     0x118B,180,        -- Watermelon
     0x1010,819,        -- Potion
     0x1034,284,        -- Antidote
     0x1043,1080,        -- Blinding Potion
     0x3410,4050,        -- Mythril Earring
     0x006B,180,        -- Water Jug
     0x0b34,9000}        -- Rabao Waystone
 
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



