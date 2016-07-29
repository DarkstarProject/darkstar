-----------------------------------
-- Area: Port Windurst
-- NPC: Kususu 
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
    player:showText(npc,KUSUSU_SHOP_DIALOG);

    stock = {
        0x1221,  1165,1,     --Diaga
        0x1236,  7025,1,     --Stoneskin
        0x1238,   837,1,     --Slow 

        0x1202,   585,2,     --Cure II
        0x121c,   140,2,     --Banish 
        0x1226,  1165,2,     --Banishga
        0x1235,  2097,2,     --Blink 

        0x1201,    61,3,     --Cure
        0x1207,  1363,3,     --Curaga
        0x120e,   180,3,     --Poisona
        0x120f,   324,3,     --Paralyna
        0x1210,   990,3,     --Blindna
        0x1217,    82,3,     --Dia
        0x122b,   219,3,     --Protect
        0x1230,  1584,3,     --Shell
        0x1237,   360,3      --Aquaveil
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
