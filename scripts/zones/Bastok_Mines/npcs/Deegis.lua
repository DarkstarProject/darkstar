-----------------------------------
-- Area: Bastok Mines
-- NPC: Deegis
-- Standard Merchant NPC
-----------------------------------

require("scripts/globals/shop");
package.loaded["scripts/zones/Bastok_Mines/TextIDs"] = nil;
require("scripts/zones/Bastok_Mines/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:showText(npc,DEEGIS_SHOP_DIALOG);

    stock = {
        0x30A2, 18360,1,     --Padded Cap
        0x3088,  9234,1,     --Iron Mask
        0x3122, 28339,1,     --Padded Armor
        0x31A2, 15552,1,     --Iron Mittens

        0x30A1,  1471,2,     --Brass Cap
        0x3098,   396,2,     --Leather Bandana
        0x3121,  2236,2,     --Brass Harness
        0x3118,   604,2,     --Leather Vest
        0x31A1,  1228,2,     --Brass Mittens
        0x3198,   324,2,     --Leather Gloves

        0x30A0,   151,3,     --Bronze Cap
        0x3120,   230,3,     --Bronze Harness
        0x3108, 14256,3,     --Chainmail
        0x31A0,   126,3,     --Bronze Mittens
        0x3188,  7614,3         --Chain Mittens
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
