-----------------------------------
-- Area: Windurst Woods
--  NPC: Mono Nchaa
-- Standard Merchant NPC
-- Confirmed shop stock, August 2013
-----------------------------------
require("scripts/globals/shop");
package.loaded["scripts/zones/Windurst_Woods/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Windurst_Woods/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:showText(npc,MONONCHAA_SHOP_DIALOG);

    stock = {
        0x43A6,     3,2,     --Wooden Arrow
        0x439C,    55,2,     --Hawkeye
        0x4340,   165,2,     --Light Crossbow

        0x43A7,     4,3,     --Bone Arrow
        0x43B8,     5,3,     --Crossbow Bolt
        0x1391,  2649,3      --Scroll of Hunter's Prelude
    }
    showNationShop(player, NATION_WINDURST, stock);

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;
