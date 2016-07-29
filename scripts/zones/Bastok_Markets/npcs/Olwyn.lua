-----------------------------------
-- Area: Bastok Markets
-- NPC: Olwyn
-- Standard Merchant NPC
--
-- Updated Aug-09-2013 by Zerahn, based on bgwiki and gamerescape
-----------------------------------

require("scripts/globals/events/harvest_festivals");
require("scripts/globals/shop");
package.loaded["scripts/zones/Bastok_Markets/TextIDs"] = nil;
require("scripts/zones/Bastok_Markets/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    onHalloweenTrade(player,trade,npc)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:showText(npc,OLWYN_SHOP_DIALOG);

    stock = {
        0x1020,   445,1,     --Ether

        0x1037,   736,2,     --Echo Drops
        0x1010,   837,2,     --Potion

        0x1036,  2387,3,     --Eye Drops
        0x1034,   290,3      --Antidote
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
