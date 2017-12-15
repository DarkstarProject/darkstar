-----------------------------------
-- Area: Port Windurst
--  NPC: Kucha Malkobhi
-- Standard Merchant NPC
-- Confirmed shop stock, August 2013
-----------------------------------
require("scripts/globals/shop");
package.loaded["scripts/zones/Port_Windurst/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Port_Windurst/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:showText(npc,KUCHAMALKOBHI_SHOP_DIALOG);

    stock = {
        0x315b,   273,       --Tarutaru Kaftan
        0x31d4,   163,       --Tarutaru Mitts
        0x3256,   236,       --Tarutaru Braccae
        0x32cf,   163,       --Tarutaru Clomps
        0x315c,   273,       --Mithran Separates
        0x31d5,   163,       --Mithran Gauntlets
        0x3257,   236,       --Mithran Loincloth
        0x32d0,   163        --Mithran Gaiters
    }
    showShop(player, STATIC, stock);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;
