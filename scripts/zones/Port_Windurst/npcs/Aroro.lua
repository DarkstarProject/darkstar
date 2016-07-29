-----------------------------------
-- Area: Port Windurst
-- NPC: Aroro
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
    player:showText(npc,ARORO_SHOP_DIALOG);

    stock = {
        0x12FE,   114,1,     --Blind

        0x12DC,    84,2,     --Poison
        0x12E6,   368,2,     --Bio
        0x12FD,  2300,2,     --Sleep

        0x129F,    62,3,     --Stone
        0x12A9,   143,3,     --Water
        0x129A,   331,3,     --Aero
        0x1290,   855,3,     --Fire
        0x1295,  1619,3,     --Blizzard
        0x12A4,  3334,3,     --Thunder
        0x12EB,  4747,3,     --Burn
        0x12EC,  3770,3,     --Frost
        0x12ED,  2300,3,     --Choke
        0x12EE,  1867,3,     --Rasp
        0x12EF,  1393,3,     --Shock
        0x12F0,  6508,3      --Drown
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
