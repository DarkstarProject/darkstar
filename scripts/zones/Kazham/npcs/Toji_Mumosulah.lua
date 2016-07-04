-----------------------------------
-- Area: Kazham
-- NPC: Toji Mumosulah
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

player:showText(npc,TOJIMUMOSULAH_SHOP_DIALOG);

stock = {0x0070,456,        -- Yellow Jar
     0x338F,95,        -- Blood Stone
     0x3314,3510,        -- Fang Necklace
     0x3409,1667,        -- Bone Earring
     0x43C7,4747,        -- Gemshorn
     0x4261,69,        -- Peeled Crayfish
     0x4266,36,        -- Insect Paste
     0x45D4,165,        -- Fish Broth
     0x45D8,695,        -- Seedbed Soil
     0x03FD,450,        -- Hatchet
     0x137B,328,        -- Scroll of Army's Paeon II
     0x13d7,64528,        -- Scroll of Foe Lullaby II
     0x137C,3312,        -- Scroll of Army's Paeon III
     0x1364,8726}        -- Scroll of Monomi: Ichi
 
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



