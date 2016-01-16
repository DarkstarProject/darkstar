-----------------------------------
-- Area: Batok Markets
-- NPC: Zaira
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
    player:showText(npc,ZAIRA_SHOP_DIALOG);

    stock = {
        0x12FE,   111,1,     --Scroll of Blind

        0x12E6,   360,2,     --Scroll of Bio
        0x12DC,    82,2,     --Scroll of Poison
        0x12FD,  2250,2,     --Scroll of Sleep

        0x129F,    61,3,     --Scroll of Stone
        0x12A9,   140,3,      --Scroll of Water
        0x129A,   324,3,     --Scroll of Aero
        0x1290,   837,3,     --Scroll of Fire
        0x1295,  1584,3,     --Scroll of Blizzard
        0x12A4,  3261,3,     --Scroll of Thunder
        0x12EF,  1363,3,     --Scroll of Shock
        0x12EE,  1827,3,     --Scroll of Rasp
        0x12ED,  2250,3,     --Scroll of Choke
        0x12EC,  3688,3,     --Scroll of Frost
        0x12EB,  4644,3,     --Scroll of Burn
        0x12F0,  6366,3,     --Scroll of Drown
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
