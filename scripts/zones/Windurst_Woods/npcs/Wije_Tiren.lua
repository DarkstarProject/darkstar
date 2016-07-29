-----------------------------------
-- Area: Windurst Woods
-- NPC:  Wije Tiren
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
    player:showText(npc,WIJETIREN_SHOP_DIALOG);

    stock = {
        0x1034,   290,       --Antidote
        0x119d,    10,       --Distilled Water
        0x1037,   728,       --Echo Drops
        0x1020,  4445,       --Ether
        0x1036,  2387,       --Eye Drops
        0x1010,   837,       --Potion
        0x1396,    98,       --Scroll of Herb Pastoral
        0x0b30,  9200        --Federation Waystone
    }
    showShop(player, WINDURST, stock);

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
