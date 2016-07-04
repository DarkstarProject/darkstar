-----------------------------------
-- Area: Bastok Markets
-- NPC: Charging Chocobo
-- Standard Merchant NPC
--
-- Updated Aug-09-2013 by Zerahn, based on bgwiki and gamerescape
-----------------------------------

require("scripts/globals/shop");
package.loaded["scripts/zones/Bastok_Markets/TextIDs"] = nil;
require("scripts/zones/Bastok_Markets/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:showText(npc,CHARGINGCHOKOBO_SHOP_DIALOG);

    stock = {
        0x3220,   191,3,     --Bronze Subligar
        0x3210,  1646,3,     --Scale Cuisses
        0x3211, 14131,3,     --Brass Cuisses
        0x3200, 34776,3,     --Cuisses
        0x32A0,   117,3,     --Bronze Leggins
        0x3290,   998,3,     --Scale Greaves
        0x3291,  8419,3,     --Brass Greaves
        0x3280, 21859,3,     --Plate Leggins
        0x3318, 16891,3,     --Gorget
        0x3388,   382,3,     --Leather Belt
        0x338C, 10166,3      --Silver Belt
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
