-----------------------------------
-- Area: Port Bastok
-- NPC: Numa
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
    player:showText(npc,NUMA_SHOP_DIALOG);

    stock = {
        0x30A9,  5079,1,     --Cotton Hachimaki
        0x3129,  7654,1,     --Cotton Dogi
        0x31A9,  4212,1,     --Cotton Tekko
        0x3229,  6133,1,     --Cotton Sitabaki
        0x32A9,  3924,1,     --Cotton Kyahan
        0x3395,  3825,1,     --Silver Obi

        0x30A8,   759,2,     --Hachimaki
        0x3128,  1145,2,     --Kenpogi
        0x31A8,   630,2,     --Tekko
        0x3228,   915,2,     --Sitabaki
        0x32A8,   584,2,     --Kyahan
        0x02C0,   132,2,     --Bamboo Stick

        0x025D,   180,3,     --Pickaxe
        0x16EB, 13500,3,     --Toolbag (Ino)
        0x16EC, 18000,3,     --Toolbag (Shika)
        0x16ED, 18000,3      --Toolbag (Cho)
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
