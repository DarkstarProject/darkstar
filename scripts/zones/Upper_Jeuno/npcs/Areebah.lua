-----------------------------------
-- Area: Upper Jeuno
-- NPC: Areebah
-- Standard Merchant NPC
-----------------------------------
package.loaded["scripts/zones/Upper_Jeuno/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Upper_Jeuno/TextIDs");
require("scripts/globals/shop");

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:showText(npc, MP_SHOP_DIALOG);

    local stock =
    {
        636, 119,    --Chamomile
        951, 110,    --Wijnruit
        948,  60,    --Carnation
        941,  80,    --Red Rose
        949,  96,    --Rain Lily
        956, 120,    --Lilac
        957, 120,    --Amaryllis
        958, 120,    --Marguerite
        2370,520     --Flower Seeds
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