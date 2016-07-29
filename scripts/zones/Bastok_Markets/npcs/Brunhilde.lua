-----------------------------------
-- Area: Bastok Markets
-- NPC: Brunhilde
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
    player:showText(npc,BRUNHILDE_SHOP_DIALOG);

    stock = {
        0x30A0,   151,3,     --Bronze Cap
        0x3090,  1305,3,     --Faceguard
        0x3091, 11520,3,     --Brass Mask
        0x3080, 28674,3,     --Sallet
        0x3120,   230,3,     --Bronze Harness
        0x3110,  2007,3,     --Scale Mail
        0x3111, 17539,3,     --Brass Scale Mail
        0x31A0,   126,3,     --Bronze Mittens
        0x3190,  1071,3,     --Scale Finger Gauntlets
        0x3191,  9273,3      --Brass Finger Gauntlets
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
