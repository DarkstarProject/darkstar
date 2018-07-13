-----------------------------------
-- Area: Tavnazian Safehold
--  NPC: Misseulieu
-- Standard Merchant NPC
-----------------------------------
require("scripts/globals/shop");
package.loaded["scripts/zones/Tavnazian_Safehold/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Tavnazian_Safehold/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    player:showText(npc,MISSEULIEU_SHOP_DIALOG);

    local stock =
    {
        12577,2485,        -- Brass Harness
     12985,1625,        -- Holly Clogs
     14317,4042200,        -- Barone Cosciales (Available after COP Chapter 4 only)
     15305,25210200,        -- Barone Gambieras (Available after COP Chapter 4 only)
     14848,7276200,        -- Barone Manopolas (Available after COP Chapter 4 only)
     15389,8000000,        -- Vir Subligar (Available after COP Chapter 4 only)
     15390,8000000}        -- Femina Subligar (Available after COP Chapter 4 only)

    dsp.shop.general(player, stock);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

