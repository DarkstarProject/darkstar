-----------------------------------
-- Area: Port Bastok
-- NPC: Galvin
-- Standard Merchant NPC
-- Confirmed shop stock, August 2013
-----------------------------------

require("scripts/globals/shop");
package.loaded["scripts/zones/Port_Bastok/TextIDs"] = nil;
require("scripts/zones/Port_Bastok/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:showText(npc,GALVIN_SHOP_DIALOG);
    stock = {
        0x1020,  4445,1,     --Ether

        0x1037,   736,2,     --Echo Drops
        0x1010,   837,2,     --Potion
        0x43A6,     3,2,     --Wooden Arrow

        0x1036,  2387,3,     --Eye Drops
        0x1034,   290,3,     --Antidote
        0x43A8,     7,3,     --Iron Arrow
        0x43B8,     5,3      --Crossbow Bolt
    }
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
