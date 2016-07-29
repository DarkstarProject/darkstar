-----------------------------------
-- Area: Lower Jeuno
-- NPC: Creepstix
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
    
player:showText(npc,CREEPSTIX_SHOP_DIALOG);

stock = {0x139f,8160,    -- Scroll of Goblin Gavotte 
     0x127e,7074,    -- Scroll of Protectra II
     0x1282,1700,    -- Scroll of Shellra
     0x13e1,73740,    -- Scroll of Gain-VIT
     0x13e4,77500,    -- Scroll of Gain-MND
     0x13e2,85680,    -- Scroll of Gain-AGI
     0x13e5,81900,    -- Scroll of Gain-CHR
     0x13e8,73740,    -- Scroll of Boost-VIT
     0x13eb,77500,    -- Scroll of Boost-MND
     0x13e9,85680,    -- Scroll of Boost-AGI
     0x13ec,81900,    -- Scroll of Boost-CHR
     0x12f1,130378}    -- Scroll of Addle

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



