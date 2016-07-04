-----------------------------------
-- Area: Windurst Woods
-- NPC:  Manyny
-- Standard Merchant NPC
-- Confirmed shop stock, August 2013
-----------------------------------

require("scripts/globals/shop");
package.loaded["scripts/zones/Windurst_Woods/TextIDs"] = nil;
require("scripts/zones/Windurst_Woods/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:showText(npc,MANYNY_SHOP_DIALOG);

    stock = {
        0x13A8,  3112,       --Sinewy Etude
        0x13A9,  2784,       --Dextrous Etude
        0x13AA,  2184,       --Vivacious Etude
        0x13AB,  1892,       --Quick Etude
        0x13AC,  1550,       --Learned Etude
        0x13AD,  1252,       --Spirited Etude
        0x13AE,   990        --Enchanting Etude
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
