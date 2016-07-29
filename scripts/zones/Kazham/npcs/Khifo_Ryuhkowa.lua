-----------------------------------
-- Area: Kazham
-- NPC: Khifo Ryuhkowa
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

player:showText(npc,KHIFORYUHKOWA_SHOP_DIALOG);

stock = {0x4059,5713,        -- Kukri
     0x40D3,153014,        -- Ram-Dao
     0x41C1,809,        -- Bronze Spear
     0x41C3,16228,        -- Spear
     0x41C7,75541,        -- Partisan
     0x4281,1600,        -- Chestnut Club
     0x4282,4945,        -- Bone Cudgel
     0x429C,5255,        -- Chestnut Wand
     0x42C4,29752,        -- Mahogany Staff
     0x42CB,99176,        -- Mahogany Pole
     0x430B,39744,        -- Battle Bow
     0x439C,55,        -- Hawkeye
     0x4380,1610,        -- Boomerang
     0x43A6,3}        -- Woden Arrow
 
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



