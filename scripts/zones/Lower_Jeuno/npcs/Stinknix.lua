-----------------------------------
-- Area: Lower Jeuno
-- NPC: Stinknix
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
    
player:showText(npc,STINKNIX_SHOP_DIALOG);

stock = {0x03AF,294,        -- Poison Dust
     0x03B0,1035,        -- Venom Dust
     0x03B1,2000,        -- Paralysis Dust
     0x43A8,7,      -- Iron Arrow
     0x43B8,5,      -- Crossbow Bolt
     0x43A1,1107,        -- Grenade
     0x0b31,10000        -- Dutchy Waystone
    }
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



