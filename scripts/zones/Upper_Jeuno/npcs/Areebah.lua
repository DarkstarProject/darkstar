-----------------------------------
-- Area: Upper Jeuno
-- NPC: Areebah
-- Standard Merchant NPC
-----------------------------------

require("scripts/globals/shop");
package.loaded["scripts/zones/Upper_Jeuno/TextIDs"] = nil;
require("scripts/zones/Upper_Jeuno/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
player:showText(npc,AREEBAH_SHOP_DIALOG);

stock = {0x027C,119,    --Chamomile
    0x03B7,110,    --Wijnruit
    0x03B4,60,    --Carnation
    0x03AD,80,    --Red Rose
    0x03B5,96,    --Rain Lily
    0x03BC,120,    --Lilac
    0x03BD,120,    --Amaryllis
    0x03BE,120,    --Marguerite
    0x1199,520}    --Flower Seeds
 
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



