-----------------------------------
-- Area: Bastok Markets
-- NPC: Peritrage
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
    player:showText(npc,PERITRAGE_SHOP_DIALOG);

    stock = {
        0x4100,   284,3,     --Bronze Axe
        0x4101,  1435,3,     --Brass Axe
        0x4140,   604,3,     --Butterfly Axe
        0x4141,  4095,3,     --Greataxe
        0x4051,   147,3,     --Bronze Knife
        0x4052,  2182,3,     --Knife
        0x4040,   140,3,     --Bronze Dagger
        0x4041,   837,3,     --Brass Dagger
        0x4042,  1827,3      --Dagger
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
