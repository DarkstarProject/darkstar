-----------------------------------
-- Area: Aht Urhgan Whitegate
-- NPC: Mazween
-- Standard Merchant NPC
-----------------------------------
package.loaded["scripts/zones/Aht_Urhgan_Whitegate/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Aht_Urhgan_Whitegate/TextIDs");
require("scripts/globals/shop");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

player:showText(npc,MAZWEEN_SHOP_DIALOG);

stock = {0x1313,11200,        -- Scroll of Sleepga
     0x12A6,18720,        -- Scroll of Sleep II
     0x1292,25200,        -- Poison II
     0x12E7,14000,        -- Bio II
     0x1296,5160,        -- Poisonga
     0x1316,19932,        -- Stone III
     4779,22682,        -- Water III
     0x12DD,27744,        -- Aero III
     0x129C,33306,        -- Fire III
     0x12E1,39368,        -- Blizzard III
     0x12F6,45930,        -- Thunder III
     0x1303,27000,        -- Absorb-TP
     0x1311,44000,        -- Absorb-ACC
     0x12A1,30780,        -- Drain II
     0x1315,70560,        -- Dread Spikes
     4856,79800}        -- Aspir II

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



