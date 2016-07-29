-----------------------------------
-- Area: Metalworks
-- NPC:  Nogga
-- Standard Merchant NPC
-----------------------------------
package.loaded["scripts/zones/Metalworks/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/shop");
require("scripts/zones/Metalworks/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
player:showText(npc,NOGGA_SHOP_DIALOG);

stock = {0x43A4,675,2,        -- Bomb Arm

     0x43A1,1083,3,        -- Grenade
     0x0ae8,92,3}        -- Catalytic Oil
 
showNationShop(player, BASTOK, stock);
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



