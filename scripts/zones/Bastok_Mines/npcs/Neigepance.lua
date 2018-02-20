-----------------------------------
-- Area: Bastok Mines
--  NPC: Neigepance
-- Standard Merchant NPC
-----------------------------------
require("scripts/globals/shop");
package.loaded["scripts/zones/Bastok_Mines/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Bastok_Mines/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:showText(npc,NEIGEPANCE_SHOP_DIALOG);

    stock = {
        0x439B,     9,1,     --Dart
        0x034D,  1150,1,     --Black Chocobo Feather
        0x11C1,    62,3,     --Gysahl Greens
        0x0348,     7,3,     --Chocobo Feather
        0x4278,    11,3,     --Pet Food Alpha Biscuit
        0x4279,    82,3,     --Pet Food Beta Biscuit
        0x45C4,    82,3,     --Carrot Broth
        0x45C6,   695,3,     --Bug Broth
        0x45C8,   126,3,     --Herbal Broth
        0x45CA,   695,3,     --Carrion Broth
        0x13D1, 50784,3      --Scroll of Chocobo Mazurka
    }
    showNationShop(player, NATION_BASTOK, stock);

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;
