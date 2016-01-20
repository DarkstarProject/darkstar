-----------------------------------
--    Area: Mhaura
--    NPC:  Tya Padolih
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
    
player:showText(npc,TYAPADOLIH_SHOP_DIALOG);

stock = {0x126c,4147,  --Scroll of Regen
         0x126e,7516,  --Scroll of Regen II
         0x1311,10752, --Scroll of Sleepga
         0x1252,29030, --Scroll of Baramnesia
         0x1253,29030, --Scroll of Baramnesra
         0x1288,5523,  --Scroll of Invisible
         0x1289,2400,  --Scroll of Sneak
         0x128a,1243,  --Scroll of Deodorize
         0x1330,18032} --Scroll of Distract
 
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