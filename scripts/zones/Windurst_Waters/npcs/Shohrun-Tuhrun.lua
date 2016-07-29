-----------------------------------
-- Area: Windurst Waters
-- NPC:  Shohrun-Tuhrun
-- Standard Merchant NPC
-- Confirmed shop stock, August 2013
-----------------------------------

require("scripts/globals/shop");
package.loaded["scripts/zones/Windurst_Waters/TextIDs"] = nil;
require("scripts/zones/Windurst_Waters/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:showText(npc,SHOHRUNTUHRUN_SHOP_DIALOG);

    stock = {
        0x1239, 18000,1,     --Haste

        0x120C,  5178,2,     --Scroll of Raise
        0x1218, 10080,2,     --Scroll of Dia II
        0x121D,  8100,2,     --Scroll of Banish II
        0x122C,  6366,2,     --Scroll of Protect II
        0x1231, 15840,2,     --Scroll of Shell II
        0x1264,  4644,2,     --Scroll of Enfire
        0x1265,  3688,2,     --Scroll of Enblizzard
        0x1266,  2250,2,     --Scroll of Enaero
        0x1267,  1827,2,     --Scroll of Enstone
        0x1268,  1363,2,     --Scroll of Enthunder
        0x1269,  6366,2,     --Scroll of Enwater

        0x1203,  3261,3,     --Scroll of Cure III
        0x122E, 78200,3,     --Scroll of Protect IV
        0x1280, 74520,3,     --Scroll of Protectra IV
        0x1304, 64400,3      --Scroll of Dispel
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
