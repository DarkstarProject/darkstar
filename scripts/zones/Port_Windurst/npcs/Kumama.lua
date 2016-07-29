-----------------------------------
-- Area: Port Windurst
-- NPC: Kumama
-- Standard Merchant NPC
-- Confirmed shop stock, August 2013
-----------------------------------

require("scripts/globals/shop");
package.loaded["scripts/zones/Port_Windurst/TextIDs"] = nil;
require("scripts/zones/Port_Windurst/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:showText(npc,KUMAMA_SHOP_DIALOG);

    stock = {
        0x3239,  2268,1,     --Linen Slops
        0x32b9,  1462,1,     --Holly Clogs
        0x3004,  4482,1,     --Mahogany Shield

        0x3218,   482,2,     --Leather Trousers
        0x3231,  9936,2,     --Cotton Brais
        0x3298,   309,2,     --Leather Highboots
        0x32c0,   544,2,     --Solea
        0x32b1,  6633,2,     --Cotton Gaiters
        0x3002,   556,2,     --Maple Shield

        0x3230,  1899,3,     --Brais
        0x3238,   172,3,     --Slops
        0x32b0,  1269,3,     --Gaiters
        0x32b8,   111,3,     --Ash Clogs
        0x3001,   110,3      --Lauan Shield
    }
    showNationShop(player, WINDURST, stock);
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
