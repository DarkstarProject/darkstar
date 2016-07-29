-----------------------------------
--    Area: Mhaura
--    NPC:  Pikini-Mikini
--    Standard Merchant NPC
--    @pos -48 -4 30 249
-----------------------------------
package.loaded["scripts/zones/Mhaura/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/shop");
require("scripts/zones/Mhaura/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

player:showText(npc,PIKINIMIKINI_SHOP_DIALOG);

stock = {0x1036,2335,  --Eye Drops
         0x1034,284,   --Antidote
         0x1037,720,   --Echo Drops
         0x1010,819,   --Potion
         0x119d,10,       --Distilled Water
         0x395,1821,   --Parchment
         0x43f3,9,       --Lugworm
         0x3fd,450,       --Hatchet
         0x1118,108,   --Meat Jerky
         0x14b3,133,   --Salsa
         0x0b33,9000}  --Mhaura Waystone
 
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