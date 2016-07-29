-----------------------------------
-- Area: Windurst Waters (S)
-- NPC: Pelftrix
-- Standard Merchant NPC
-----------------------------------
package.loaded["scripts/zones/Windurst_Waters_[S]/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/shop");
require("scripts/zones/Windurst_Waters_[S]/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
player:showText(npc,PELFTRIX_SHOP_DIALOG);

stock = {0x1014,4500,        -- Hi-Potion
        0x1024,28000,        -- Hi-Ether
        0x03FC,300,            -- Sickle
        0x03FD,500}            -- Hatchet
 
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



