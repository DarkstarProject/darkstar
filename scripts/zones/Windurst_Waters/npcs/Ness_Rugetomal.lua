-----------------------------------
-- Area: Windurst Waters
-- NPC:  Ness Rugetomal
-- Standard Merchant NPC
-- Confirmed shop stock, August 2013
-----------------------------------

require("scripts/globals/events/harvest_festivals")
require("scripts/globals/shop");
package.loaded["scripts/zones/Windurst_Waters/TextIDs"] = nil;
require("scripts/zones/Windurst_Waters/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    onHalloweenTrade(player,trade,npc);
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:showText(npc,NESSRUGETOMALL_SHOP_DIALOG);

    stock = {
        0x112A,    10,1,     --Ginger Cookie
        0x1137,   727,1,     --Carp Sushi
        0x1149,   323,1,     --Tomato Juice
        0x116B,  1656,1,     --Nebimonite Bake

        0x112D,    14,2,     --Cinna-cookie
        0x1146,   184,2,     --Orange Juice
        0x1168,  2070,2,     --Boiled Crab

        0x119E,    21,3,     --Acorn Cookie
        0x1118,   108,3,     --Meat Jerky
        0x119D,    10,3,     --Distilled Water
        0x11BA,   846,3      --Roast Pipira
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
