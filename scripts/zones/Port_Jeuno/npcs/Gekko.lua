-----------------------------------
-- Area: Port Jeuno
--  NPC: Gekko
-- Standard Merchant NPC
-----------------------------------
package.loaded["scripts/zones/Port_Jeuno/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Port_Jeuno/TextIDs");
require("scripts/globals/shop");


function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    player:showText(npc,GEKKO_SHOP_DIALOG);
    local stock =
    {
        0x1036,2387,     -- Eye Drops
        0x1034,290,      -- Antidote
        0x1037,367,      -- Echo Drops
        0x1010,837,      -- Potion
        0x1020,4445,     -- Ether
        0x110d,120,      -- Rolanberry
        0x00bd,36000,    -- Autumn's End
        0x00bc,31224,    -- Acolyte's Grief
        0x13dd,50400     -- Scroll of Regen IV
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
