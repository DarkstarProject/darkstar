-----------------------------------
-- Area: Bastok Markets
-- NPC: Carmelide
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
    player:showText(npc,CARMELIDE_SHOP_DIALOG);

    stock = {
        0x0326,  1676,2,     --Tourmaline
        0x0327,  1676,2,     --Sardonyx
        0x0320,  1676,2,     --Amethyst
        0x032E,  1676,2,     --Amber
        0x031B,  1676,2,     --Lapis Lazuli
        0x0329,  1676,2,     --Clear Topaz
        0x031F,  1676,2,     --Onyx
        0x031C,  1676,2,     --Light Opal
        0x348E,    68,3      --Copper Ring
    }
    showNationShop(player, SANDORIA, stock);

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
