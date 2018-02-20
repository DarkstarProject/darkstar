-----------------------------------
-- Area: Port Windurst
--  NPC: Uli Pehkowa
-- Standard Merchant NPC
-- Confirmed shop stock, August 2013
-----------------------------------
require("scripts/globals/shop");
package.loaded["scripts/zones/Port_Windurst/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Port_Windurst/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:showText(npc,ULIPEHKOWA_SHOP_DIALOG);

    stock = {
        0x0284,  1840,1,     --Mythril Ore
        0x0343,   230,1,     --Flax Flower
        0x02BB,  5814,1,     --Oak Log

        0x02BA,    87,2,     --Ash Log
        0x02B6,  2599,2,     --Chestnut Log
        0x0280,    11,2,     --Copper Ore
        0x0283,   828,2,     --Iron Ore
        0x11DA,    51,2,     --Bird egg

        0x0341,    18,3,     --Moko Grass
        0x0072,  1840,3      --My First Magic Kit
    }
    showNationShop(player, NATION_WINDURST, stock);

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;
