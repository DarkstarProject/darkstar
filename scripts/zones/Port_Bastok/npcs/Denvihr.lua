-----------------------------------
-- Area: Port Bastok
-- NPC: Denvihr
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
    player:showText(npc,DENVIHR_SHOP_DIALOG);

    stock = {
        0x02BB,  5688,1,     --Oak Log
        0x0284,  1800,1,     --Mythril Ore
        0x0343,   225,1,     --Flax Flower

        0x02BA,    86,2,     --Ash Log
        0x02B6,  2543,2,     --Chestnut Log
        0x0283,   810,2,     --Iron Ore
        0x0341,    18,2,     --Moko Grass
        0x11DA,    50,2,     --Bird Egg

        0x0280,    10,3,     --Copper Ore
        0x0088,  1800,3      --Kaiserin Cosmetics
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
