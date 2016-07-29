-----------------------------------
-- Area: Bastok Markets
-- NPC: Zhikkom
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
    player:showText(npc,ZHIKKOM_SHOP_DIALOG);

    stock = {
        0x4097, 241,3,       --Bronze Sword
        0x4098,7128,3,       --Iron Sword
        0x4085,9201,3,       --Degen
        0x40A7, 698,3,       --Sapara
        0x40A8,4072,3,       --Scimitar
        0x4092, 618,3,       --Xiphos
        0x40B5,1674,3,       --Spatha
        0x4080,3215,3        --Bilbo (value may be off)
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
