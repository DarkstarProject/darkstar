-----------------------------------
-- Area: Port Windurst
-- NPC: Guruna-Maguruna
-- Standard Merchant NPC
-- Confirmed shop stock, August 2013
-----------------------------------

require("scripts/globals/shop");
package.loaded["scripts/zones/Port_Windurst/TextIDs"] = nil;
require("scripts/zones/Port_Windurst/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:showText(npc,GURUNAMAGURUNA_SHOP_DIALOG);

    stock = {
        0x3322,  4201,1,     --Beetle Gorget
        0x3139,  2776,1,     --Linen Robe
        0x31B9,  1570,1,     --Linen Cuffs

        0x3140,  1260,2,     --Tunic
        0x3131, 12355,2,     --Cotton Doublet
        0x3198,   324,2,     --Leather Gloves
        0x31C0,   589,2,     --Mitts
        0x31B1,  6696,2,     --Cotton Gloves

        0x331D,   972,3,     --Hemp Gorget
        0x3130,  2470,3,     --Doublet
        0x3138,   216,3,     --Robe
        0x3118,   604,3,     --Leather Vest
        0x31B0,  1363,3,     --Gloves
        0x31B8,   118,3      --Cuffs
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
