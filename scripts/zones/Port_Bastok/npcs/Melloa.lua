-----------------------------------
-- Area: Port Bastok
-- NPC: Melloa
-- Standard Merchant NPC
-- Confirmed shop stock, August 2013
-----------------------------------

require("scripts/globals/shop");
package.loaded["scripts/zones/Port_Bastok/TextIDs"] = nil;
require("scripts/zones/Port_Bastok/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:showText(npc,MELLOA_SHOP_DIALOG);

    stock = {
        0x11EF,   147,1,     --Pumpernickel
        0x1141,  3036,1,     --Egg Soup
        0x115A,   368,1,     --Pineapple Juice

        0x1127,    22,2,     --Bretzel
        0x11E2,   143,2,     --Sausage
        0x1148,  1012,2,     --Melon Juice
        0x1155,   662,2,     --Roast Mutton

        0x1193,    92,3,     --Iron Bread
        0x1154,   294,3,     --Baked Popoto
        0x1167,   184,3,     --Pebble Soup
        0x119D,    10,3      --Distilled Water
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
