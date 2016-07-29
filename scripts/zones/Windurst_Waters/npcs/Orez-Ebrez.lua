-----------------------------------
-- Area: Windurst Waters
-- NPC:  Orez-Ebrez
-- Standard Merchant NPC
-- Confirmed shop stock, August 2013
-----------------------------------

require("scripts/globals/shop");
package.loaded["scripts/zones/Windurst_Waters/TextIDs"] = nil;
require("scripts/zones/Windurst_Waters/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:showText(npc,OREZEBREZ_SHOP_DIALOG);

    stock = {
        0x30B2, 20000,1,     --Red Cap
        0x30AA,  8972,1,     --Soil Hachimaki
        0x30A7,  7026,1,     --Beetle Mask

        0x30B8,   144,2,     --Circlet
        0x30B1,  8024,2,     --Cotton Headgear
        0x3098,   396,2,     --Leather Bandana
        0x30B9,  1863,2,     --Poet's Circlet
        0x30D3, 14400,2,     --Flax Headband
        0x30A9,  3272,2,     --Cotton Hachimaki
        0x30A6,  3520,2,     --Bone Mask
        0x30BA, 10924,2,     --Wool Hat

        0x30B0,  1742,3,     --Headgear
        0x30A8,   552,3,     --Hachimaki
        0x30D2,  1800,3,     --Cotton Headband
        0x30A0,   151,3,     --Bronze Cap
        0x30A1,  1471,3      --Brass Cap
    } 
    showNationShop(player, WINDURST, stock);

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
