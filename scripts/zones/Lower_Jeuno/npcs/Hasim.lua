-----------------------------------
-- Area: Lower Jeuno
-- NPC: Hasim
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
    
player:showText(npc,HASIM_SHOP_DIALOG);

stock = {0x1244,930,        -- Scroll of Baraera
     0x123e,930,        -- Scroll of Baraero
     0x1243,3624,        -- Scroll of Barblizzara
     0x123d,3624,        -- Scroll of Barblizzard
     0x1242,1760,        -- Scroll of Barfira
     0x123c,1760,        -- Scroll of Barfire
     0x1245,156,        -- Scroll of Barstonra
     0x123f,156,        -- Scroll of Barstone
     0x1246,5754,        -- Scroll of Barthundra
     0x1240,5754,        -- Scroll of Barthunder
     0x1247,360,        -- Scroll of Barwatera
     0x1241,360,        -- Scroll of Barwater
     0x1208,11200,        -- Scroll of Curaga II
     0x1209,19932,        -- Scroll of Curaga III
     0x1204,23400,        -- Scroll of Cure IV
     0x122d,32000}        -- Scroll of Protect III
 
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



