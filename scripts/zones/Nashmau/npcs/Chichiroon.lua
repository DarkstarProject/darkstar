-----------------------------------
-- Area: Nashmau
-- NPC: Chichiroon
-- Standard Merchant NPC
-----------------------------------
package.loaded["scripts/zones/Nashmau/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Nashmau/TextIDs");
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
    
player:showText(npc,CHICHIROON_SHOP_DIALOG);

stock = {0x1579,99224,    --Bolter's Die
     0x157a,85500,    --Caster's Die
     0x157b,97350,    --Courser's Die
     0x157c,100650,    --Blitzer's Die
     0x157d,109440,    --Tactician's Die
     0x157e,116568}    --Allies' Die
 
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



