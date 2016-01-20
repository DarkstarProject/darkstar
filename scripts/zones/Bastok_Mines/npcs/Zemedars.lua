-----------------------------------
-- Area: Bastok Mines
-- NPC: Zemedars
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
    player:showText(npc,ZEMEDARS_SHOP_DIALOG);

    stock = {
        0x3224, 23316,1,     --Iron Subligar
        0x3219,  5003,1,     --Lizard Trousers
        0x32A2, 14484,1,     --Leggins
        0x3299,  3162,1,     --Lizard Ledelsens
        0x300D, 31544,1,     --Buckler

        0x3221,  1840,2,     --Brass Subligar
        0x3218,   493,2,     --Leather Trousers
        0x32A1,  1140,2,     --Brass Leggins
        0x3298,   309,2,     --Leather Highboots
        0x300C, 11076,2,     --Targe

        0x3220,   191,3,     --Bronze Subligar
        0x3208, 11592,3,     --Chain Gose
        0x32A0,   117,3,     --Bronze Leggins
        0x3288,  7120,3,     --Greaves
        0x3002,   556,3,      --Maple Shield
        0x3001,   110,3      --Lauan Shield
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
